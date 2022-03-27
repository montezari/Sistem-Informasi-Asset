<?php
require_once "../includes/global.inc.php";
$css_js  = setcss_js_print();

$proyid = $_GET["proy"];
$deptid = $_GET["dept"];

$sql  = "SELECT vw.ckdbarang,pyk.cIdProyek,pyk.vnamaproyek,vw.ckdbarang,brg.vnmbarang,vw.cidasset,vw.ckdasset,SUM(vw.jumlah) AS jumlah ";
$sql  .= "FROM vw_kartustockasset vw ";
$sql  .= "LEFT JOIN tm_barang brg ON brg.ckdbarang=vw.ckdbarang ";
$sql  .= "LEFT JOIN tm_proyek pyk ON pyk.cidproyek=vw.ckdproyek ";
$sql  .= "LEFT JOIN tm_dept dept ON dept.cKdDept=vw.ckddept ";
$sql  .= "WHERE pyk.cIdProyek LIKE '%" .$_GET['proy']. "%' ";
$sql  .= "GROUP BY vw.ckdbarang,vw.ckdproyek,vw.ckdbarang,vw.cidasset,vw.ckdasset ";
$sql  .= "HAVING SUM(vw.jumlah) > 0 ";
$sql  .= "ORDER BY vw.cidasset ";


$viewTpl = new TPrintTemplate("../template/print.inventarisstock.tpl");
$viewTpl->SQL = $sql;
include_once("../template/header.php");
$viewTpl->Show();
include_once ("../template/footer.php");

?>
