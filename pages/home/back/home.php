<?php

$res = $dbInstance->query("SELECT * FROM test");

$template_vars = array();

$template_vars["tests"] = $res;

// Render template
echo $templates->render('home/front/tpl_home', $template_vars);
