<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_aktif = $_POST["chkAktif"]	== "" ? "0" : $_POST["chkAktif"];
  if($_POST["fkey"] != ""){
    $sql  = "update tm_barang set vNmBarang='$_POST[edtNama]',cKdGroupBarang='$_POST[cmbgrpbarang]',cKdSatuan='$_POST[cmbsatuan]',cAktif='".$val_aktif."', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdBarang = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_barang (cKdBarang,vNmBarang,cKdGroupBarang,cKdSatuan,cAktif, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[edtKode]','$_POST[edtNama]','$_POST[cmbgrpbarang]','$_POST[cmbsatuan]','".$val_aktif."', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  //echo $sql; 
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_barang where cKdBarang = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("master.barang");
$sql  = "SELECT grp.vNmGroupBarang, sat.vNmSatuan, brg.* FROM tm_barang brg ";
$sql .= "LEFT JOIN (SELECT cKdGroupBarang,vNmGroupBarang FROM tm_grpbarang) grp ON grp.cKdGroupBarang = brg.cKdGroupBarang "; 
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = brg.cKdSatuan "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE brg.cKdBarang = '$_GET[key]' ";
}
$sql .= "ORDER BY brg.cKdBarang ";
$admGrdTpl->moduleid  = "master.barang";
$admGrdTpl->delform   = "m=master.barang&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_grp","adodb","SELECT cKdGroupBarang,vNmGroupBarang FROM tm_grpbarang WHERE cAktif='1' ORDER BY cKdGroupBarang");
  $admGrdTpl->template->MergeBlock("blk_sat","adodb","SELECT cKdSatuan, vNmSatuan FROM tm_satuan ORDER BY cKdSatuan");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Master Data Barang";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>