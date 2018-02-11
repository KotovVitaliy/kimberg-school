<?php

class Ajax
{
    private static $instance;

    private function __construct() {}

    public static function getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function makeRequest()
    {
        if (!isset($_REQUEST['controller']) || !isset($_REQUEST['action'])) {
            var_dump(1);
            sendTo404();
        }
        $controller = $_REQUEST['controller'];
        $action = $_REQUEST['action'];

        // check map
        $map = AjaxMap::get();
        if (!isset($map[$controller])
            || !isset($map[$controller][$action])
            || !isset($map[$controller][$action]['class'])
            || !isset($map[$controller][$action]['method'])) {
            var_dump(2);
            sendTo404();
        }

        // set class and method
        $Class = $map[$controller][$action]['class'];
        $method = $map[$controller][$action]['method'];
        $Controller = $Class::getInstance();

        // check method exists
        if (!method_exists($Controller, $action)) {
            var_dump(3);
            sendTo404();
        }

        // check params
        if (isset($map[$controller][$action]['data'])) {
            foreach ($map[$controller][$action]['data'] as $param) {
                if (!isset($_REQUEST[$param])) {
                    var_dump(4);
                    sendTo404();
                }
            }
        }

        $Controller->$method();
    }
}

class AjaxMap
{
    public static function get()
    {
        return [
            'user' => [
                'registration' => [
                    'class' => UserController::class,
                    'method' => 'registration',
                    'data' => ['name', 'fname', 'email', 'password', 'phone']
                ],
                'login' => [
                    'class' => UserController::class,
                    'method' => 'login',
                    'data' => ['email', 'password']
                ],
                'logout' => [
                    'class' => UserController::class,
                    'method' => 'logout'
                ]
            ]
        ];
    }
}
