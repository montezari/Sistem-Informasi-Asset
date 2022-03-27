<?php



$response = array();

$result;



require_once './db_connect.php';

$db = new DB_CONNECT();




if (isset($_POST["username"]) && isset($_POST["id_barcode"]) && isset($_POST["address_barcode"]) 
&& isset($_POST["name_barcode"])&& isset($_POST["detail_barcode"])) {



	$username = $_POST["username"];

	$id_barcode = $_POST["id_barcode"];

	$address_barcode = $_POST["address_barcode"];

	$name_barcode= $_POST["name_barcode"];
	
	$detail_barcode= $_POST["detail_barcode"];
	
	$latitude_barcode= $_POST["latitude_barcode"];
	
	$longitude_barcode= $_POST["longitude_barcode"];



	$response["response"] = array();

	$message = array();



	$resultMaser_barcode = mysql_query("select id_barcode from tm_asset where id_barcode='$id_barcode' and username='$username'");

	$row = mysql_num_rows($resultMaser_barcode);


	if ($row == 0) {

			$result = mysql_query("insert into tm_asset (id_barcode,username,address_barcode,name_barcode,detail_barcode,latitude_barcode,longitude_barcode) value ('$id_barcode','$username','$address_barcode','$name_barcode','$detail_barcode','$latitude_barcode','$longitude_barcode') ");

		if ($result) {

			$message["message"] = "Success Insert Barcode";

			$message["success"] = true;
			
			$message["code"] = 200 ;


		} else {

			$message["message"] = "Can't Insert Barcode";

			$message["success"] = false;
			$message["code"] = 202 ;
		}
	} else{
	$message["message"] = "Can't Insert Barcode";

			$message["success"] = false;
			$message["code"] = 202 ;
	}


	echo json_encode($message);



}

?>