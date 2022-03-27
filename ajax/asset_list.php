<?php
require_once "../includes/global.inc.php";

$page = $_GET['page'];
$limit = $_GET['rows']; 
$sidx = $_GET['sidx'];
$sord = $_GET['sord'];
$searchTerm = $_GET['searchTerm'];
$param = $_GET['param'];

if(!$sidx) $sidx =1;
if ($searchTerm=="") {
	$searchTerm="%";
} else {
	$searchTerm = "%" . $searchTerm . "%";
}

$sql = "SELECT COUNT(*) AS count FROM vw_kartustockasset WHERE cKdAsset like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT aset.cKdAsset,aset.cKdBarang,brg.vNmBarang, aset.cKdSatuan,sat.vNmSatuan FROM vw_kartustockasset aset ";
$sql .= "LEFT JOIN tm_barang brg on aset.ckdbarang = brg.ckdbarang ";
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = brg.cKdSatuan WHERE ";

if($total_pages!=0) $sql = $sql." aset.cKdAsset like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND aset.cKdAsset like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["cKdAsset"]=$rs->fields["cKdAsset"];
  $response->rows[$i]["cKdBarang"]=$rs->fields["cKdBarang"];
  $response->rows[$i]["vNmBarang"]=$rs->fields["vNmBarang"];
  $response->rows[$i]["cKdSatuan"]=$rs->fields["cKdSatuan"];
  $response->rows[$i]["vNmSatuan"]=$rs->fields["vNmSatuan"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
