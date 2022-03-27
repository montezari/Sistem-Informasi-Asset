<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $nospa = $_POST["edtspa"];
  if($_POST["tglspa"]!=""){
	$tgl = explode("/",$_POST["tglspa"]);
	$tglspa = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglspa = date('Y-m-d');
  }

 
  if($_POST["tglterimaspa"]!=""){
	$tgl = explode("/",$_POST["tglterimaspa"]);
	$tglterimaspa = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglterimaspa = date('Y-m-d');
  }
  

  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	$sql  = "update tr_spahd set dTglSPA='$tglspa', dTglTerimaSPA='$tglterimaspa',cKdProyek='$_POST[cmbproyek]', cKdDept='$_POST[cmbdept]', cKeterangan='$_POST[mmket]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdSPA = '$dokID' ";
	$conn->Execute($sql);
  }else{
	$nospa = settransno("SPA");
	$sql  = "insert into tr_spahd (cNoSPA,dTglSPA,dTglTerimaSPA,cKdProyek,cKdDept,cKeterangan,cStatus,cUserApproval,dTglApproval,cUserEntry,cDateEntry,cUserEdit,cDateEdit) ";
    $sql .= "values('$_POST[edtspa]','$tglspa','$tglterimaspa','$_POST[cmbproyek]','$_POST[cmbdept]','$_POST[mmket]','O','A','1900-01-01', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql); 
    $dokID  = $conn->Insert_ID();
  
  }
  // insert detail
  $sql  = "delete from tr_spadt where cIdSPA = '$_POST[fkey]' ";
  $conn->Execute($sql);
  foreach($_POST["kd_barang"] as $k=>$v)
  {
  
   if($_POST["tglbutuh"][$k]!=""){
	$tgl = explode("/",$_POST["tglbutuh"][$k]);
	$tglbutuh = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglbutuh = date('Y-m-d');
  }
  
    $sql  = "INSERT INTO tr_spadt (cIdSPA,cNoSPA,cKdBarang,nQtyReq,cKdSatuan,cKeterangan,dTglButuh,lamanya) ";
    $sql .= "VALUES ($dokID,'$_POST[edtspa]','".$_POST["kd_barang"][$k]."','".$_POST["val_qty"][$k]."',";
    $sql .= "'".$_POST["kd_satuan"][$k]."','".$_POST["nn_keterangan"][$k]."','$tglbutuh','".$_POST["lamanya"][$k]."')";	
	$conn->Execute($sql);
  }
	header("Location: $config[http]$_SERVER[REQUEST_URI]");
	exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql  = "delete from tr_spadt where cIdSPA = '$_POST[fkey]' ";
  $conn->Execute($sql);
  $sql = "delete from tr_spahd where cIdSPA = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.spa");
$sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept, spb.cNoSPB, CASE WHEN spb.cNoSPB IS NOT NULL THEN 'CLOSED' ELSE 'PROCESSING' END AS STATUS FROM tr_spahd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "LEFT JOIN (SELECT cNoSPB, cNoSPA FROM tr_spbhd) spb ON spb.cNoSPA = hd.cNoSPA "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdSPA = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.cNoSPA DESC ";
$admGrdTpl->moduleid  = "trans.spa";
$admGrdTpl->delform   = "m=trans.spa&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept, vNmDept FROM tm_dept ORDER BY cKdDept");
  
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_spadt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdSPA = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Surat Permintaan Alat";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>