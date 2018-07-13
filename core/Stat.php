<?php

class Stat
{
    const TABLE = 'visitors';
    const GET_DATA_SQL = "select count(*) as amount, action from " . self::TABLE . " where `timestamp` > now() - interval {INTERVAL} group by action order by action";

    const ACTION_OPEN_SITE = "open site";
    const ACTION_OPEN_VK = "open VK";
    const ACTION_OPEN_INSTAGRAM = "open Instagram";
    const ACTION_OPEN_YOUTUBE_OF_GROUP = "open YouTube of Group";
    const ACTION_OPEN_YOUTUBE_ABOUT_YAN = "open YouTube about Yan";
    const ACTION_OPEN_YOUTUBE_ABOUT_NICKOLAY = "open YouTube about Nickolay";
    const ACTION_OPEN_YOUTUBE_ABOUT_DANILA = "open YouTube about Danila";
    const ACTION_OPEN_SUBSCRIBE1 = "open subsribe form 1";
    const ACTION_OPEN_SUBSCRIBE2 = "open subsribe form 2";
    const ACTION_OPEN_SUBSCRIBE3 = "open subsribe form 3";
    const ACTION_UNKNOWN = "did something";

    public static function viewStat()
    {
        self::drawStat("24 часа", self::getStatForDay());
        echo "<br><hr><br>";
        self::drawStat("1 неделю", self::getStatForWeek());
        echo "<br><hr><br>";
        self::drawStat("1 месяц", self::getStatForMonth());
    }

    private static function getStatForDay()
    {
        $sql = str_replace('{INTERVAL}', '24 hour', self::GET_DATA_SQL);
        return DB::getInstance()->selectAsAssoc($sql);
    }

    private static function getStatForWeek()
    {
        $sql = str_replace('{INTERVAL}', '1 week', self::GET_DATA_SQL);
        return DB::getInstance()->selectAsAssoc($sql);
    }

    private static function getStatForMonth()
    {
        $sql = str_replace('{INTERVAL}', '1 month', self::GET_DATA_SQL);
        return DB::getInstance()->selectAsAssoc($sql);
    }

    private static function drawStat($for, array $data)
    {
        echo "<h2>За {$for}:</h2><br><table>";
        foreach ($data as $value) {
            echo "<tr>";
            $action = ucfirst(strtolower($value['action']));
            $amount = $value['amount'];
            echo "<td>{$action}</td><td>{$amount}</td></tr>";
        }
        echo "</table>";
    }

    public static function addVisitorToDB($action)
    {
        $ip = self::getUserIP();

        DB::getInstance()->insert(
            self::TABLE,
            [
                'ip' => $ip,
                'action' => $action
            ]
        );
    }

    private static function getUserIP()
    {
        // Get real visitor IP behind CloudFlare network
        if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
            $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
            $_SERVER['HTTP_CLIENT_IP'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
        }
        $client  = @$_SERVER['HTTP_CLIENT_IP'];
        $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
        $remote  = $_SERVER['REMOTE_ADDR'];

        if (filter_var($client, FILTER_VALIDATE_IP)) {
            $ip = $client;
        } else if (filter_var($forward, FILTER_VALIDATE_IP)) {
            $ip = $forward;
        } else {
            $ip = $remote;
        }

        return ip2long($ip);
    }
}