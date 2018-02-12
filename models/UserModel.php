<?php

class UserModel extends Model
{
    protected static $instance;

    const TABLE = 'accounts';

    public function addStudent($name, $fname, $email, $password, $phone, $token)
    {
        return $this->DB->insert(self::TABLE, [
            'name' => $name,
            'fname' => $fname,
            'email' => $email,
            'password' => self::getHashForPassword($password),
            'phone' => $phone,
            'confirm_token' => $token
        ]);
    }

    public function getUserByEmail($email)
    {
        $result = $this->DB->selectAsAssoc("select * from " . self::TABLE . " where `email`=:email", ['email' => $email]);
        return self::getFirstResultIfSingleOrFalse($result);
    }

    public function getUserById($user_id)
    {
        $result = $this->DB->selectAsAssoc("select * from " . self::TABLE . " where `id`=:id", ['id' => (int)$user_id]);
        return self::getFirstResultIfSingleOrFalse($result);
    }

    public function getUserByConfirmToken($token)
    {
        $result = $this->DB->selectAsAssoc("select * from " . self::TABLE . " where `confirm_token`=:token", ['token' => $token]);
        return self::getFirstResultIfSingleOrFalse($result);
    }

    public function getUserByEmailAndPassword($email, $password)
    {
        $password = self::getHashForPassword($password);
        $data = ['email' => $email, 'password' => $password];
        $q = 'select * from ' . self::TABLE . ' where `email`=:email and `password`=:password';
        $result = $this->DB->selectAsAssoc($q, $data);
        return self::getFirstResultIfSingleOrFalse($result);
    }

    public function confirmUserByToken($token)
    {
        return $this->DB->update('update ' . self::TABLE . ' set `is_confirmed`=1 where `confirm_token`=:token', ['token' => $token]);
    }

    public function isEmailExists($email)
    {
        $result = $this->DB->selectAsAssoc("select `email` from " . self::TABLE . " where `email`=:email", ['email' => $email]);
        return (bool)count($result);
    }

    private static function getFirstResultIfSingleOrFalse(array $result)
    {
        if (count($result) != 1) {
            return false;
        }

        return $result[0];
    }

    private static function getHashForPassword($password)
    {
        $salt1 = $password[0];
        $last_index = strlen($password) - 1;
        $salt2 = $password[$last_index];
        $salt3 = 'kimberg_school';
        return md5($salt1 . $password . $salt2 . $salt3);
    }
}
