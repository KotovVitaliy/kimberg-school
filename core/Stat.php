<?php

class Stat
{
    const TABLE = 'visitors';
    const GET_DATA_SQL = "select count(*) as amount, action from " . self::TABLE . " where `timestamp` > now() - interval {INTERVAL} group by action order by amount desc, action";
    const GET_DATA_UNIQUE_VISITORS_SQL = "SELECT count(distinct ip) as amount from " . self::TABLE . " where `timestamp` > now() - interval {INTERVAL} and action = 'open site' order by amount desc";

    const ACTION_OPEN_SITE = "open site";
    const ACTION_OPEN_VK = "open VK";
    const ACTION_OPEN_VK_FEEDBACK = "open VK feedback";
    const ACTION_OPEN_INSTAGRAM = "open Instagram";
    const ACTION_OPEN_YOUTUBE_OF_GROUP = "open YouTube of Group";
    const ACTION_OPEN_YOUTUBE_ABOUT_YAN = "open YouTube about Yan";
    const ACTION_OPEN_YOUTUBE_ABOUT_NICKOLAY = "open YouTube about Nickolay";
    const ACTION_OPEN_YOUTUBE_ABOUT_DANILA = "open YouTube about Danila";
    const ACTION_OPEN_SUBSCRIBE1 = "open subsribe form 1";
    const ACTION_OPEN_SUBSCRIBE2 = "open subsribe form 2";
    const ACTION_OPEN_SUBSCRIBE3 = "open subsribe form 3";
    const ACTION_OPEN_SUBSCRIBE4 = "open subsribe form 4";
    const ACTION_SHOW_FAQ = "show faq";
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
        return self::getStat('24 hour');
    }

    private static function getStatForWeek()
    {
        return self::getStat('1 week');
    }

    private static function getStatForMonth()
    {
        return self::getStat('1 month');
    }

    private static function getStat($for)
    {
        $sql = str_replace('{INTERVAL}', $for, self::GET_DATA_SQL);
        $data = DB::getInstance()->selectAsAssoc($sql);

        $sql = str_replace('{INTERVAL}', $for, self::GET_DATA_UNIQUE_VISITORS_SQL);
        $unique = DB::getInstance()->selectAsAssoc($sql)[0]['amount'];
        foreach ($data as $k => &$value) {
            if ($value['action'] == self::ACTION_OPEN_SITE) {
                $value['amount'] = "total: " . $value['amount'] . "<br />unique: " . $unique;
            }
        }

        return $data;
    }

    private static function drawStat($for, array $data)
    {
        echo "<h2>За {$for}:</h2><br><table>";
        foreach ($data as $value) {
            echo "<tr>";
            $action = ucfirst(strtolower(htmlentities($value['action'])));
            $amount = $value['amount'];
            echo "<td style='padding:5px'>{$action}</td><td style='padding:5px;text-align: end'>{$amount}</td></tr>";
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