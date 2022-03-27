<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
if($_REQUEST["act"] == "detail") $mode = 2;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $cIdSPA = $_POST["idspa"]; $cNoSPA = $_POST["edtspa"];
  $cIdSPB = $_POST["idspb"]; $cNoSPB = $_POST["edtspb"];
  $cIdGenerate = $_GET["key"].date('YmdHis');
  $dTglGenerate = date('Y-m-d H:i:s');
  
  $tglgen = date('YmdHis');
  foreach($_POST["kd_barang"] as $k=>$v){
    $kdbarang = $_POST["kd_barang"][$k];
    $nmbarang = $_POST["nm_barang"][$k];
    $kdsatuan = $_POST["kd_satuan"][$k];
    $qty = $_POST["val_qty_gen"][$k];
	$len = strlen($qty);
	$cnt = "0000000000000000000";
	for($idx=1; $idx<=$qty; $idx++){
	  $num = $cnt.strval($idx);
	  $num = substr($num,($len*-1)-1);
	  $cIdAsset = $kdbarang.$tglgen.$num;
      $sql  = "insert into tm_asset_gen (cIdAsset,cIdSPA,cNoSPA,cIdSPB,cNoSPB,cKdBarang,cKdSatuan,vNmAsset,cAktif,cIdGenerate,dTglGenerate, ";
      $sql .= "cUserEntry, cDateEntry) ";
      $sql .= "values('$cIdAsset',$cIdSPA,'$cNoSPA',$cIdSPB,'$cNoSPB','$kdbarang','$kdsatuan','$nmbarang', ";
	  $sql .= "'1','$cIdGenerate','$dTglGenerate','$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	  $conn->Execute($sql); 
	  
	 // $sql1  = "insert into tm_assetdt (cIdAsset,cProcessor,cMainBoard,cHarddisk,cVgaCard,cMemory,cDvdCd) ";
     // $sql1 .= "values('$cIdAsset','','','','','','') ";
	 // $conn->Execute($sql1); 
	}	
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
  
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  if($_POST["fgen"]=="0"){
	$sql = "update tm_asset_gen set cUserBatal='$_SESSION[Logged]',dTglBatal=CURRENT_TIMESTAMP where cIdGenerate = '$_POST[fkey]' and cKdBarang = '$_POST[fbrg]' ";
    $conn->Execute($sql);
  }elseif($_POST["fgen"]=="1"){
    $sql = "SELECT * FROM tm_asset_gen WHERE cIdGenerate = '$_POST[fkey]' AND cKdBarang = '$_POST[fbrg]' ";
	$rs = $conn->Execute($sql);
	while(!$rs->EOF){
	  $sql  = "INSERT INTO tm_asset (cIdAsset,cKdAsset,cIdSPA,cNoSPA,cIdSPB,cNoSPB,cKdBarang,cKdSatuan,dTglAsset,cAktif,cKomp,cIdGenerate,dTglGenerate, ";
	  $sql .= "cUserEntry,cDateEntry,cUserEdit,cDateEdit) values ( ";
	  $sql .= "'".$rs->fields["cIdAsset"]."','$assetno',".$rs->fields["cIdSPA"].",'".$rs->fields["cNoSPA"]."',".$rs->fields["cIdSPB"].",";
	  $sql .= "'".$rs->fields["cNoSPB"]."','".$rs->fields["cKdBarang"]."','".$rs->fields["cKdSatuan"]."',CURRENT_TIMESTAMP,'1','0','".$rs->fields["cIdGenerate"]."',";
	  $sql .= "'".$rs->fields["dTglGenerate"]."','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP ";
	  $sql .= ")";
	  $conn->Execute($sql);
	  $rs->MoveNext();
	  
	}
	$rs->Close();
	$sql  = "update tm_asset_gen set cUserPosting='$_SESSION[Logged]',cDatePosting=CURRENT_TIMESTAMP ";
	$sql .= "where cIdGenerate = '$_POST[fkey]' and cKdBarang = '$_POST[fbrg]' ";
    $conn->Execute($sql);
	
	/*GENERATE DETAIL ASSET*/
	$sql = "SELECT * FROM tm_asset_gen WHERE cIdGenerate = '$_POST[fkey]' AND cKdBarang = '$_POST[fbrg]' ";
	$rs1 = $conn->Execute($sql);
	while(!$rs1->EOF){
	  $sql1  = "insert into tm_assetdt (cIdAsset,cProcessor,cMainBoard,cHarddisk,cVgaCard,cMemory,cDvdCd) ";
      $sql1 .= "values('".$rs1->fields["cIdAsset"]."','cb','','','','','') ";
	  $conn->Execute($sql1);
	  $rs1->MoveNext();
	}
	$rs1->Close();
	
  }elseif($_POST["fgen"]=="2"){
    $sql = "SELECT * FROM tm_asset_gen WHERE cIdSPB = '$_POST[fkey]' ";
	$rs = $conn->Execute($sql);
	while(!$rs->EOF){
	  $assetno = setassetno($rs->fields["cKdBarang"]);
	  $sql  = "INSERT INTO tm_asset (cIdAsset,cKdAsset,cIdSPA,cNoSPA,cIdSPB,cNoSPB,cKdBarang,cKdSatuan,dTglAsset,cAktif,cKomp,cIdGenerate,dTglGenerate, ";
	  $sql .= "cUserEntry,cDateEntry,cUserEdit,cDateEdit) values ( ";
	  $sql .= "'".$rs->fields["cIdAsset"]."','$assetno',".$rs->fields["cIdSPA"].",'".$rs->fields["cNoSPA"]."',".$rs->fields["cIdSPB"].",";
	  $sql .= "'".$rs->fields["cNoSPB"]."','".$rs->fields["cKdBarang"]."','".$rs->fields["cKdSatuan"]."',CURRENT_TIMESTAMP,'1','0','".$rs->fields["cIdGenerate"]."',";
	  $sql .= "'".$rs->fields["dTglGenerate"]."','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP ";
	  $sql .= ")";
	  $conn->Execute($sql);
	  $rs->MoveNext();
	  
	}
	$rs->Close();
	$sql  = "update tm_asset_gen set cUserPosting='$_SESSION[Logged]',cDatePosting=CURRENT_TIMESTAMP ";
	$sql .= "where cIdSPB = '$_POST[fkey]' ";
    $conn->Execute($sql);
	
	/*GENERATE DETAIL ASSET*/
	$sql = "SELECT * FROM tm_asset_gen WHERE cIdSPB = '$_POST[fkey]' ";
	$rs1 = $conn->Execute($sql);
	while(!$rs1->EOF){
	  $sql1  = "insert into tm_assetdt (cIdAsset,cProcessor,cMainBoard,cHarddisk,cVgaCard,cMemory,cDvdCd) ";
      $sql1 .= "values('".$rs1->fields["cIdAsset"]."','','','','','','') ";
	  $conn->Execute($sql1);
	  $rs1->MoveNext();
	}
	$rs1->Close();	
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

if($mode=="0"){
  $title = "Generate Asset";
  $admGrdTpl = new TGridTemplate("trans.genasset");
  $sql  = "SELECT hd.*, pry.vNamaProyek FROM tr_spbhd hd ";
  $sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
  $sql .= "WHERE hd.cIdSPB IN ( ";
  $sql .= "  SELECT DISTINCT hd.cIdSPB ";
  $sql .= "  FROM ( ";
  $sql .= "    SELECT cIdSPB, cNoSPB, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt "; 
  $sql .= "    GROUP BY cIdSPB, cNoSPB, cKdBarang ";
  $sql .= "  ) hd "; 
  $sql .= "  LEFT JOIN ( ";
  $sql .= "    SELECT cIdSPB, cNoSPB, cKdBarang, COUNT(*) AS jml FROM tm_asset_gen "; 
  $sql .= "    WHERE dTglbatal IS NULL "; 
  $sql .= "    GROUP BY cIdSPB, cNoSPB, cKdBarang ";
  $sql .= "  ) dt ON hd.cIdSPB = dt.cIdSPB AND hd.cKdBarang = dt.cKdBarang ";
  $sql .= "  WHERE (hd.nQty-COALESCE(dt.jml,0))>0 ";
  $sql .= ") ";
  //$sql .= "OR hd.cIdSPB IN (SELECT DISTINCT cIdSPB FROM tm_asset_gen WHERE cDatePosting IS NULL) ";
  if($_GET["key"] != "" || $_GET["mode"] == "form"){
    $sql .= " AND hd.cIdSPB = '$_GET[key]' ";
  }
  $sql .= "ORDER BY hd.dTglSPB DESC ";
  $admGrdTpl->moduleid  = "trans.genasset";
  $admGrdTpl->delform   = "m=trans.genasset&page=$_GET[page]";
  $admGrdTpl->custSQL = $sql;
  $isi = $admGrdTpl->Show(false);
}elseif($mode=="1"){
  $title = "Generate Asset - Detail";
  $dtltpl = new TGridTemplate("trans.genasset");
  $sql  = "SELECT cIdGenerate, DATE_FORMAT(hd.dTglGenerate,'%d/%m/%Y') AS dTglGenerate, hd.cIdSPB, hd.cNoSPB, hd.cIdSPA, hd.cNoSPA, ";
  $sql .= "hd.cKdBarang, brg.vNmBarang, DATE_FORMAT(hd.dTglBatal,'%d/%m/%Y') as dTglBatal, DATE_FORMAT(hd.cDatePosting,'%d/%m/%Y') as cDatePosting, ";
  $sql .= "COUNT(*) AS jml "; 
  $sql .= "FROM tm_asset_gen hd ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
  $sql .= "WHERE hd.cIdSPB = '$_GET[key]' "; 
  //$sql .= "AND dTglbatal IS NULL "; 
  $sql .= "GROUP BY cIdGenerate, DATE_FORMAT(hd.dTglGenerate,'%d/%m/%Y'), hd.cIdSPB, hd.cNoSPB, hd.cKdBarang, brg.vNmBarang, ";
  $sql .= "DATE_FORMAT(hd.dTglBatal,'%d/%m/%Y'), DATE_FORMAT(hd.cDatePosting,'%d/%m/%Y') ";
  $dtltpl->moduleid  = "trans.genasset";
  $dtltpl->delform   = "m=trans.genasset&page=$_GET[page]";
  $dtltpl->custSQL = $sql;
  $isi = $dtltpl->Show(false);
}elseif($mode=="2"){
  $title = "Generate Asset - Form";
  $subtpl = new TGridTemplate("trans.genasset");
  $sql  = "SELECT hd.*, pry.vNamaProyek FROM tr_spbhd hd ";
  $sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
  $sql .= " WHERE hd.cIdSPB = '$_GET[key]' ";
  $subtpl->moduleid  = "trans.genasset";
  $subtpl->delform   = "m=trans.genasset&page=$_GET[page]";
  $subtpl->custSQL = $sql;

  $sql  = "SELECT hd.cKdBarang, hd.cKdBarang, brg.vNmBarang, hd.cKdSatuan, sat.vNmSatuan, ";
  $sql .= "hd.nQty, COALESCE(dt.jml,0) jml, hd.nQty-COALESCE(dt.jml,0) nsisa ";
  $sql .= "FROM ( ";
  $sql .= "  SELECT cIdSPB, cNoSPB, cKdBarang, cKdSatuan, SUM(nQty) AS nQty FROM tr_spbdt "; 
  $sql .= "  GROUP BY cIdSPB, cNoSPB, cKdBarang, cKdSatuan ";
  $sql .= ") hd "; 
  $sql .= "LEFT JOIN ( ";
  $sql .= "  SELECT cIdSPB, cNoSPB, cKdBarang, COUNT(*) AS jml FROM tm_asset_gen "; 
  $sql .= "  WHERE dTglbatal IS NULL "; 
  $sql .= "  GROUP BY cIdSPB, cNoSPB, cKdBarang ";
  $sql .= ") dt ON hd.cIdSPB = dt.cIdSPB AND hd.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = hd.cKdSatuan ";
  $sql .= "WHERE (hd.nQty-COALESCE(dt.jml,0))>0 ";
  $sql .= "AND hd.cIdSPB = '$_GET[key]' "; 
  $subtpl->template->MergeBlock("grid_dtl","adodb",$sql);

  $isi = $subtpl->Show(false);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $title;
$gTpl->display  = $isi;
$content = $gTpl->Show(false);

?>