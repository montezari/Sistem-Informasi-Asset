<?php

function setcss_js($mode="common"){
  $path  = "default";

if(!isset($_SESSION["Logged"])){
  $str   = "<link type=\"text/css\" href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\n";
  //$str  .= "<link type=\"text/css\" href=\"css/style.css\" rel=\"stylesheet\">\n";
  //$str  .= "<link type=\"text/css\" href=\"css/style-responsive.css\" rel=\"stylesheet\">\n";
  //$str  .= "<link type=\"text/css\" href=\"js/slideshow/css/supersized.css\" rel=\"stylesheet\">\n";
  //$str  .= "<link type=\"text/css\" href=\"js/slideshow/theme/supersized.shutter.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"css/AdminLTE.css\" rel=\"stylesheet\">\n";
}else{
  $str   = "<link type=\"text/css\" href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"css/ionicons.min.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"js/plugins/validation/css/bootstrapValidator.css\" rel=\"stylesheet\">\n";
  $str  .= "<link type=\"text/css\" href=\"css/AdminLTE.css\" rel=\"stylesheet\">\n";
  //$str  .= "<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js\"></script>\n";
  $str  .= "<script src=\"includes/js/main.js\"></script>\n";
  $str  .= "<script src=\"js/lib/jquery.min.js\"></script>\n";
  $str  .= "<script src=\"js/lib/jquery.numeric.js\"></script>\n";
  $str  .= "<script src=\"js/bootstrap.min.js\" type=\"text/javascript\"></script>\n";
  $str  .= "<script src=\"js/plugins/validation/js/bootstrapValidator.js\" type=\"text/javascript\"></script>\n";
  $str  .= "<script src=\"js/AdminLTE/app.js\" type=\"text/javascript\"></script>\n";
  $str  .= "<script src=\"js/AdminLTE/demo.js\" type=\"text/javascript\"></script>\n";
}
  return $str;
}


function setcss_js_print(){

  if(isset($_SESSION["Logged"])){
    $str   = "<link type=\"text/css\" href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"../css/font-awesome.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"../css/ionicons.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"../js/plugins/validation/css/bootstrapValidator.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"../css/AdminLTE.css\" rel=\"stylesheet\">\n";
    $str  .= "<script src=\"../js/lib/jquery.min.js\"></script>\n";
    $str  .= "<script src=\"../js/lib/jquery.numeric.js\"></script>\n";
    $str  .= "<script src=\"../js/bootstrap.min.js\" type=\"text/javascript\"></script>\n";
    $str  .= "<script src=\"../js/plugins/validation/js/bootstrapValidator.js\" type=\"text/javascript\"></script>\n";
    $str  .= "<script src=\"../js/AdminLTE/app.js\" type=\"text/javascript\"></script>\n";
    $str  .= "<script src=\"../js/AdminLTE/demo.js\" type=\"text/javascript\"></script>\n";
  }
  return $str;
}


function isCommonContent($val){
  global $conn;

  $sql  = "select count(*) as jml ";
  $sql .= " from tsm_menu mnu "; 
  $sql .= " where mnu.fparent is not null ";
  //$sql .= " where mnu.fparent is not null and mnu.fviewtype = 0 and mnu.fjenis = 0 and mnu.fhandler = '$val' ";
  $sql .= " order by mnu.fmenu ";
  $rs  = $conn->Execute($sql);
  $jml = $rs->fields["jml"];
  $rs->Close();

  return $jml > 0;
}


function imageProportions($image){
  $imageLoad = @getimagesize($image);
  if($imageLoad[1] > 100){
    $proportion =  $imageLoad[1] / $imageLoad[0];
    $imageLoad[1] = 100;
    $imageLoad[0] = $imageLoad[1] / $proportion;
    return array(ceil($imageLoad[0]),$imageLoad[1]);
  }else {
    return array($imageLoad[0], $imageLoad[1]);
  }
}

