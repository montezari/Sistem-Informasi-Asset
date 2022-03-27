<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $nobpb = $_POST["edtbpb"];
  if($_POST["tglbpb"]!=""){
	$tgl = explode("/",$_POST["tglbpb"]);
	$tglbpb = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglbpb = date('Y-m-d');
  }
  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	$sql  = "update tr_bpbhd set dTglBPB='$tglbpb',cIdSPB='$_POST[idspb]',cKdProyekKirim='$_POST[cmbproykirim]',cKdProyekTerima='$_POST[cmbproyterima]',";
	$sql .= "cKdDeptTerima='$_POST[cmbdeptterima]',cExpedisi='$_POST[edtexpedisi]',cNoMobil='$_POST[edtnomobil]', cKetKirim='$_POST[mmket]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdBPB = '$dokID' ";
	$conn->Execute($sql);
  }else{
    $nobpb = settransno("BPB");
	$sql  = "insert into tr_bpbhd (cNoBPB,cIdSPB,dTglBPB,cKdProyekKirim,cKdProyekTerima,cKdDeptTerima,cExpedisi,cNoMobil,cKetKirim,cStatus,";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$nobpb','$_POST[idspb]','$tglbpb','$_POST[cmbproykirim]','$_POST[cmbproyterima]','$_POST[cmbdeptterima]','$_POST[edtexpedisi]','$_POST[edtnomobil]',";
	$sql .= "'$_POST[mmket]','O','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql);
    $dokID  = $conn->Insert_ID();
  }
  // insert detail
  $sql  = "delete from tr_bpbdt where cIdBPB = '$_POST[fkey]' ";
  $conn->Execute($sql);
  foreach($_POST["kd_barang"] as $k=>$v){
    $sql  = "INSERT INTO tr_bpbdt (cIdBPB,cNoBPB,cKdBarang,cIdAsset,cKdAsset,nQty,cKdSatuan,cKeterangan) ";
    $sql .= "VALUES ($dokID,'$nobpb','".$_POST["kd_barang"][$k]."','".$_POST["id_asset"][$k]."','".$_POST["kd_asset"][$k]."',1,";
    $sql .= "'".$_POST["kd_satuan"][$k]."','".$_POST["nn_keterangan"][$k]."' )";	
	$conn->Execute($sql);
  }
  //header("Location: $config[http]$_SERVER[REQUEST_URI]");
  //exit;
  
  
}elseif(strtoupper($_POST["FormAction"])=="PROSES"){
  if($_POST["fid"]=="KIRIM"){
    $sql  = "update tr_bpbhd set cStatus = 'S', cUserPengirim='$_SESSION[Logged]',dTglKirim=CURRENT_TIMESTAMP ";
    $sql .= "where cIdBPB = '$_POST[fkey]' ";
    $conn->Execute($sql);
  }elseif($_POST["fid"]=="HAPUS"){
    $sql  = "delete from tr_bpbdt where cIdBPB = '$_POST[fkey]' ";
    $conn->Execute($sql);
    $sql = "delete from tr_bpbhd where cIdBPB = '$_POST[fkey]' ";
    $conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.bpb");
$sql  = "SELECT hd.*,spb.cNoSPB, prykirim.vNamaProyek AS vNamaProyekKirim, pryterima.vNamaProyek AS vNamaProyekTerima, ";
$sql .= "deptterima.vNmDept AS vNmDeptTerima FROM tr_bpbhd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) prykirim ON prykirim.cIdProyek = hd.cKdProyekKirim ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pryterima ON pryterima.cIdProyek = hd.cKdProyekTerima ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) deptterima ON deptterima.cKdDept = hd.cKdDeptTerima "; 
$sql .= "LEFT JOIN (SELECT cIdSPB,cNoSPB FROM tr_spbhd) spb ON spb.cIdSPB = hd.cIdSPB ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdBPB = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.dTglBPB DESC ";
$admGrdTpl->moduleid  = "trans.bpb";
$admGrdTpl->delform   = "m=trans.bpb&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_proykirim","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_proyterima","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_deptterima","adodb","SELECT cKdDept, vNmDept FROM tm_dept ORDER BY cKdDept");
  
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_bpbdt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdBPB = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Bukti Pengeluaran Barang";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>