<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_aktif = $_POST["chkAktif"]	== "" ? "0" : $_POST["chkAktif"];
  $komp_aktif = $_POST["checkkomp"]	== "" ? "0" : $_POST["checkkomp"];
  if($_POST["fkey"] != ""){
    $sql  = "update tm_asset set cMerk='$_POST[merk]',cType='$_POST[type]',cSerialNumber='$_POST[serial]', ";
	$sql .= "id_barcode='$_POST[kodebarcode]',address_barcode='$_POST[alamatasset]',name_barcode='$_POST[namabrg]',";
	$sql .= "detail_barcode='$_POST[namabrg]',latitude_barcode='$_POST[longitude]',longitude_barcode='$_POST[latitude]', ";
	$sql .= "cSpesifikasi='$_POST[spesifikasi]',cKomp='".$komp_aktif."' where cIdAsset = '$_POST[fkey]' ";
	$conn->Execute($sql); 
	
	$sql2  = "update tm_assetdt set cProcessor='$_POST[processor]',cMainBoard='$_POST[mainboard]',cHarddisk='$_POST[harddisk]', ";
	$sql2 .= "cVgaCard='$_POST[vga]',cMemory='$_POST[memory]',cDvdCd='$_POST[dvd]' where cIdAsset = '$_POST[fkey]' ";
    $conn->Execute($sql2);  
	
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_asset where cIdAsset = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}
 
$admGrdTpl = new TGridTemplate("master.asset");
$sql  = "SELECT hd.*, brg.vNmBarang, hd.cKdSatuan, sat.vNmSatuan FROM tm_asset hd ";
$sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang "; 
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = hd.cKdSatuan "; 
if(isset($_GET["key"]) && ($_GET["key"]!="")){
    $sql .= "WHERE hd.cIdAsset = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.cIdAsset DESC ";
$admGrdTpl->moduleid  = "master.asset";
$admGrdTpl->delform   = "m=master.asset&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $sql  = "SELECT hd.*, dt.*, brg.vNmBarang, sat.vNmSatuan FROM tm_asset hd ";
  $sql .= "LEFT JOIN (SELECT * FROM tm_assetdt) dt ON dt.cIdAsset=hd.cIdAsset ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang "; 
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = hd.cKdSatuan "; 
  $sql .= "WHERE hd.cIdAsset = '$_GET[key]' ";
  $sql .= "ORDER BY hd.cIdAsset DESC ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Asset";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>