<?php

$rptTpl = new TTemplate("report.inventarissupplier");
$rptTpl->moduleid  = "report.inventarissupplier";
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Supplier Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>