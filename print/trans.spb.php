<?php
require_once "../includes/global.inc.php";
$css_js  = setcss_js_print();

$sql_hd  = "SELECT hd.*, pry.vNamaProyek, supp.vNmSupplier FROM tr_spbhd hd ";
$sql_hd .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql_hd .= "LEFT JOIN (SELECT cKdSupplier, vNmSupplier FROM tm_supplier) supp ON supp.cKdSupplier = hd.cKdSupplier ";
$sql_hd .= "WHERE hd.cIdSPB = '$_GET[key]' ";

$sql_dtl  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_spbdt dt ";
$sql_dtl .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
$sql_dtl .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
$sql_dtl .= "WHERE dt.cIdSPB = '$_GET[key]' ";

$viewTpl = new TPrintTemplate("../template/print.spb.tpl");
$viewTpl->SQL = $sql_dtl;
$viewTpl->template->MergeBlock("print_hd","adodb",$sql_hd);
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");


?>
