<?php
$result;

require_once './db_connect.php';

$db = new DB_CONNECT();
	$result = mysql_query("select * from tm_asset");

	$message = array();		$detail = array();
		while ($result_item = mysql_fetch_array($result)) {						
		$username = $result_item["username"];				
		$id_barcode = $result_item["id_barcode"];				
		$address_barcode = $result_item["address_barcode"];				
		$name_barcode = $result_item["name_barcode"];				
		$detail_barcode = $result_item["detail_barcode"];				
		$latitude_barcode = $result_item["latitude_barcode"];				
		$longitude_barcode = $result_item["longitude_barcode"];								
		$detail_item = array();				
		$detail_item["username"] = $username;				
		$detail_item["id_barcode"] = $id_barcode;				
		$detail_item["address_barcode"] = $address_barcode;				
		$detail_item["name_barcode"] = $name_barcode;				
		$detail_item["detail_barcode"] = $detail_barcode;				
		$detail_item["latitude_barcode"] = $latitude_barcode;				
		$detail_item["longitude_barcode"] = $longitude_barcode;										
		array_push($detail,  $detail_item);			}			
		$message["response"] = $detail ;			
		$message["code"] = "200";
			echo json_encode($message);

?>