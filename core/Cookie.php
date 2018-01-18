<?php

class Cookie
{
    const AUTH = 'me';

    public static function setAuthCookie()
    {
        $auth_cookie_value = self::generateAuthHash();
        $month = time() + (60 * 60 * 24 * 31);
        setcookie(self::AUTH, $auth_cookie_value, $month, '/');
        return $auth_cookie_value;
    }

    public static function getAuthCookie()
    {
        return $_COOKIE[self::AUTH] ?? false;
    }

    public static function unsetAuthCookie()
    {
        setcookie(self::AUTH, '0', -1, '/');
    }

    private static function generateAuthHash()
    {
        return md5(microtime(1) * rand(1, 5));
    }
}
