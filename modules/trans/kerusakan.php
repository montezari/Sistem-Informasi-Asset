<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $norusak = $_POST["edtrusak"];
  if($_POST["tglrusak"]!=""){
	$tgl = explode("/",$_POST["tglrusak"]);
	$tglrusak = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglrusak = date('Y-m-d');
  }
    
  if($_POST["fkey"] != ""){
    $dokID = $_POST["fkey"];
	$sql  = "update tr_rusakhd set dTglRusak='$tglrusak', cKdProyek='$_POST[cmbproyek]', cKdDept='$_POST[cmbdept]', cKdBarang='$_POST[kd_barang]', ";
	$sql .= "cKdSatuan='$_POST[kd_satuan]', cIdAsset='$_POST[id_asset]', cKdAsset='$_POST[kd_asset]', cKetRusak='$_POST[mmket]', cFlagKirim='$_POST[chkflag]', ";
	$sql .= "cKetKirim='$_POST[mmketlain]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdRusak = '$dokID' ";
	$conn->Execute($sql);
  }else{
    $norusak = settransno("KRS");
	$sql  = "insert into tr_rusakhd (cNoRusak, dTglRusak, cKdProyek, cKdDept, cKdBarang, cKdSatuan, cIdAsset, cKdAsset, cKetRusak, cFlagKirim, "; 
	$sql .= "cKetKirim,cStatus,cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$norusak','$tglrusak','$_POST[cmbproyek]','$_POST[cmbdept]','$_POST[kd_barang]','$_POST[kd_satuan]','$_POST[id_asset]','$_POST[kd_asset]',";
	$sql .= "'$_POST[mmket]','$_POST[chkflag]','$_POST[mmketlain]','O','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql); 
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  if($_POST["fid"]=="KIRIM"){
    $sql  = "update tr_rusakhd set cStatus = 'S', cUserPengirim='$_SESSION[Logged]',dTglKirim=CURRENT_TIMESTAMP ";
    $sql .= "where cIdRusak = '$_POST[fkey]' ";
    $conn->Execute($sql);
  }elseif($_POST["fid"]=="HAPUS"){
    $sql = "delete from tr_rusakhd where cIdRusak = '$_POST[fkey]' ";
    $conn->Execute($sql);
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate("trans.kerusakan");
$sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept, brg.vNmBarang FROM tr_rusakhd hd ";
$sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek "; 
$sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
$sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE hd.cIdRusak = '$_GET[key]' ";
}
$sql .= "ORDER BY hd.dTglRusak DESC ";
$admGrdTpl->moduleid  = "trans.kerusakan";
$admGrdTpl->delform   = "m=trans.kerusakan&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
  $admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept, vNmDept FROM tm_dept ORDER BY cKdDept");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Form Kerusakan Asset";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>