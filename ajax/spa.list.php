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

$sql  = "SELECT COUNT(*)  AS count "; 
$sql .= "FROM tr_spahd hd "; 
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "WHERE hd.cIdSPA IN ( ";
$sql .= "  SELECT spa.cIdSPA ";
$sql .= "  FROM (SELECT cIdSPA, cKdBarang, SUM(nQtyReq) AS nQtyReq FROM tr_spadt GROUP BY cIdSPA, cKdBarang) spa ";
$sql .= "  LEFT JOIN ( ";
$sql .= "	 SELECT cIdSPA, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt GROUP BY cIdSPA, cKdBarang ";
$sql .= "  ) spb ON spb.cIdSPA = spa.cIdSPA AND spb.cKdBarang = spa.cKdBarang ";
$sql .= "  WHERE (spa.nQtyReq-COALESCE(spb.nQty,0))>0 ";
$sql .= ") ";
$sql .= "AND hd.cStatus = 'A' AND hd.cNoSPA like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT hd.cIdSPA, hd.cNoSPA, DATE_FORMAT(hd.dTglSPA,'%d/%m/%Y') AS dTglSPA, hd.cKdProyek, pry.vNamaProyek, hd.cKdDept, dept.vNmDept "; 
$sql .= "FROM tr_spahd hd "; 
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "WHERE hd.cIdSPA IN ( ";
$sql .= "  SELECT spa.cIdSPA ";
$sql .= "  FROM (SELECT cIdSPA, cKdBarang, SUM(nQtyReq) AS nQtyReq FROM tr_spadt GROUP BY cIdSPA, cKdBarang) spa ";
$sql .= "  LEFT JOIN ( ";
$sql .= "	 SELECT cIdSPA, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt GROUP BY cIdSPA, cKdBarang ";
$sql .= "  ) spb ON spb.cIdSPA = spa.cIdSPA AND spb.cKdBarang = spa.cKdBarang ";
$sql .= " WHERE (spa.nQtyReq-COALESCE(spb.nQty,0))>0 ";
$sql .= ") ";

if($total_pages!=0) $sql = $sql." AND hd.cStatus = 'A' AND hd.cNoSPA like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND hd.cStatus = 'A' AND hd.cNoSPA like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["cIdSPA"]=$rs->fields["cIdSPA"];
  $response->rows[$i]["cNoSPA"]=$rs->fields["cNoSPA"];
  $response->rows[$i]["dTglSPA"]=$rs->fields["dTglSPA"];
  $response->rows[$i]["vNamaProyek"]=$rs->fields["vNamaProyek"];
  $response->rows[$i]["vNmDept"]=$rs->fields["vNmDept"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
