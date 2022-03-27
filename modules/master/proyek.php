<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_proyek set vNamaProyek='$_POST[vNamaProyek]', vKota='$_POST[vKota]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdProyek = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_proyek (cIdProyek,vNamaProyek, vKota, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[cIdProyek]','$_POST[vNamaProyek]','$_POST[vKota]','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_proyek where cIdProyek = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.proyek");
$sql  = "select * from tm_proyek "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cIdProyek = '$_GET[key]' ";
}
//$sql .= "ORDER BY cIdProyek ";
$admGrdTpl->moduleid  = "master.proyek";
$admGrdTpl->delform   = "m=master.proyek&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Proyek";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>