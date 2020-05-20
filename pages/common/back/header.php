<?php

$resultCategories = $dbInstance->query("CALL sp_recipe_category_get()");
$resultRobots = $dbInstance->query("CALL sp_robot_get()");

$tempVars = array(
    "categories" => $resultCategories,
    "robots" => $resultRobots
);

echo $templates->render('common/front/_tpl_header', $tempVars);