function parseHTMLTags($val){

  $html = str_get_html($val);
  foreach($html->find('img') as $e){
    $imageStats = imageProportions($e->src);
	$e->width = $imageStats[0];
    $e->height = $imageStats[1];
  }

  return $html->save();
}

function setComboTanggal($pVal){
  $str = "<option></option>";
  for($i=1;$i<=31;$i++){ 
    $s = $i == $pVal ? "selected" : "";
    $str .= "<option value='$i' $s>$i</option>";
  }
  return $str;
}

function setComboBulan($pVal){
global $arr_bulan;

  $str = "<option></option>";
  foreach($arr_bulan as $i=>$b){  
    if(isset($pVal)){
	  $s = ($i+1) == $pVal ? "selected" : "";
    }else{
	  //$s = ($i+1) == date("n") ? "selected" : "";
    }
    $str .= "<option value='".($i+1)."' $s>$b</option>";
  }

  return $str;
}

function setComboTahun($pVal,$pAwal=60,$pAkhir=0){
  $str = "<option></option>";
  for($i=date("Y")-$pAwal;$i<=date("Y")-$pAkhir;$i++){  
    $s = $i == $pVal ? "selected" : "";
    $str .= "<option value='$i' $s>$i</option>";
  }

  return $str;
}

function encrypt_decrypt($action, $string) {
   $output = false;

   $key = 'My strong random secret key';
   $iv = md5(md5($key));
   if( $action == 'encrypt' ) {
       $output = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $string, MCRYPT_MODE_CBC, $iv);
       $output = base64_encode($output);
   }
   else if( $action == 'decrypt' ){
       $output = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($string), MCRYPT_MODE_CBC, $iv);
       $output = rtrim($output, "");
   }
   return $output;
}

function setromawi($n){
  $hasil = "";
  $iromawi = array("","I","II","III","IV","V","VI","VII","VIII","IX","X",20=>"XX",30=>"XXX",40=>"XL",50=>"L",
				   60=>"LX",70=>"LXX",80=>"LXXX",90=>"XC",100=>"C",200=>"CC",300=>"CCC",400=>"CD",500=>"D",600=>"DC",700=>"DCC",
				   800=>"DCCC",900=>"CM",1000=>"M",2000=>"MM",3000=>"MMM");
  if(array_key_exists($n,$iromawi)){
    $hasil = $iromawi[$n];
  }elseif(($n >= 11) && ($n <= 99)){
    $i = $n % 10;
    $hasil = $iromawi[$n-$i] . setromawi($n % 10);
  }elseif(($n >= 101) && ($n <= 999)){
	$i = $n % 100;
	$hasil = $iromawi[$n-$i] . setromawi($n % 100);
  }else{
	$i = $n % 1000;
	$hasil = $iromawi[$n-$i] . setromawi($n % 1000);
  }
  return $hasil;

}

function settransno($transid){
global $conn;

	$thn = date('Y');
    $bln = date('m');
	$sql  = "SELECT cAlias FROM tm_proyek WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' ";
	$rs = $conn->Execute($sql);
	$KodeDok = $rs->fields["cAlias"];
	$sql  = "SELECT * FROM tsm_transno WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' AND cIdTrans = '".strtoupper($transid)."' AND cKodeDok = '".$KodeDok."' ";
	$sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	$rs = $conn->Execute($sql);
	if($rs->RecordCount()==0){
	  $sql  = "INSERT INTO tsm_transno VALUES ('".$_SESSION["cIdProyek"]."','".strtoupper($transid)."',1,'".$KodeDok."','".$bln."','".$thn."') ";   
	  $conn->Execute($sql);
	  $idx=1;
	}else{
	  $idx  = $rs->fields["cCount"]+1;
	  $sql  = "UPDATE tsm_transno set cCount = $idx WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' ";
	  $sql .= "AND cIdTrans = '".strtoupper($transid)."' AND cKodeDok = '".$KodeDok."' ";
	  $sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	  $conn->Execute($sql);
	}

	$nums = "00000$idx";
	//$no_dok = substr($nums,-5)."/".trim(strtoupper($transid))."-".trim($KodeDok)."/".$bln."/".substr($thn,-2);
	$no_dok = substr($nums,-5)."/".trim(strtoupper($transid))."-".trim($KodeDok)."/".setromawi(intval($bln))."/".substr($thn,-2);
	return $no_dok;

}

