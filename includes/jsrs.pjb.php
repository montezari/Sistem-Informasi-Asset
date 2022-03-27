<?php 

include "global.inc.php";
require("jsrs/jsrsServer.php.inc");

  jsrsDispatch("getDataPjb");
  function getDataPjb($id1){
    global $conn, $config;
  
    if($id1!=""){
      $rs = $conn->Execute("SELECT cKdPegawai,vNamaPegawai FROM tm_pegawai WHERE cPejabat='1' AND cIdProyek='".$id1."' ");
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