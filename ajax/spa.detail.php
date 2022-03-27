<?php
require_once "../includes/global.inc.php";

$sql  = "SELECT spa.cIdSPA, spa.cKdBarang, (spa.nQtyReq-COALESCE(spb.nQty,0)) AS nQty, spa.cKdSatuan, spa.cKeterangan, brg.vNmBarang, sat.vNmSatuan ";
$sql .= "FROM (SELECT cIdSPA, cKdBarang, cKdSatuan, cKeterangan, SUM(nQtyReq) AS nQtyReq FROM tr_spadt GROUP BY cIdSPA, cKdBarang, cKdSatuan, cKeterangan) spa ";
$sql .= "LEFT JOIN ( ";
$sql .= "SELECT cIdSPA, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt GROUP BY cIdSPA, cKdBarang ";
$sql .= ") spb ON spb.cIdSPA = spa.cIdSPA AND spb.cKdBarang = spa.cKdBarang ";
$sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = spa.cKdBarang ";
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = spa.cKdSatuan ";
$sql .= "WHERE (spa.nQtyReq-COALESCE(spb.nQty,0))>0 ";
$sql .= "AND spa.cIdSPA = '$_GET[id]' "; 
$rs = $conn->Execute($sql);

$i=0;
while(!$rs->EOF){
  $rows[$i]["cKdBarang"]=$rs->fields["cKdBarang"];
  $rows[$i]["vNmBarang"]=$rs->fields["vNmBarang"];
  $rows[$i]["nQty"]=$rs->fields["nQty"];
  $rows[$i]["cKdSatuan"]=$rs->fields["cKdSatuan"];
  $rows[$i]["vNmSatuan"]=$rs->fields["vNmSatuan"];
  $rows[$i]["cKeterangan"]=$rs->fields["cKeterangan"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($rows);

?>
