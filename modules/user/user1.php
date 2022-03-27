<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
if($_REQUEST["mode"]=="proyek") $mode=2;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_aktif = $_POST["cAktif"]	== "" ? "0" : $_POST["cAktif"]; 
  $val_sa = $_POST["cSuper"] == "" ? "0" : $_POST["cSuper"]; 
  $val_pass = trim(encrypt_decrypt('encrypt',$_POST["cPassword"]));
  if($_POST["fkey"] != ""){
    $sql  = "update tsm_user set cUserName='$_POST[cUserName]', cPassword = '".$val_pass."', cKdGroupUser='$_POST[cmbgroup]', cAktif='".$val_aktif."', ";
	$sql .= "cSuper='".$val_sa."',cKdDept='$_POST[cmbdept]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdUser = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tsm_user (cUserName,cPassword,cKdGroupUser,cNamaLengkap, cKdDept, cAktif, cSuper, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[cUserName]','".$val_pass."','$_POST[cmbgroup]','$_POST[vNamaPegawai]','$_POST[cmbdept]','".$val_aktif."', '".$val_sa."', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="UPDATEPROYEK"){
  $sql = "DELETE FROM tsm_usersproyek WHERE cIdUser = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  foreach($_POST["cakses"] as $k=>$v){
    $val_aktif = $_POST["cakses"][$k] == "" ? "0" : "1"; 
    $sql  = "insert into tsm_usersproyek (cIdUser,cUserName,cIdProyek,cStatus) ";
    $sql .= "values('$_POST[fkey]','$_POST[fname]','".$_POST["cakses"][$k]."','".$val_aktif."') ";
    $conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate("user.user");
$sql  = "SELECT usr.*, dept.vNmDept FROM tsm_user usr  ";
$sql .= "LEFT JOIN (SELECT cKdDept,vNmDept FROM tm_dept) dept ON dept.cKdDept = usr.cKdDept  ";
$sql .= "WHERE usr.cUserName IS NOT NULL  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " AND usr.cIdUser = '$_GET[key]' ";
}

$admGrdTpl->moduleid  = "user.user";
$admGrdTpl->delform   = "m=user.user&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept,vNmDept FROM tm_dept ORDER BY cKdDept");
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_grp","adodb","SELECT cKdGroupUser,vNmGroupUser FROM tsm_groupuser ORDER BY cKdGroupUser");
}
$sql = "SELECT cPassword FROM tsm_user WHERE cIdUser = '$_GET[key]' ";
$rs = $conn->Execute($sql);
if($rs->fields["cPassword"]!=""){
  $cPassword = trim(encrypt_decrypt('decrypt',$rs->fields["cPassword"]));
}else{
  $cPassword = "";
}
if($mode=="2"){
  $sql  = "SELECT proy.cIdProyek, proy.vNamaProyek, COALESCE(up.cStatus,0) AS cStatus ";
  $sql .= "FROM tm_proyek proy ";
  $sql .= "LEFT JOIN tsm_usersproyek up ON up.cIdProyek = proy.cIdProyek AND up.cIdUser = '$_GET[key]' ";
  $sql .= "ORDER BY proy.cIdProyek ";
  $admGrdTpl->template->MergeBlock("blk_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Users";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>