<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $nospb = $_POST["edtspb"];
  if($_POST["tglspb"]!=""){
	$tgl = explode("/",$_POST["tglspb"]);
	$tglspb = "'".$tgl[2]."-".$tgl[1]."-".$tgl[0]."'";
  }else{
	$tglspb = "'".date('Y-m-d')."'";
  }
  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	$sql  = "update tr_spbhd set dTglSPB=$tglspb, cNoSPM='$_POST[edtspm]', cNoOP='$_POST[edtop]', cNoSJ='$_POST[edtnosj]', ";
	$sql .= "cExpedisi='$_POST[edtekspedisi]', cKdSupplier='$_POST[idsupp]', cKdProyek='$_POST[cmbproyek]', cKeterangan='$_POST[mmket]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdSPB = '$dokID' ";
	$conn->Execute($sql);
  }else{
    $nospb = settransno("SPB");
	$sql  = "insert into tr_spbhd (cNoSPB, dTglSPB, cIdSPA, cNoSPA, cNoSPM, cNoOP, cNoSJ, dTglSJ, cExpedisi, cKdSupplier, cKdProyek, cKeterangan,";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$nospb',$tglspb,$_POST[idspa],'$_POST[edtspa]','$_POST[edtspm]','$_POST[edtop]',";
	$sql .= "'$_POST[edtnosj]',CURRENT_TIMESTAMP,'$_POST[edtekspedisi]','$_POST[idsupp]','$_POST[cmbproyek]','$_POST[mmket]',";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql); 
    $dokID  = $conn->Insert_ID();
  }
  // insert detail
  $sql  = "delete from tr_spbdt where cIdSPB = '$_POST[fkey]' ";
  $conn->Execute($sql);
  foreach($_POST["kd_barang"] as $k=>$v){
    $sql  = "INSERT INTO tr_spbdt (cIdSPB,cNoSPB,cIdSPA,cNoSPA,cKdBarang,nQty,cKdSatuan,cKeterangan) ";
    $sql .= "VALUES ($dokID,'$nospb',$_POST[idspa],'$_POST[edtspa]','".$_POST["kd_barang"][$k]."','".$_POST["val_qty"][$k]."',";
    $sql .= "'".$_POST["kd_satuan"][$k]."','".$_POST["nn_keterangan"][$k]."' )";	
	$conn->Execute($sql);
  }
  
  /*
  doSendEmailKonfirmasi("edi.jusanto@tatamulia.co.id","Edi Jusanto",$nospb);
  doSendEmailKonfirmasi("windyoko@tatamulia.co.id","Windyoko",$nospb);
  doSendEmailKonfirmasi("budi@dutaciptasolusindo.com","Budi Santoso",$nospb);
  doSendEmailKonfirmasi("ridwan@dutaciptasolusindo.com","Ridwan Montezari",$nospb);
  doSendEmailKonfirmasi("iwan@dutaciptasolusindo.com","Iwan Setiawan",$nospb);
   */
  
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql  = "delete from tr_spbdt where cIdSPB = '$_POST[fkey]' ";
  $conn->Execute($sql);
  $sql = "delete from tr_spbhd where cIdSPB = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.spb");
$sql  = "SELECT hd.*, pry.vNamaProyek FROM tr_spbhd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek ";
$sql .= "LEFT JOIN (SELECT cKdSupplier, vNmSupplier FROM tm_supplier) supp ON supp.cKdSupplier = hd.cKdSupplier ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdSPB = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.dTglSPB DESC ";
$admGrdTpl->moduleid  = "trans.spb";
$admGrdTpl->delform   = "m=trans.spb&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  //$admGrdTpl->template->MergeBlock("blk_proy","adodb","SELECT pyk.cIdProyek,pyk.vNamaProyek FROM tm_proyek pyk LEFT JOIN tr_spahd spa ON pyk.cIdProyek=spa.cKdProyek WHERE spa.cIdSPA='$_POST[idspa]' ORDER BY pyk.cIdProyek");
   $admGrdTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
   
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_spbdt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdSPB = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Surat Penerimaan Barang";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>