<?php
require_once "../includes/global.inc.php";

$sql .= "SELECT vwasset.*,spb.cIdSPB,asset.cNoSPB,brg.vNmBarang,sat.vNmSatuan ";
$sql .= "FROM vw_kartustockasset vwasset ";
$sql .= "LEFT JOIN tm_asset asset ON asset.cIdAsset=vwasset.cIdAsset ";
$sql .= "LEFT JOIN (SELECT cIdSPB,cNoSPB FROM tr_spbhd) spb ON spb.cNoSPB = asset.cNoSPB ";
$sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = asset.cKdBarang ";
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = asset.cKdSatuan ";
$sql .= "WHERE asset.cnospb IS NOT NULL ";
$sql .= "AND spb.cIdSPB = '$_GET[id]' "; 
$rs = $conn->Execute($sql);

$i=0;
while(!$rs->EOF){
  $rows[$i]["cKdBarang"]=$rs->fields["cKdBarang"];
  $rows[$i]["vNmBarang"]=$rs->fields["vNmBarang"];
  $rows[$i]["jumlah"]=$rs->fields["jumlah"];
  $rows[$i]["cKdSatuan"]=$rs->fields["cKdSatuan"];
  $rows[$i]["vNmSatuan"]=$rs->fields["vNmSatuan"];
  $rows[$i]["cKdAsset"]=$rs->fields["cKdAsset"];
  $rows[$i]["cIdAsset"]=$rs->fields["cIdAsset"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($rows);

?>
