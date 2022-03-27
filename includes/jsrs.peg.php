<?php 

include "global.inc.php";
require("jsrs/jsrsServer.php.inc");

  jsrsDispatch("getDataPeg");
  function getDataPeg($id1,$id2){
    global $conn, $config;
  
    if($id1!=""){
      $rs = $conn->Execute("SELECT cKdPegawai,vNamaPegawai FROM tm_pegawai WHERE cIdProyek='".$id1."' AND cKdDept='".$id2."' ");
	  $rv = "''=;";  
	  while(!$rs->EOF){
        $rv .= $rs->fields["cKdPegawai"]."=".$rs->fields["vNamaPegawai"].";";
        $rs->MoveNext();  
      }
      return $rv;
    }else{
      return "''=";  
    }
  }


?>