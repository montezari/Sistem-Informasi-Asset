<?php
  require_once "includes/global.inc.php";
  
  if($_GET["id"]==""){
    $sql  = "SELECT cKdGroupBarang FROM tm_grpbarang WHERE cAktif='1' ORDER BY cKdGroupBarang  LIMIT 0,1 ";
    $rs = $conn->Execute($sql);
    $grpbrg = $rs->fields["cKdGroupBarang"];
  }else{
    $grpbrg = $_GET["id"];
  }

  $sql  = "select * from tm_asset where cKdBarang in (SELECT cKdBarang FROM tm_barang WHERE cKdGroupBarang = '$grpbrg' ) ";
  $rs = $conn->Execute($sql);
  $str_lat = "var lat=[";
  $str_long = "var lon=[";
  $str_jud = "var jud=[";
  $str_det = "var det=[";
  $str_add = "var addr=[";
  while(!$rs->EOF){
	$str_lat .= $rs->fields["latitude_barcode"].",";	    
	$str_long .= $rs->fields["longitude_barcode"].",";	    
	$str_jud .= '"'.$rs->fields["name_barcode"].'"'.',';	    
	$str_det .= '"'.$rs->fields["detail_barcode"].'"'.',';	    
	$str_add .= '"'.$rs->fields["address_barcode"].'"'.',';	    
    $rs->MoveNext();
  }
  $rs->Close();
  $str_lat = substr($str_lat,0,-1)."]; ";
  $str_long = substr($str_long,0,-1)."]; ";
  $str_jud = substr($str_jud,0,-1)."]; ";
  $str_det = substr($str_det,0,-1)."]; ";
  $str_add = substr($str_add,0,-1)."]; ";
  
  echo $str_lat;
  echo $str_long;
  echo $str_jud;
  echo $str_det;
  echo $str_add;


?>