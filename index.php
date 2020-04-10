<?php

require_once('includes/init.php');

$page = 'home';
switch(isset($_GET['p']) ? $_GET['p'] : '') {
    case 'home': $page = 'home';  break;
}

require_once("pages/$page/index.php");

