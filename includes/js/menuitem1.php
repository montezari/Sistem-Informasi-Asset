<?php

require_once "../../includes/config.inc.php";
require_once "../../includes/connect.inc.php";
require_once "../../includes/core/menu.core.php";

$wbmenu = new TJSMenuManager();
$wbmenu->Menu->Build();

?>