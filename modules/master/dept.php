<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_dept set vNmDept='$_POST[vNmDept]', vKota='$_POST[vKota]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdDept = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_dept (cKdDept,vNmDept, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[cKdDept]','$_POST[vNmDept]','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_dept where cKdDept = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.dept");
$sql  = "select * from tm_dept "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cKdDept = '$_GET[key]' ";
}
$sql .= "ORDER BY cKdDept ";
$admGrdTpl->moduleid  = "master.dept";
$admGrdTpl->delform   = "m=master.dept&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Departemen";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>