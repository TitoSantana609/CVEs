<?php

// --- Docker lab config: points at the "db" compose service ---
$localhost = getenv('DB_HOST') ?: "db";
$username  = getenv('DB_USER') ?: "root";
$password  = getenv('DB_PASS') ?: "root";
$dbname    = getenv('DB_NAME') ?: "store";
$store_url = "http://localhost:8080/";
// db connection
$connect = new mysqli($localhost, $username, $password, $dbname);
// check connection
if($connect->connect_error) {
  die("Connection Failed : " . $connect->connect_error);
}

?>
