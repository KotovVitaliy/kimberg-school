<?php

class UserModel extends Model
{
    protected static $instance;

    const TABLE = 'accounts';

    public function addStudent($name, $fname, $email, $password)
    {
        return $this->DB->insert(self::TABLE, [
            'name' => $name,
            'fname' => $fname,
            'email' => $email,
            'password' => self::getHashForPassword($password)
        ]);
    }

    public function getUserByEmail($email)
    {
        $result = $this->DB->selectAsAssoc("select * from " . self::TABLE . " where `email`=:email", ['email' => $email]);
        if (count($result) !== 1) {
            return false;
        }
        return $result[0];
    }

    public function getUserById($user_id)
    {
        $result = $this->DB->selectAsAssoc("select * from " . self::TABLE . " where `id`=:id", ['id' => (int)$user_id]);
        if (count($result) !== 1) {
            return false;
        }
        return $result[0];
    }

    public function isEmailExists($email)
    {
        $result = $this->DB->selectAsAssoc("select `email` from " . self::TABLE . " where `email`=:email", ['email' => $email]);
        return (bool)count($result);
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
