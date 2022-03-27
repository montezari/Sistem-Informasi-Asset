<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;


if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $noadjust = $_POST["edtadjust"];
  if($_POST["tgladjust"]!=""){
	$tgl = explode("/",$_POST["tgladjust"]);
	$tgladjust = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tgladjust = date('Y-m-d');
  }
  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	$sql  = "update tr_adjusthd set TglAdjust='$tgladjust', cIdProyek='$_POST[cmbproyek]', cKdDept='$_POST[cmbdept]', cKeterangan='$_POST[mmket]',CJenisAdjust='$_POST[chkflag]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdAdjust = '$dokID' ";
	$conn->Execute($sql);
  }else{
    $noadjust = settransno("ADJ");
	$sql  = "insert into tr_adjusthd (cNoAdjust,TglAdjust,cIdProyek,cKdDept,cKeterangan,CJenisAdjust,cStatus,cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$noadjust','$tgladjust','$_POST[cmbproyek]','$_POST[cmbdept]','$_POST[mmket]','$_POST[chkflag]','O',";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql); 
    $dokID  = $conn->Insert_ID();

	}
  // insert detail
  $sql  = "delete from tr_adjustdt where cIdAdjust = '$_POST[fkey]' ";
  $conn->Execute($sql);
  foreach($_POST["kd_barang"] as $k=>$v){
    $sql  = "INSERT INTO tr_adjustdt (cIdAdjust,cNoAdjust,cKdBarang,cKdAsset,nQty,cKdSatuan,cKeterangan) ";
    $sql .= "VALUES ($dokID,'$noadjust','".$_POST["kd_barang"][$k]."','".$_POST["kd_asset"][$k]."','".$_POST["val_qty"][$k]."',";
    $sql .= "'".$_POST["kd_satuan"][$k]."','".$_POST["nn_keterangan"][$k]."' )";	
	$conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
echo $sql;


}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql  = "delete from tr_adjustdt where cIdAdjust = '$_POST[fkey]' ";
  $conn->Execute($sql);
  $sql = "delete from tr_adjusthd where cIdAdjust = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;


}

$admGrdTpl = new TGridTemplate("trans.adjust");
$sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept FROM tr_adjusthd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cIdProyek ";
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdAdjust = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.TglAdjust DESC ";
$admGrdTpl->moduleid  = "trans.adjust";
$admGrdTpl->delform   = "m=trans.adjust&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept, vNmDept FROM tm_dept ORDER BY cKdDept");
  
  $sql  = "SELECT dt.*, brg.vNmBarang, sat.vNmSatuan FROM tr_adjustdt dt ";
  $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = dt.cKdBarang ";
  $sql .= "LEFT JOIN (SELECT cKdSatuan, vNmSatuan FROM tm_satuan) sat ON sat.cKdSatuan = dt.cKdSatuan ";
  $sql .= "WHERE dt.cIdAdjust = '$_GET[key]' ";
  $admGrdTpl->template->MergeBlock("grid_dtl","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Form Adjusment Asset";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);



?>