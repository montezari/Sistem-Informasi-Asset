<?php

if(isset($_REQUEST["logout"]) && $_REQUEST["logout"] == 1){
  if($_REQUEST["confirm"] == 1){
    session_unset(md5("WWW_INV_APP_SESID"));
	unset($_SESSION["Logged"]);
	unset($_SESSION["cKdPegawai"]);
	unset($_SESSION["cNamaLengkap"]);
	unset($_SESSION["cIdProyek"]);
	unset($_SESSION["vNamaProyek"]);
	unset($_SESSION["cKdDept"]);
	unset($_SESSION["vNmDept"]);
    echo "<script>window.location = 'index.php';</script>";
  }else{
    echo "<script>if(confirm('Anda yakin ingin Logout dari Sistem ?')){window.location = 'index.php?m=admin.auth&logout=1&confirm=1';}else{history.back(-1);}</script>";
  }  
}else{
  //$sql	= "select * from tsm_user where cUserName = UPPER('$_POST[edtUserName]') and cPassword = '".md5(strtoupper($_POST["edtPassword"]))."'";
  $pass = encrypt_decrypt('encrypt',$_POST["edtPassword"]);
  $sql = "select * from tsm_user where cUserName = UPPER('$_POST[edtUserName]') and cPassword = '".$pass."'";
  $rs = $conn->Execute($sql);
  if($rs->RecordCount() > 0){  
    $sql  = "update tsm_user set dLastLogin = CURRENT_TIMESTAMP where cUserName = '$_POST[edtUserName]' ";
    $conn->Execute($sql);
    $_SESSION["Logged"]	= $rs->fields["cUserName"];

    $sql  = "SELECT COALESCE(peg.vNamaPegawai,'Administrator') AS vNamaPegawai, COALESCE(dept.vNmDept,'Kantor Pusat') AS vNmDept, ";
	$sql .= "peg.cIdProyek, proy.vNamaProyek, dept.cKdDept FROM tsm_user usr ";
    $sql .= "LEFT JOIN (SELECT cKdPegawai, vNamaPegawai, cIdProyek, cKdDept FROM tm_pegawai) peg ON peg.cKdPegawai = usr.cKdPegawai ";
    $sql .= "LEFT JOIN (SELECT cIdProyek,vNamaProyek FROM tm_proyek) proy ON proy.cIdProyek = peg.cIdProyek "; 
    $sql .= "LEFT JOIN (SELECT cKdDept,vNmDept FROM tm_dept) dept ON dept.cKdDept = peg.cKdDept ";
	$sql .= "WHERE usr.cUserName = '".$_SESSION["Logged"]."' ";
    $rser = $conn->Execute($sql); 
    $_SESSION["cKdPegawai"] = $rser->fields["cKdPegawai"];
    $_SESSION["cNamaLengkap"] = $rser->fields["vNamaPegawai"];
    $_SESSION["cIdProyek"] = $rser->fields["cIdProyek"];
    $_SESSION["vNamaProyek"] = $rser->fields["vNamaProyek"];
    $_SESSION["cKdDept"] = $rser->fields["cKdDept"];
    $_SESSION["vNmDept"] = $rser->fields["vNmDept"];

    $sqldt = "select CONVERT(varchar,GETDATE(),112)+REPLACE(CONVERT(varchar,GETDATE(),8),':','') as LOGINDATETIME ";
    $rsdt  = $conn->Execute($sqldt);
    $session_id = md5($r->fields["cUserName"].$rsdt->fields["LOGINDATETIME"]);
    $_SESSION["Session_ID"] = $session_id;

    $host = $_SERVER["REMOTE_ADDR"] != "" ? $_SERVER["REMOTE_ADDR"] : "127.0.0.1";
    $sql  = "insert into tsm_logged (dTgl, fip, cUserName, csession_id) ";
    $sql .= "values (CURRENT_TIMESTAMP, '$host', '$_POST[edtUserName]', '$session_id')";
    $conn->Execute($sql);
    echo "<script>window.location='index.php';</script>";
  }else{
	echo "<script>alert('User ID dan Password yang anda masukan tidak benar...');</script>";
    echo "<script>window.location='index.php';</script>";
  }
}

?>