<?php

$rptTpl = new TTemplate("report.invsebaran");
$rptTpl->moduleid  = "report.invsebaran";
$rptTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan Sebaran Inventaris";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>