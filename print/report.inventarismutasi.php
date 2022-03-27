<?php
require_once "../includes/global.inc.php";
$css_js  = setcss_js_print();

if(isset($_GET["tglawal"]) && $_GET["tglawal"] != ""){
  $tgl = explode("/",$_GET["tglawal"]);
  $tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
}else{
  $tglawal = date('Y-m-d');
}
if(isset($_GET["tglakhir"]) && $_GET["tglakhir"] != ""){
  $tgl = explode("/",$_GET["tglakhir"]);
  $tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
}else{
  $tglakhir = date('Y-m-d');
}

$sql  = "SELECT hd.*, prykirim.vNamaProyek AS vNamaProyekKirim, pryterima.vNamaProyek AS vNamaProyekTerima, "; 
$sql .= "deptterima.vNmDept AS vNmDeptTerima,dt.cKdAsset,dt.nQty,dt.cKdSatuan,brg.vNmBarang FROM tr_bpbhd hd "; 
$sql .= "LEFT JOIN tr_bpbdt dt ON dt.cIdBPBDet=hd.cIdBPB ";
$sql .= "LEFT JOIN tm_barang brg ON brg.cKdBarang=dt.cKdBarang ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) prykirim ON prykirim.cIdProyek = hd.cKdProyekKirim ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pryterima ON pryterima.cIdProyek = hd.cKdProyekTerima ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) deptterima ON deptterima.cKdDept = hd.cKdDeptTerima "; 
$sql  .= "WHERE STR_TO_DATE(hd.dTglBPB,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";

$viewTpl = new TPrintTemplate("../template/print.inventarismutasi.tpl");
$viewTpl->SQL = $sql;
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");

?>
