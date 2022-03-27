<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_aktif = $_POST["chkAktif"]	== "" ? "0" : $_POST["chkAktif"];
  if($_POST["fkey"] != ""){
    $sql  = "update tm_supplier set vNmSupplier='$_POST[edtNama]',vAlamat='$_POST[alamat]',vKota='$_POST[kota]', ";
	$sql  = "vTlp='$_POST[tlp]',vFax='$_POST[fax]',vEmail='$_POST[email]',cAktif='".$val_aktif."', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdSupplier = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_supplier (cKdSupplier,vNmSupplier,vAlamat,vKota,vTlp,vFax,vEmail,cAktif, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[edtKode]','$_POST[edtNama]','$_POST[alamat]','$_POST[kota]','$_POST[tlp]','$_POST[fax]','$_POST[email]','".$val_aktif."', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
 
 exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_supplier where cKdSupplier = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.supplier");
$sql  = "SELECT supp.* FROM tm_supplier supp ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE supp.cKdSupplier = '$_GET[key]' ";
}
$sql .= "ORDER BY supp.cKdSupplier ";
$admGrdTpl->moduleid  = "master.supplier";
$admGrdTpl->delform   = "m=master.supplier&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
//if($mode=="1"){
//  $admGrdTpl->template->MergeBlock("blk_grp","adodb","SELECT cKdGroupSupplier,vNmGroupSupplier FROM tm_grpSupplier WHERE cAktif='1' ORDER BY cKdGroupSupplier");
//  $admGrdTpl->template->MergeBlock("blk_sat","adodb","SELECT cKdSatuan, vNmSatuan FROM tm_satuan ORDER BY cKdSatuan");
//}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Supplier";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>