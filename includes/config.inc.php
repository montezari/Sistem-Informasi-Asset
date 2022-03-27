<?php
session_name(md5("WWW_INV_APP_SESID"));
session_cache_limiter('private');
session_start();
header("Cache-control: private"); 

//error_reporting(0);

$config["page_header"] = "Sistem Informasi Asset";
$config["http_url"]    = "http://localhost:8080/inventaris/";
$config["http"]    = "http://localhost:8080";
$config["db_host"] = "localhost";
$config["db_user"] = "root";
$config["db_pass"] = "root";
$config["db_name"] = "inventaris_db";
$config["db_fetchpage"] = 10;
$config["dir_class"] = "classes/";
$config["dir_tpl"] = "template/";

$arr_bulan = array("Januari","Februari","Maret","April","Mei","Juni",
				   "Juli","Agustus","September","Oktober","November","Desember");





?>