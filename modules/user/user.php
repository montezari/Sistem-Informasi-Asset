<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
if($_REQUEST["mode"]=="proyek") $mode=2;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_aktif = $_POST["cAktif"]	== "" ? "0" : $_POST["cAktif"]; 
  $val_sa = $_POST["cSuper"] == "" ? "0" : $_POST["cSuper"]; 
  $val_pass = trim(encrypt_decrypt('encrypt',$_POST["cPassword"]));
  if($_POST["fkey"] != ""){
    $sql  = "update tsm_user set cUserName='$_POST[cUserName]', cPassword = '".$val_pass."', cKdGroupUser='$_POST[cmbgroup]', cAktif='".$val_aktif."', ";
	$sql .= "cSuper='".$val_sa."', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdPegawai = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tsm_user (cUserName,cPassword,cKdGroupUser,cKdPegawai,cNamaLengkap,cAktif,cSuper, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[cUserName]','".$val_pass."','$_POST[cmbgroup]','$_POST[fpeg]','$_POST[vNamaPegawai]','".$val_aktif."', '".$val_sa."',";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
  
}

$admGrdTpl = new TGridTemplate("user.user");
$sql  = "SELECT usr.*, peg.cKdPegawai as cIdPeg, peg.vNamaPegawai, dept.vNmDept, ";
$sql .= "peg.cIdProyek, proy.vNamaProyek, dept.cKdDept FROM tm_pegawai peg ";
$sql .= "LEFT JOIN tsm_user usr ON peg.cKdPegawai = usr.cKdPegawai ";
$sql .= "LEFT JOIN (SELECT cIdProyek,vNamaProyek FROM tm_proyek) proy ON proy.cIdProyek = peg.cIdProyek "; 
$sql .= "LEFT JOIN (SELECT cKdDept,vNmDept FROM tm_dept) dept ON dept.cKdDept = peg.cKdDept ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE peg.cKdPegawai = '$_GET[key]' ";
}

$admGrdTpl->moduleid  = "user.user";
$admGrdTpl->delform   = "m=user.user&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_grp","adodb","SELECT cKdGroupUser,vNmGroupUser FROM tsm_groupuser ORDER BY cKdGroupUser");
}
$sql = "SELECT cPassword FROM tsm_user WHERE cKdPegawai = '$_GET[key]' ";
$rs = $conn->Execute($sql);
if($rs->fields["cPassword"]!=""){
  $cPassword = trim(encrypt_decrypt('decrypt',$rs->fields["cPassword"]));
}else{
  $cPassword = "";
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Users";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>