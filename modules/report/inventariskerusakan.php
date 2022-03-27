<?php

$rptTpl = new TTemplate("report.inventariskerusakan");
$rptTpl->moduleid  = "report.inventariskerusakan";
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Kerusakan Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>