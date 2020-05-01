<?php

$name = $_POST['name'];
$email = $_POST['email'];
$msg = $_POST['msg'];

$to      = 'contact@blend-eat.com';
$subject = 'contact blend eat';
$headers = 'From: ' . $email . '\r\n' . 'Reply-To:' . $email . '\r\n' . 'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $msg, $headers);
//print($headers);