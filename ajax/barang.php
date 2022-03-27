<?php
require_once "../includes/global.inc.php";

$page = $_GET['page'];
$limit = $_GET['rows']; 
$sidx = $_GET['sidx'];
$sord = $_GET['sord'];
$searchTerm = $_GET['searchTerm'];
if(!$sidx) $sidx =1;
if ($searchTerm=="") {
	$searchTerm="%";
} else {
	$searchTerm = "%" . $searchTerm . "%";
}

$sql = "SELECT COUNT(*) AS count FROM tm_barang WHERE vNmBarang like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT brg.cKdBarang, brg.vNmBarang, grp.vNmGroupBarang, brg.cKdSatuan, sat.vNmSatuan FROM tm_barang brg ";
$sql .= "LEFT JOIN (SELECT cKdGroupBarang, vNmGroupBarang FROM tm_grpbarang) grp ON grp.cKdGroupBarang = brg.cKdGroupBarang ";
$sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = brg.cKdSatuan ";

if($total_pages!=0) $sql = $sql." WHERE brg.vNmBarang like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." WHERE brg.vNmBarang like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["cKdBarang"]=$rs->fields["cKdBarang"];
  $response->rows[$i]["vNmBarang"]=$rs->fields["vNmBarang"];
  $response->rows[$i]["vNmGroupBarang"]=$rs->fields["vNmGroupBarang"];
  $response->rows[$i]["cKdSatuan"]=$rs->fields["cKdSatuan"];
  $response->rows[$i]["vNmSatuan"]=$rs->fields["vNmSatuan"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
