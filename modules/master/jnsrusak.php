<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_kerusakan set vNamaKerusakan='$_POST[edtNama]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdKerusakan = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_kerusakan (cKdKerusakan, vNamaKerusakan, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[edtKode]','$_POST[edtNama]','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  //echo $sql; 
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_kerusakan where cKdKerusakan = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.jnsrusak");
$sql  = "select * from tm_kerusakan "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cKdKerusakan = '$_GET[key]' ";
}
$sql .= "ORDER BY cKdKerusakan ";
$admGrdTpl->moduleid  = "master.jnsrusak";
$admGrdTpl->delform   = "m=master.jnsrusak&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Jenis Kerusakan";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>