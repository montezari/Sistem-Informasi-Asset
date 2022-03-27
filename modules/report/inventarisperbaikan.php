<?php

$rptTpl = new TTemplate("report.inventarisperbaikan");
$rptTpl->moduleid  = "report.inventarisperbaikan";
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Perbaikan Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>