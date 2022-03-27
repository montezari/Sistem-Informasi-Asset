<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_pejabat = $_POST["cPejabat"]	== "" ? "0" : $_POST["cPejabat"]; 
  if($_POST["fkey"] != ""){
    $sql  = "update tm_pegawai set vNamaPegawai='$_POST[vNamaPegawai]', cEmail='$_POST[email]', cNip='$_POST[nip]', cPejabat='".$val_pejabat."', cIdProyek='$_POST[cmbproyek]', cKdDept='$_POST[cmbdept]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdPegawai = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_pegawai (vNamaPegawai,cPejabat,cIdProyek, cKdDept, cEmail, cNip, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[vNamaPegawai]','".$val_pejabat."', '$_POST[cmbproyek]','$_POST[cmbdept]', '$_POST[email]', '$_POST[nip]',";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_pegawai where cKdPegawai = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.pegawai");
$sql  = "SELECT peg.*, pro.vNamaProyek, dep.vNmDept FROM tm_pegawai peg "; 
$sql .= "LEFT JOIN tm_proyek pro ON pro.cIdProyek = peg.cIdProyek "; 
$sql .= "LEFT JOIN tm_dept dep ON dep.cKdDept = peg.cKdDept "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE peg.cKdPegawai = '$_GET[key]' ";
}
$sql .= "ORDER BY peg.cIdProyek, peg.cKdDept, peg.cKdPegawai ";
$admGrdTpl->moduleid  = "master.pegawai";
$admGrdTpl->delform   = "m=master.pegawai&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_proyek","adodb","SELECT cIdProyek, vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept,vNmDept FROM tm_dept ORDER BY cKdDept");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name = "gTpl";
$gTpl->title = "Master Data Pegawai";
$gTpl->display = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>