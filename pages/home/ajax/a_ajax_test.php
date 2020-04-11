<?php
/*
$params = array(
    "code" => $_POST["myKey"], //MME
    "id" => 2 
);
$sqlQuery = "SELECT * FROM test WHERE code = :code AND id = :id ";
$result = $dbInstance->query($sqlQuery, $params);
echo json_encode($result);
*/


//stored procedure in \sql\stored_procedures\sp_test.sql
$sqlQuery = "CALL sp_test_get(:code)";
//parameters
$params = array( "code" => $_POST["myKey"] );
//execute query
$result = $dbInstance->query($sqlQuery, $params);
//return result (array is jsonified)
echo json_encode($result);

