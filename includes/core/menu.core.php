<?php

class TMainMenu { 
  
  function TMainMenu(){
  }
  
  function Build($username){
	global $conn;
    
	$sql  = "SELECT COUNT(*) as jml FROM tsm_user WHERE cUserName = '".$username."' AND cSuper = '1' ";
	$rs = $conn->Execute($sql);
	$issuper = $rs->fields["jml"]>0;

	if ($issuper) {
	  $sql = "SELECT fmenu, fparent, ficon, fcaption, fhandler FROM tsm_menu WHERE fnoedit = '0' ";
	}else{ 
	  $sql  = "SELECT mm.* FROM tsm_priv priv ";
	  $sql .= "LEFT JOIN (SELECT fmenu, fparent, ficon, fcaption, fhandler FROM tsm_menu) mm ON mm.fmenu = priv.cKdModuleId ";
	  $sql .= "WHERE priv.cView = '1' ";
	  $sql .= "AND priv.cKdGroupUser IN (SELECT cKdGroupUser FROM tsm_user WHERE cUserName = '".$username."') ";
	}
	$rs = $conn->Execute($sql);
    while(!$rs->EOF){
      $str .= "<li class=\"treeview\"> ";
      $str .= "    <a href=\"#\"> ";
      $str .= "        <i class=\"".$rs->fields["ficon"]."\"></i> ";
      $str .= "        <span>".$rs->fields["fcaption"]."</span> ";
      $str .= "        <i class=\"fa fa-angle-left pull-right\"></i> ";
      $str .= "    </a> ";
      $rs->MoveNext();
      if($rs->fields["fparent"]!==null){
        $str .= "    <ul class=\"treeview-menu\"> ";
        while((!$rs->EOF) && ($rs->fields["fparent"]!==null)){
          $str .= "      <li><a href=\"".$rs->fields["fhandler"]."\"><i class=\"".$rs->fields["ficon"]."\"></i>".$rs->fields["fcaption"]."</a></li> ";
          $rs->MoveNext();
        }
        $str .= "    </ul> ";
      }
      $str .= "</li> ";
    }

	$rs->Close();

	return $str;
  } 

  function isakses($username,$modul){
	global $conn;
    
	$sql  = "SELECT COUNT(*) as jml FROM tsm_user WHERE cUserName = '".$username."' AND cSuper = '1' ";
	$rs = $conn->Execute($sql);
	$issuper = $rs->fields["jml"]>0;

	if(!$issuper){
	  $sql  = "SELECT COUNT(*) AS jml ";
	  $sql .= "FROM tsm_menu mnu "; 
	  $sql .= "LEFT JOIN tsm_priv priv ON priv.cKdModuleId = mnu.fmenu "; 
	  $sql .= "LEFT JOIN tsm_user usr ON usr.cKdGroupUser = priv.cKdGroupUser ";
	  $sql .= "WHERE COALESCE(priv.cView,0) = '1' AND mnu.fparent IS NOT NULL "; 
  	  $sql .= "AND usr.cUserName = '".$username."' AND mnu.fhandler = '".$modul."' ";
	  $rs = $conn->Execute($sql);
	  return $rs->fields["jml"]>0;
    }else{
	  return true;
	}
	
  }
}

?>