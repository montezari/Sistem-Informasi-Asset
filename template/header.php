<!DOCTYPE html>
<html<? print(isset($_SESSION["Logged"]) ? "" : " class=\"bg-black\""); ?>>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<title><? print($config["page_header"]); ?></title>
<? print($css_js); ?>

</head>
<body topmargin="0" onload="init();" leftmargin="0" class="<? print(isset($_SESSION["Logged"]) ? "skin-blue" : "bg-black"); ?>">