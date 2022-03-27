<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_satuan set vNmSatuan='$_POST[edtNama]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdSatuan = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_satuan (cKdSatuan, vNmSatuan, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[edtKode]','$_POST[edtNama]','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  //echo $sql; 
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_satuan where cKdSatuan = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.satuan");
$sql  = "select * from tm_satuan "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cKdSatuan = '$_GET[key]' ";
}
$sql .= "ORDER BY cKdSatuan ";
$admGrdTpl->moduleid  = "master.satuan";
$admGrdTpl->delform   = "m=master.satuan&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Satuan";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>