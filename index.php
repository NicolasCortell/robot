<?php

// Require the init.php file to initialize the project
require_once('includes/init.php');

// Rooting
$page = 'home';
switch(isset($_GET['p']) ? $_GET['p'] : '') {
    case 'home': $page = 'home';  break;
    case 'contact': $page = 'contact';  break;
}

// Redirect to the page
require_once("pages/$page/index.php");

