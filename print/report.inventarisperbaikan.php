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


$sql  = "SELECT rusakhd.cNoRusak,rusakhd.dTglRusak,rusakhd.cKdProyek,pyk.vNamaProyek,supp.vNmSupplier,rusakhd.cKdAsset, ";
$sql  .= "rusakhd.cKetRusak,brg.vNmBarang,rusakdt.nqty,rusakhd.dTglAnalisa,rusakhd.cKetAnalisa ";
$sql  .= "FROM tr_rusakhd rusakhd "; 
$sql  .= "LEFT JOIN tr_rusakdt rusakdt ON rusakhd.cIdRusak = rusakdt.cIdRusakDet ";
$sql  .= "LEFT JOIN tm_proyek pyk ON pyk.cIdProyek=rusakhd.cKdProyek ";
$sql  .= "LEFT JOIN tm_asset asset ON asset.cKdAsset=rusakhd.cKdAsset ";
$sql  .= "LEFT JOIN tm_barang brg ON brg.cKdBarang=asset.cKdBarang ";
$sql  .= "LEFT JOIN tm_supplier supp ON supp.cKdSupplier=rusakhd.cSupplier ";
$sql  .= "WHERE STR_TO_DATE(rusakhd.dTglRusak,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";

$viewTpl = new TPrintTemplate("../template/print.inventarisperbaikan.tpl");
$viewTpl->SQL = $sql;
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");

?>
