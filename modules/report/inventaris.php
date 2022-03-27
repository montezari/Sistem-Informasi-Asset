<?php

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.inventaris";

$reportTpl = new TTemplate($moduleid);
if($mode=="1"){
	$sql  = "SELECT vw.ckdbarang,pyk.cIdProyek,pyk.vnamaproyek,vw.ckdbarang,brg.vnmbarang,vw.cidasset,vw.ckdasset,SUM(vw.jumlah) AS jumlah ";
	$sql  .= "FROM vw_kartustockasset vw ";
	$sql  .= "LEFT JOIN tm_barang brg ON brg.ckdbarang=vw.ckdbarang ";
	$sql  .= "LEFT JOIN tm_proyek pyk ON pyk.cidproyek=vw.ckdproyek ";
	$sql  .= "LEFT JOIN tm_dept dept ON dept.cKdDept=vw.ckddept ";
	//$sql  .= "WHERE pyk.cIdProyek LIKE '%" .$_GET['proy']. "%' ";
	//$sql  .= "AND vw.ckddept LIKE '%" .$_GET['dept']. "%' ";
	$sql  .= "GROUP BY vw.ckdbarang,vw.ckdproyek,vw.ckdbarang,vw.cidasset,vw.ckdasset ";
	$sql  .= "HAVING SUM(vw.jumlah) > 0 ";
	$sql  .= "ORDER BY vw.cidasset "; 
	  $rs = $conn->Execute($sql);
	  $bykdata = $rs->RecordCount();
	  $i=0;
	  $datarpt = array();
	  while(!$rs->EOF){
    $datarpt[$i]["ckdbarang"] = $rs->fields["ckdbarang"];
    $datarpt[$i]["cIdProyek"] = $rs->fields["cIdProyek"];
    $datarpt[$i]["vnamaproyek"] = $rs->fields["vnamaproyek"];
    $datarpt[$i]["ckdbarang"] = $rs->fields["ckdbarang"];
    $datarpt[$i]["vnmbarang"] = $rs->fields["vnmbarang"];
    $datarpt[$i]["cidasset"] = $rs->fields["cidasset"];
    $datarpt[$i]["ckdasset"] = $rs->fields["ckdasset"];
    $datarpt[$i]["jumlah"] = $rs->fields["jumlah"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_blk',$datarpt);
}

$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan - Inventaris Baru";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>