<?php

//require_once "message.inc.php";
require_once "config.inc.php";
require_once "connect.inc.php";
require_once "function.inc.php";
//require_once "html.dom.inc.php";
require_once "tbs/tbsdb_jladodb.php";
require_once "tbs/tbs_class.php";
require_once "tbs/tbs_plugin_html.php";
require_once "core/db.core.php";
require_once "core/tpl.core.php";
require_once "core/menu.core.php";
require_once "core/ajax.core.php";
require_once 'PHPMailer/PHPMailerAutoload.php';
if(isset($_REQUEST["export"])){
  require_once 'phpexcel/PHPExcel.php';
  require_once 'phpexcel/PHPExcel/IOFactory.php';
  require_once 'phpexcel/PHPExcel/Cell/AdvancedValueBinder.php';
  require_once "core/excel.core.php";
}

?>