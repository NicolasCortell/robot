<?php

header('Content-Type: text/html; charset=utf-8');
session_start();// Inialize session

set_include_path(str_replace("\\includes", "", dirname(__FILE__)) . '\\');
require_once 'includes/constants.php';


//DB CONNECT
require_once 'database/init_database.php';


// Template engine
require_once 'resources/plugins/template_engine/plates-3.1.1/src/Engine.php';
$templates = new League\Plates\Engine(SYS_PATH . '\pages');


require_once 'includes/functions.php';