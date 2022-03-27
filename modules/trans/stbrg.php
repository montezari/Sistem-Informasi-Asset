<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tr_bpbhd set cKetTerima='$_POST[mmketterima]', cStatus = 'F', cUserTerima='$_SESSION[Logged]',dTglTerima=CURRENT_TIMESTAMP ";
    $sql .= "where cIdBPB = '$_POST[fkey]' ";
	$conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.stbrg");
$sql  = "SELECT hd.*, prykirim.vNamaProyek AS vNamaProyekKirim, pryterima.vNamaProyek AS vNamaProyekTerima, ";
$sql .= "deptterima.vNmDept AS vNmDeptTerima FROM tr_bpbhd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) prykirim ON prykirim.cIdProyek = hd.cKdProyekKirim ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pryterima ON pryterima.cIdProyek = hd.cKdProyekTerima ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) deptterima ON deptterima.cKdDept = hd.cKdDeptTerima "; 
//$sql .= "WHERE hd.dTglKirim IS NOT NULL ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdBPB = '$_GET[key]' and hd.dTglKirim IS NOT NULL ";
}
$sql .= "ORDER BY hd.dTglBPB DESC ";
$admGrdTpl->moduleid  = "trans.stbrg";
$admGrdTpl->delform   = "m=trans.stbrg&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_bpbdt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdBPB = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Serah Terima Barang";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>