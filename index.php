<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/config/autoload.php';

//session_start();

if (isAjaxRequest()) {
    Ajax::getInstance()->makeRequest();
} else if ($user_id = Authorizer::getUserIdOrFalse()) {
    Viewer::echoConfirmPage();
} else {
    echo file_get_contents(__DIR__ . '/tpl/main.tpl');
}

function sendTo404() {
    http_response_code(404);
    include "404.php";
    die();
}

function isAjaxRequest()
{
    return isset($_REQUEST['ajax']) && ($_REQUEST['ajax']) == 1 && ($_POST || $_GET);
}
