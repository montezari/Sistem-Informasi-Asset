<?php

$rptTpl = new TTemplate("report.invperproyek");
$rptTpl->moduleid  = "report.invperproyek";
$rptTpl->template->MergeBlock("blk_proy","adodb","SELECT cIdProyek,vNamaProyek FROM tm_proyek ORDER BY cIdProyek");
$rptTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept, vNmDept FROM tm_dept ORDER BY cKdDept");
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Laporan - Inventaris Per Proyek";
$gTpl->display  = $rptTpl->Show(false);
$content = $gTpl->Show(false);

?>