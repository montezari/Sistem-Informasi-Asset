<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="APPROVAL"){
  $sql = "update tr_spahd set cStatus = 'A', cUserApproval='$_SESSION[Logged]',dTglApproval=CURRENT_TIMESTAMP where cIdSPA = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("approval.spa");
$sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept FROM tr_spahd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "WHERE hd.cStatus = 'O' ";
$sql .= "ORDER BY hd.dTglSPA DESC ";
$admGrdTpl->moduleid  = "approval.spa";
$admGrdTpl->delform   = "m=approval.spa&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Approval - Surat Permintaan Alat";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>