function setassetno($kodebrg){
global $conn;

	$thn = date('Y');
    $bln = date('m');
	$sql  = "SELECT cKdAsset FROM tm_grpbarang WHERE cKdGroupBarang IN (SELECT cKdGroupBarang FROM tm_barang WHERE cKdBarang = '$kodebrg') ";
	$rs = $conn->Execute($sql);
	$KodeDok = 'TATA-'.$rs->fields["cKdAsset"];
	$sql  = "SELECT * FROM tsm_assetno WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' AND cKdBarang = '".strtoupper($kodebrg)."' AND cKodeDok = '".$KodeDok."' ";
	$sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	$rs = $conn->Execute($sql);
	if($rs->RecordCount()==0){
	  $sql  = "INSERT INTO tsm_assetno VALUES ('".$_SESSION["cIdProyek"]."','".strtoupper($kodebrg)."',1,'".$KodeDok."','".$bln."','".$thn."') ";   
	  $conn->Execute($sql);
	  $idx=1;
	}else{
	  $idx  = $rs->fields["cCount"]+1;
	  $sql  = "UPDATE tsm_assetno set cCount = $idx WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' ";
	  $sql .= "AND cKdBarang = '".strtoupper($kodebrg)."' AND cKodeDok = '".$KodeDok."' ";
	  $sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	  $conn->Execute($sql);
	}
	$nums = "00000$idx";
	$no_dok = substr($nums,-5)."/".trim(strtoupper($kodebrg))."/".trim($KodeDok)."/".setromawi(intval($bln))."/".substr($thn,-2);

	return $no_dok;

}


function doSendEmailKonfirmasi($emailpenerima,$namaemailpenerima,$id){
global $config,$conn;


  $mail = new PHPMailer();
  $mail->IsSMTP();  
  $mail->SMTPAuth = true;     
  $mail->SMTPSecure = "tls";
  //$mail->Host = "mail.dutaciptasolusindo.com"; 
  //$mail->Port = 587;
  $mail->Host = "server42536x.masterweb.net"; 
  $mail->Port = 465;
  $mail->Username = "support@dutaciptasolusindo.com"; 
  $mail->Password = "dcs123"; 
  // pengirim
  $mail->From = "support@dutaciptasolusindo.com";
  $mail->FromName = "Team Support DCS";
  // penerima
  $mail->AddAddress($emailpenerima,$namaemailpenerima);
  $mail->AddReplyTo("montezari@gmail.com","Konfirmasi SPB");
  $mail->IsHTML(true); 
  //Subject dan isi Pesan
  $mail->Subject  = "Informasi SPB dengan No. SPB = $id ";
  
  $sql ="SELECT cIdSPB,cNoSPB,dTglSPB,cNoSPA FROM tr_spbhd WHERE cNoSPB='$id' "; 
  $rs=$conn->Execute($sql); 
 
  
  $tanggalspb=$rs->fields["dTglSPB"];
  $spa=$rs->fields["cNoSPA"];
  
  $isi  = "Kepada Yth,<br>";
  $isi .= "GA Departemen<br><br>";
  $isi .= "Terdapat Pengiriman Barang dengan SPB Baru : <br>";
  $isi .= "No SPB : $id<br>";
  $isi .= "Tgl SPB : $tanggalspb<br>";
  $isi .= "No SPA : $spa<br>";
  $isi .= "Bahwa Inventaris dengan No. SPA tersebut sudah siap untuk di ambil.<br>";
  $isi .= "<br><br>";
  $isi .= "Salam,<br><br>";
  $isi .= "Administrator DCS<br>";
  $mail->Body =  $isi;

  return $mail->Send();

}


?>