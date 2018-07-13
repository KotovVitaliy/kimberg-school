<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/config/autoload.php';

//session_start();
if (isAjaxRequest()) {
    Ajax::getInstance()->makeRequest();
} else if (isSubscribeRequest()) {
    Mailer::getInstance()->sendSubscribeMail($_REQUEST);
} else if (isConfirmRequest()) {
    $result = UserController::getInstance()->confirm();
    if (!$result) sendTo404();
    else header("Location:/");
} else if (isStatRequest()) {
    $action = $_REQUEST['stat'];
    switch ($action) {
        case "instagram":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_INSTAGRAM);
            break;

        case "vk":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_VK);
            break;

        case "youtube":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_YOUTUBE_OF_GROUP);
            break;

        case "youtube-yan":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_YOUTUBE_ABOUT_YAN);
            break;

        case "youtube-nick":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_YOUTUBE_ABOUT_NICKOLAY);
            break;

        case "youtube-dan":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_YOUTUBE_ABOUT_DANILA);
            break;

        case "subscribe1":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_SUBSCRIBE1);
            break;

        case "subscribe2":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_SUBSCRIBE2);
            break;

        case "subscribe3":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_SUBSCRIBE3);
            break;

        case "view":
            Stat::viewStat();
            break;

        default:
            Stat::addVisitorToDB(Stat::ACTION_UNKNOWN);
            break;
    }
} else if ($user = Authorizer::getCurrentUser()) {
    if ($user['is_confirmed']) {
        echo 'step 2';
    } else {
        Viewer::echoConfirmPage();
    }
} else {
    Stat::addVisitorToDB(Stat::ACTION_OPEN_SITE);
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

function isConfirmRequest()
{
    return isset($_REQUEST['confirm']) && $_REQUEST['confirm'];
}

function isSubscribeRequest()
{
    return isset($_REQUEST['subscribe']) && $_REQUEST['subscribe'];
}

function isStatRequest()
{
    return isset($_REQUEST['stat']) && $_REQUEST['stat'];
}


