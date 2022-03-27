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


$sql  = "SELECT spbhd.cNoSPB,spbhd.dTglSPB,spbhd.cKdProyek,supp.vNmSupplier,spbhd.cKdSupplier,spbdt.cKdBarang,brg.vNmBarang,spbdt.nqty ";
$sql  .= "FROM tr_spbhd spbhd "; 
$sql  .= "LEFT JOIN tr_spbdt spbdt ON spbhd.cNoSPB = spbdt.cNoSPB ";
$sql  .= "LEFT JOIN tm_barang brg ON brg.cKdBarang=spbdt.cKdBarang ";
$sql  .= "LEFT JOIN tm_supplier supp ON supp.cKdSupplier=spbhd.cKdSupplier ";
$sql  .= "WHERE STR_TO_DATE(spbhd.dTglSPB,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";

$viewTpl = new TPrintTemplate("../template/print.inventarispembelian.tpl");
$viewTpl->SQL = $sql;
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");

?>
