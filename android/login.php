<?php
$result;

require_once './db_connect.php';

$db = new DB_CONNECT();

if (isset($_POST["username"]) && isset($_POST["password"])) {
	$username = $_POST["username"];
	$password = $_POST["password"];
	$result = mysql_query("select * from master_user where username ='$username'");
	$resPass = mysql_fetch_array($result);
	$message = array();
	if (!empty($resPass)) {
		if ($password == $resPass["password"]) {
			$message["message"] = "Succsess login";
			$message["success"] = true;			$message["username"] = $resPass["username"];			$message["password"] = $resPass["password"];
			$message["level"] = $resPass["level_user"];$message["code"] = 200;
		} else {
			$message["message"] = "Not Match\nUsername and Password";
			$message["success"] = false;$message["code"] = 202;
		}			
	} else {
		$message["message"] = "Not Match\nUsername and Password";
		$message["success"] = false;		$message["code"] = 202;
	}
	echo json_encode($message);

} else {

}
?>