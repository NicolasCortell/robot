<?php


$params = array(
    "code" => $_POST["testKey"]
);

echo json_encode($dbInstance->query("SELECT * FROM test WHERE code = :code ", $params));