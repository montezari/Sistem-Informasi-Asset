<?php
require_once "includes/global.inc.php";
$css_js  = setcss_js();

if($_GET["type"]=="spa"){
  $tplname  = "trans.popup.spa";
  $sql_hd  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept FROM tr_spahd hd ";
  $sql_hd .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
  $sql_hd .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
  $sql_hd .= "WHERE hd.cIdSPA = '$_GET[key]' ";

/*
  $sql_dtl  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_spadt dt ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql_dtl .= "WHERE dt.cIdSPA = '$_GET[key]' ";
*/
  $sql_dtl  = "SELECT spa.cIdSPA, spa.cKdBarang, spa.nQtyReq, COALESCE(spb.nQty,0) as nQtySPB, (spa.nQtyReq-COALESCE(spb.nQty,0)) AS nQty, ";
  $sql_dtl .= "spa.cKdSatuan, spa.cKeterangan, brg.vNmBarang, sat.vNmSatuan ";
  $sql_dtl .= "FROM (SELECT cIdSPA, cKdBarang, cKdSatuan, cKeterangan, SUM(nQtyReq) AS nQtyReq FROM tr_spadt GROUP BY cIdSPA,cKdBarang,cKdSatuan,cKeterangan) spa ";
  $sql_dtl .= "LEFT JOIN ( ";
  $sql_dtl .= "SELECT cIdSPA, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt GROUP BY cIdSPA, cKdBarang ";
  $sql_dtl .= ") spb ON spb.cIdSPA = spa.cIdSPA AND spb.cKdBarang = spa.cKdBarang ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = spa.cKdBarang ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = spa.cKdSatuan ";
  $sql_dtl .= "WHERE spa.cIdSPA = '$_GET[key]' "; 

}elseif($_GET["type"]=="rusak"){
  $tplname  = "trans.popup.kerusakan";
  $sql_hd  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept, brg.vNmBarang, jns.vNamaKerusakan FROM tr_rusakhd hd ";
  $sql_hd .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek "; 
  $sql_hd .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
  $sql_hd .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
  $sql_hd .= "LEFT JOIN (SELECT cKdKerusakan, vNamaKerusakan FROM tm_kerusakan) jns ON jns.cKdKerusakan = hd.cKdKerusakan ";
  $sql_hd .= " WHERE hd.dTglKirim IS NOT NULL AND  hd.cStatus IN ('S','R') ";
  $sql_hd .= " AND hd.cIdRusak = '$_GET[key]' ";
 
  $sql_dtl  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_rusakdt dt ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql_dtl .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql_dtl .= "WHERE dt.cIdRusak = '$_GET[key]' ";
}

$viewTpl = new TGridTemplate($tplname);
$viewTpl->custSQL = $sql_dtl;
$viewTpl->template->MergeBlock("grid_hd","adodb",$sql_hd);
include_once($config["dir_tpl"]."header.php");
$viewTpl->Show();
include_once ($config["dir_tpl"]."footer.php");

?>