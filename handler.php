<?php
  require_once "includes/global.inc.php";
  
  $mainTpl = new TMainPage();
  $mm = new TMainMenu();
  $mainTpl->mainmenu = $mm->Build($_SESSION["Logged"]);
  $content = "Modul tidak ditemukan...!!!";
  $css_js  = setcss_js();
  if(isset($_REQUEST["m"]) && $_REQUEST["m"] != ""){
	list($m,$f) = explode(".",$_REQUEST["m"]);
    $modpath = "modules/$m/$f.php";
	if($m!="admin"){
	  if(isset($_SESSION["Logged"])){
	    if($_GET["mode"] != "form"){
		  /*
		  $button["A"] = $sm->Modules[$modId[0]][$modId[1]]->Write  == "1" ? "valid" : "";
		  $button["E"] = $sm->Modules[$modId[0]][$modId[1]]->Change == "1" ? "valid" : "";
		  $button["D"] = $sm->Modules[$modId[0]][$modId[1]]->Delete == "1" ? "valid" : "";
	      */
		  $button["A"] = "valid";
		  $button["E"] = "valid";
		  $button["D"] = "valid";
		}	
	  }else{  
		echo "<script>alert('Anda tidak mendapatkan akses modul ini, mohon login terlebih dahulu');</script>";
        echo "<script>window.location = 'index.php'</script>";
	  }
	}
    $modpath = "modules/$m/$f.php"; 
    if(file_exists($modpath)){
	  include($modpath);
    }
  }else{
  
  
	if(isset($_SESSION["Logged"])){
	  if($_GET["view"]=="peta"){
  	    $grpbrg = $_POST["cmbgrpbarang"];
		$fpageTpl = new TTemplate("index.maps");
        $fpageTpl->template->MergeBlock("blk_grp","adodb","SELECT cKdGroupBarang,vNmGroupBarang FROM tm_grpbarang WHERE cAktif='1' ORDER BY cKdGroupBarang");
	    $content = $fpageTpl->Show(false);
	  }else{
	    $fpageTpl = new TTemplate("index.content");
	    // SPA
	    $sql  = "SELECT spahd.cIdSPA, spahd.cNoSPA, spahd.dTglSPA, spahd.dTglTerimaSPA,(CURDATE()-DATE(spahd.dTglTerimaSPA)) AS lamaspa, "; 
	    $sql .= "CASE WHEN (CURDATE()-DATE(spahd.dTglTerimaSPA))>=5 THEN 'alert' else '' end as calert, spahd.cKdDept, ";
		$sql .= "spahd.cKdProyek, spahd.cStatus, spahd.dTglApproval, pry.vNamaProyek, dept.vNmDept ";  
	    $sql .= "FROM tr_spahd spahd ";
	    $sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = spahd.cKdProyek ";
	    $sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = spahd.cKdDept ";
	    $sql .= "WHERE spahd.cIdSPA IN ( ";
	    $sql .= "SELECT DISTINCT hd.cIdSPA ";
	    $sql .= "FROM (SELECT cIdSPA, cKdBarang, SUM(nQtyReq) AS nQtyReq FROM tr_spadt GROUP BY cIdSPA, cKdBarang) hd ";
	    $sql .= "LEFT JOIN ( ";
	    $sql .= "  SELECT cIdSPA, cKdBarang, SUM(nQty) AS nQty FROM tr_spbdt GROUP BY cIdSPA, cKdBarang ";
	    $sql .= ") dt ON hd.cIdSPA = dt.cIdSPA AND hd.cKdBarang = dt.cKdBarang "; 
	    $sql .= "WHERE (hd.nQtyReq-COALESCE(dt.nQty,0))>0 ";
	    $sql .= ") ";
	    $fpageTpl->template->MergeBlock("data_spa","adodb",$sql);
	  
	    // Kerusakan
	    $sql  = "SELECT hd.*, pry.vNamaProyek, dept.vNmDept, brg.vNmBarang FROM tr_rusakhd hd ";
	    $sql .= "LEFT JOIN (SELECT cIdProyek, vNamaProyek FROM tm_proyek) pry ON pry.cIdProyek = hd.cKdProyek "; 
	    $sql .= "LEFT JOIN (SELECT cKdDept, vNmDept FROM tm_dept) dept ON dept.cKdDept = hd.cKdDept "; 
	    $sql .= "LEFT JOIN (SELECT cKdBarang, vNmBarang FROM tm_barang) brg ON brg.cKdBarang = hd.cKdBarang ";
	    $fpageTpl->template->MergeBlock("data_rusak","adodb",$sql);
	    $content = $fpageTpl->Show(false);
	  }
	}
	
  }
  
if(!isset($_SESSION["Logged"])){
  $fpageTpl = new TTemplate("sm.frmlogin");
  $content = $fpageTpl->Show(false);
}

$mainTpl->content = $content;

?>