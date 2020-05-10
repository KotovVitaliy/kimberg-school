<?php
//ini_set('error_reporting', E_ALL);
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);

header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/config/autoload.php';

if ($_REQUEST['learnqa']) {
    echo "Школа Kimberg School действительно сотрудничает с онлайн курсами LearnQA и дает согласие на внедрение невидимых HTML-элементов на страницу школы в <i>обучающих</i> целях.";
    exit;
}

//session_start();
if (isAjaxRequest()) {
    Ajax::makeAjax($_REQUEST['action']);
} else if (isSubscribeRequest()) {
    Mailer::getInstance()->sendSubscribeMail($_REQUEST);
    DB::getInstance()->logNewSubscriber($_REQUEST);
} else if (isShowSubsRequest()) {
    Viewer::showSubsPage();
} else if (isStatRequest()) {
    addVisitor();
} else {
    Stat::addVisitorToDB(Stat::ACTION_OPEN_SITE);
    if (isset($_COOKIE['new_tpl'])) {
        echo file_get_contents(__DIR__ . '/tpl/main_new.tpl');
    } else {
        echo file_get_contents(__DIR__ . '/tpl/main_new.tpl');
    }
}

function sendTo404() {
    http_response_code(404);
    include "404.php";
    die();
}

function isAjaxRequest()
{
    return isset($_REQUEST['ajax']) && ($_REQUEST['ajax']) == 1 && ($_POST || $_GET) && isset($_REQUEST['action']);
}

function isSubscribeRequest()
{
    return isset($_REQUEST['subscribe']) && $_REQUEST['subscribe'] === 'add';
}

function isStatRequest()
{
    return isset($_REQUEST['stat']) && $_REQUEST['stat'];
}

function isShowSubsRequest()
{
    return isset($_REQUEST['subs']) && $_REQUEST['subs'] == 'view';
}

function addVisitor() {
    $action = $_REQUEST['stat'];
    switch ($action) {
        case "instagram":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_INSTAGRAM);
            break;

        case "vk":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_VK);
            break;

        case "vk_feedback":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_VK_FEEDBACK);
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

        case "subscribe4":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_SUBSCRIBE4);
            break;

        case "show_faq":
            Stat::addVisitorToDB(Stat::ACTION_SHOW_FAQ);
            break;

        case "open_schedule":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_SCHEDULE);
            break;

        case "open_winners":
            Stat::addVisitorToDB(Stat::ACTION_OPEN_WINNERS);
            break;

        case "view":
            Stat::viewStat();
            break;

        default:
            Stat::addVisitorToDB($action);
            break;
    }
}


