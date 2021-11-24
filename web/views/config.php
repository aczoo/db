<?php

//Get Heroku ClearDB connection information
$cleardb_url = parse_url("mysql://bd851fa5020e4c:b10b6ba5@us-cdbr-east-04.cleardb.com/heroku_f98ed29c46af889?reconnect=true");
$cleardb_server = $cleardb_url["host"];
$cleardb_username = $cleardb_url["user"];
$cleardb_password = $cleardb_url["pass"];
$cleardb_db = substr($cleardb_url["path"],1);
$active_group = 'default';
$query_builder = TRUE;
// Connect to DB

$conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}