<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["tglanalisa"]!=""){
	$tgl = explode("/",$_POST["tglanalisa"]);
	$tglanalisa = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglanalisa = date('Y-m-d');
  }
  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	if($_POST["edtnoanalisa"]==""){
	  $noanalisa = settransno("TNI");
	  $genanalisa = "cNoAnalisa='$noanalisa',";
	}else{
	  $noanalisa = $_POST["edtnoanalisa"];
	  $genanalisa = "";
	}
	$sql  = "update tr_rusakhd set $genanalisa dTglAnalisa='$tglanalisa', cKetAnalisa='$_POST[mmketanalisa]', cFlagAnalisa='$_POST[chkanalisa]', "; 	
	$sql .= "cSupplier='$_POST[edtsupp]', cNoTukar='$_POST[edttukar]', cKdKerusakan='$_POST[cmbjnsrusak]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdRusak = '$dokID' ";
	$conn->Execute($sql);
  }
  // insert detail
  $sql  = "delete from tr_spadt where cIdSPA = '$_POST[fkey]' ";
  $conn->Execute($sql);
  foreach($_POST["kd_barang"] as $k=>$v){
    $sql  = "INSERT INTO tr_rusakdt (cIdRusak,cNoAnalisa,cKdBarang,nQty,nHarga,cKdSatuan,cKeterangan) ";
    $sql .= "VALUES ($dokID,'$noanalisa','".$_POST["kd_barang"][$k]."',".$_POST["val_qty"][$k].",".$_POST["val_price"][$k].",";
    $sql .= "'".$_POST["kd_satuan"][$k]."','".$_POST["nn_keterangan"][$k]."' )";	
	$conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  if($_POST["fid"]=="TERIMA"){
    $sql  = "update tr_rusakhd set cStatus = 'R', cUserPerima='$_SESSION[Logged]',dTglTerima=CURRENT_TIMESTAMP ";
    $sql .= "where cIdRusak = '$_POST[fkey]' ";
    $conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.analisaperbaikan");
$sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept, brg.vNmBarang FROM tr_rusakhd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek "; 
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
$sql .= " WHERE hd.dTglKirim IS NOT NULL AND  hd.cStatus IN ('S','R') ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " AND hd.cIdRusak = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.dTglRusak DESC ";
$admGrdTpl->moduleid  = "trans.analisaperbaikan";
$admGrdTpl->delform   = "m=trans.analisaperbaikan&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_jnsrusak","adodb","SELECT cKdKerusakan, vNamaKerusakan FROM tm_kerusakan ORDER BY vNamaKerusakan");
  
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_rusakdt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdRusak = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Form Analisa Perbaikan";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>