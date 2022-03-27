<?php

  require_once "adodb/adodb.inc.php";

  $conn =&ADONewConnection('mysql');
  $conn->port = "3307";
  $conn->Connect($config["db_host"], $config["db_user"], $config["db_pass"], $config["db_name"]);
  $conn->SetFetchMode(ADODB_FETCH_ASSOC);

  
//untuk debugging
//require_once "adodb/tohtml.inc.php";
//$conn->debug = TRUE;

?>