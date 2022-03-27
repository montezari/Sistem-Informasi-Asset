<?php
function encrypt_decrypt($action, $string) {
   $output = false;

   $key = 'My strong random secret key';
   $iv = md5(md5($key));
   if( $action == 'en' ) {
       $output = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $string, MCRYPT_MODE_CBC, $iv);
       $output = base64_encode($output);
   }
   else if( $action == 'de' ){
       $output = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($string), MCRYPT_MODE_CBC, $iv);
       $output = rtrim($output, "");
   }
   return $output;
}

$txt = encrypt_decrypt($_GET["m"],$_GET["s"]);
echo $txt;



?>