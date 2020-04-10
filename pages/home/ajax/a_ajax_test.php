<?php

/*
$params = array(
    "code" => $_POST["testKey"]
);
echo json_encode($dbInstance->query("SELECT * FROM test WHERE code = :code ", $params));
*/
echo json_encode($dbInstance->query("CALL sp_test_get(?)", array( $_POST["testKey"] )));
