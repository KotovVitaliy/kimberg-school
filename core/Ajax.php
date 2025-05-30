<?php

class Ajax
{
    const TABLE_MESSAGES = 'chrome_network_notebook';
    const TABLE_CHAT = 'chrome_network_chat';
    const TABLE_PASS = 'chrome_pass';

    private static $map = [
        'get_all_subs' => 'getAllSubs',
        'update_sub_status' => 'updateSubStatus',
        'save_comment' => 'saveComment',
        'delete_sub' => 'deleteSub',
    ];

    public static function makeAjax($command)
    {
        if (isset(self::$map[$command])) {
            $method = self::$map[$command];
            $result = self::$method();
            if (!is_array($result)) {
                $result = ['result' => $result];
            }
            self::echo($result);
        } else {
            self::echo(['error' => 'Wrong command passed']);
        }
    }

    public static function getAllSubs()
    {
        sleep(3);

        $order_by = $_REQUEST['order_by'] ?? 'id';
        $order = $_REQUEST['order'] ?? 'asc';
        $years = $_REQUEST['years'] ?? '2021 - 2022';

        $years = explode(" - ", $years);
        $year1 = $years[0];
        $year2 = $years[1] ?? '2022';

        $order_by = str_replace([',', ';', '"', "'", "`", "+", " "], "", $order_by);

        $q = "select * from `subscibers` where `delete`='0' and timestamp between '{$year1}-05-01 00:00:00' and '{$year2}-04-30 23:59:59' order by {$order_by} {$order}";
        $data = DB::getInstance()->selectAsAssoc($q);

        foreach ($data as $k => $v) {
            foreach ($data[$k] as &$v1) {
                $v1 = str_replace(["<", ">"], ["&lt;", "&gt;"], $v1);
            }
        }

        self::echo(['result' => $data, 'q' => $q]);
    }

    public static function deleteSub()
    {
        $id = $_REQUEST['id'] ?? 0;
        DB::getInstance()->update(
            "update `subscibers` set `delete`='1' where id=:id",
            ['id' => $id]
        );
    }

    public static function updateSubStatus()
    {
        $id = $_REQUEST['id'] ?? 0;
        $status = $_REQUEST['status'] ?? 'new';
        DB::getInstance()->update(
            "update `subscibers` set status=:status where id=:id",
            ['id' => $id, 'status' => $status]
        );
    }

    public static function saveComment()
    {
        $id = $_REQUEST['id'] ?? 0;
        $comment = $_REQUEST['comment'] ?? '';
        DB::getInstance()->update(
            "update `subscibers` set comment=:comment where id=:id",
            ['id' => $id, 'comment' => $comment]
        );
    }

    private static function echo(array $answer)
    {
        echo json_encode($answer);
        exit;
    }

    private static function echoNotEnoughData()
    {
        self::echo(['error' => 'Not enough data for request.']);
    }
}
