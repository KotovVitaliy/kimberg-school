<?php

class Viewer
{
    public static function echoConfirmPage()
    {
        $html = file_get_contents(__DIR__ . '/../tpl/confirm_email.tpl');
        $user = Authorizer::getCurrentUser();
        $email = $user['email'];
        $name = $user['name'];
        $html = str_replace(
            ["{{EMAIL}}", "{{NAME}}"],
            [$email, $name],
            $html
        );
        echo $html;
    }

    public static function echoSuccess($data)
    {
        echo json_encode(['success' => 1, 'data' => $data]);
    }

    public static function echoError($data)
    {
        echo json_encode(['error' => 1, 'data' => $data]);
    }
}
