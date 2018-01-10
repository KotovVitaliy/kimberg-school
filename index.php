<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/config/autoload.php';



if ($_POST || $_GET) {
    Ajax::getInstance()->makeRequest();
} else {
    //echo "It's gonna be legen-wait-for-it-dairy!";
    echo file_get_contents(__DIR__ . '/tpl/main.tpl');
}

function sendTo404() {
    http_response_code(404);
    include "404.php";
    die();
}

