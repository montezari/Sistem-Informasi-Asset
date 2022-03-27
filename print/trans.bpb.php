<?php
require_once "../includes/global.inc.php";
$css_js  = setcss_js_print();

$sql_hd  = "SELECT hd.*, prykirim.vNamaProyek as vNamaProyekKirim, pryterima.vNamaProyek as vNamaProyekTerima, dept.vNmDept FROM tr_bpbhd hd ";
$sql_hd .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) prykirim ON prykirim.cIdProyek = hd.cKdProyekKirim ";
$sql_hd .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pryterima ON pryterima.cIdProyek = hd.cKdProyekTerima ";
$sql_hd .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDeptTerima "; 
$sql_hd .= "WHERE hd.cIdBPB = '$_GET[key]' ";

$sql_dtl  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_bpbdt dt ";
$sql_dtl .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
$sql_dtl .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
$sql_dtl .= "WHERE dt.cIdBPB = '$_GET[key]' ";

$viewTpl = new TPrintTemplate("../template/print.bpb.tpl");
$viewTpl->SQL = $sql_dtl;
$viewTpl->template->MergeBlock("print_hd","adodb",$sql_hd);
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");

?>
