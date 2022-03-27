<?php

$rptTpl = new TTemplate("report.inventarismutasi");
$rptTpl->moduleid  = "report.inventarismutasi";
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Mutasi Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>