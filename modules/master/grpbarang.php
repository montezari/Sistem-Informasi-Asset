<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_asset = $_POST["chkAsset"]	== "" ? "0" : $_POST["chkAsset"];
  $val_aktif = $_POST["chkAktif"]	== "" ? "0" : $_POST["chkAktif"];
  if($_POST["fkey"] != ""){
    $sql  = "update tm_grpbarang set vNmGroupBarang='$_POST[edtNama]',cKdAsset='$_POST[edtAsset]',cAsset='".$val_asset."', cAktif='".$val_aktif."', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdGroupBarang = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_grpbarang (cKdGroupBarang, vNmGroupBarang, cKdAsset, cAsset, cAktif, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[edtKode]','$_POST[edtNama]','$_POST[edtAsset]','".$val_asset."','".$val_aktif."',";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  //echo $sql; 
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_grpbarang where cKdGroupBarang = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.grpbarang");
$sql  = "select * from tm_grpbarang "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cKdGroupBarang = '$_GET[key]' ";
}
$sql .= "ORDER BY cKdGroupBarang ";
$admGrdTpl->moduleid  = "master.grpbarang";
$admGrdTpl->delform   = "m=master.grpbarang&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Group Barang";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>