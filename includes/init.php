<?php

// Set encoding to UTF8 (our alphabet) and content type (what we will display) is text and HTML
header('Content-Type: text/html; charset=utf-8');

// Inialize session
session_start();

set_include_path(str_replace("\\includes", "", dirname(__FILE__)) . '\\');

// Require the constants
require_once 'includes/constants.php';

// DB CONNECT
require_once 'database/init_database.php';

// Template engine
require_once 'resources/plugins/template_engine/plates-3.1.1/src/Engine.php';
$templates = new League\Plates\Engine(SYS_PATH . '/pages');

// Require the functions file
require_once 'includes/functions.php';