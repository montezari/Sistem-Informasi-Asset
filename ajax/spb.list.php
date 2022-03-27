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

$sql  = "SELECT COUNT(*)  AS COUNT ";
$sql .= "FROM vw_kartustockasset vwasset ";
$sql .= "LEFT JOIN tm_asset asset ";
$sql .= "ON asset.ckdasset=vwasset.ckdasset ";
$sql .= "where asset.cNoSPB like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql = "SELECT spb.cIdSPB,asset.cNoSPB,pry.vNamaProyek,dept.vNmDept "; 
$sql .= "FROM vw_kartustockasset vwasset ";
$sql .= "LEFT JOIN tm_asset asset ON asset.cIdAsset=vwasset.cIdAsset ";
$sql .= "LEFT JOIN (SELECT cKdProyek,cIdSPB,cNoSPB FROM tr_spbhd) spb ON spb.cNoSPB = asset.cNoSPB "; 
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = spb.cKdProyek "; 
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = vwasset.cKdDept ";  
$sql .= "WHERE asset.cNoSPB IS NOT NULL ";

if($total_pages!=0) $sql = $sql." AND asset.cNoSPB like '$searchTerm' GROUP BY spb.cIdSPB,asset.cNoSPB,pry.vNamaProyek,dept.vNmDept ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND asset.cNoSPB like '$searchTerm' GROUP BY spb.cIdSPB,asset.cNoSPB,pry.vNamaProyek,dept.vNmDept ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["cIdSPB"]=$rs->fields["cIdSPB"];
  $response->rows[$i]["cNoSPB"]=$rs->fields["cNoSPB"];
  $response->rows[$i]["vNamaProyek"]=$rs->fields["vNamaProyek"];
  $response->rows[$i]["vNmDept"]=$rs->fields["vNmDept"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
