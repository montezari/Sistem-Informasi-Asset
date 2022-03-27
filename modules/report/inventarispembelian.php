<?php

$rptTpl = new TTemplate("report.inventarispembelian");
$rptTpl->moduleid  = "report.inventarispembelian";
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Pembelian Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>