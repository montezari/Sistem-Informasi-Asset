<?php
require_once "includes/global.inc.php";

$valid = true;
if (($_REQUEST["m"] == "master.proyek") && isset($_POST['cIdProyek'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_proyek WHERE cIdProyek = '".$_POST['cIdProyek']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
elseif (($_REQUEST["m"] == "master.dept") && isset($_POST['cKdDept'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_dept WHERE cKdDept = '".$_POST['cKdDept']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
elseif (($_REQUEST["m"] == "master.grpbarang") && isset($_POST['edtKode'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_grpbarang WHERE cKdGroupBarang = '".$_POST['edtKode']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
elseif (($_REQUEST["m"] == "master.barang") && isset($_POST['edtKode'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_barang WHERE cKdBarang = '".$_POST['edtKode']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
elseif (($_REQUEST["m"] == "master.jnsrusak") && isset($_POST['edtKode'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_kerusakan WHERE cKdKerusakan = '".$_POST['edtKode']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}

echo json_encode(array(
    'valid' => $valid
));

?>