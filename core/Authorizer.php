<?php

class Authorizer
{
    private static $current_user;
    private static $current_user_id;

    const TABLE = 'authorizer';

    public static function authUser($user_id)
    {
        $hash = Cookie::setAuthCookie();
        DB::getInstance()->insert(self::TABLE, [
            'user_id' => (int)$user_id,
            'hash' => $hash
        ]);
    }

    public static function deleteAuth()
    {
        $user_id = self::getUserIdOrFalse();
        $hash = Cookie::getAuthCookie();
        if ($user_id && $hash) {
            $q = 'delete from ' . self::TABLE . ' where `user_id`=:user_id and `hash`=:hash';
            DB::getInstance()->delete($q, ['user_id' => (int)$user_id, 'hash' => $hash]);
            Cookie::unsetAuthCookie();
        }
    }

    public static function getUserIdOrFalse()
    {
        if (!is_null(self::$current_user_id)) {
            return self::$current_user_id;
        }

        if ($cookie_value = Cookie::getAuthCookie()) {
            $q = 'select * from ' . self::TABLE . ' where `hash`=:hash';
            $result = DB::getInstance()->selectAsAssoc($q, ['hash' => $cookie_value]);
            if (count($result) !== 1) {
                return false;
            }

            self::$current_user_id = (int)$result[0]['user_id'];
            return self::$current_user_id;
        }

        return false;
    }

    public static function getCurrentUser()
    {
        if (!is_null(self::$current_user)) {
            return self::$current_user;
        }

        $user_id = self::getUserIdOrFalse();
        return UserController::getInstance()->whoAmI($user_id);
    }
}
