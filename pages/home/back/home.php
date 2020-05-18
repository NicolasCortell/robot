<?php

//Database query (get everything from the [test] table)
//$res = $dbInstance->query("SELECT * FROM civility");

//Template variables (will be used in the template)
$template_vars = array();/*
$template_vars["tests"] = $res;
$template_vars["prenom"] = "Nicolas";
$template_vars["nom"] = "Redard";*/


// Render template
require_once ('pages/common/back/header.php');
echo $templates->render('home/front/tpl_home', $template_vars);
