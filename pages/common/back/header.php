<?php


$result = $dbInstance->query("CALL sp_recipe_category_get()");




$tempVars = array(
    "categories" => $result
);


echo $templates->render('common/front/_tpl_header', $tempVars);


