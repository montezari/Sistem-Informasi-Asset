<?php
//error_reporting(E_ALL);

class TExcelRptSalesSummary extends TExcel {

  function doExportXls(){
  global $conn, $config, $LABEL;  

	if(isset($_REQUEST["tglawal"]) && $_REQUEST["tglawal"] != ""){
	  $tgl = explode("/",$_REQUEST["tglawal"]);
	  $tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
	}else{
	  $tglawal = date('Y-m-01');
	}
	if(isset($_REQUEST["tglakhir"]) && $_REQUEST["tglakhir"] != ""){
	  $tgl = explode("/",$_REQUEST["tglakhir"]);
	  $tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
	}else{
	  $tglakhir = date('Y-m-t');
	}
	$sql  = "SELECT mu.ckdagent, agen.vnmagent,  ";
	$sql .= "SUM(mu.cjmlberat) as cjmlberat, SUM(mu.cjmlkoli) as cjmlkoli, ";
	$sql .= "SUM(mu.vppn) as vppn, ";
	$sql .= "SUM(((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain) AS vasagreed, "; 
	$sql .= "SUM(mu.vbiayaadmsmu) as vbiayaadmsmu, SUM(mu.vgrandtotal) as vgrandtotal ";
	$sql .= "FROM tr_muatanudara mu ";
	$sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
	$sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
	$sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
	$sql .= "WHERE mu.ckdcurrency = '$_REQUEST[kdcurr]' ";
	$sql .= "AND STR_TO_DATE(mu.dtglmuatan,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";  
	$sql .= "GROUP BY mu.ckdagent, agen.vnmagent ";
	$rs = $conn->Execute($sql);

	//print_r($rs);

	if($rs->RecordCount()>0){
	  $xlstpl = new TExcelTemplate("xls_template/salessum.xls");
	  $objWorksheet = $xlstpl->objPHPExcel->getActiveSheet();
	  $dt = $rs->fields;
	  $fld=0;
	  foreach($dt as $k=>$v){
		$cell = $xlstpl->getCellByValue("#ONCE#".$k);
		if($cell<>""){ 
		  $field = $rs->FetchField($fld);
		  $mapp_once[$cell][$field->type] = $k;
		}
		$cell = $xlstpl->getCellByValue("#RW#".$k);
		if($cell<>""){ 
		  $field = $rs->FetchField($fld);
		  $mapp_row[$cell][$field->type] = $k;
		}
		$fld++;
	  }

	  $tmp = array_keys($mapp_row);
	  $start_row = preg_replace("/[^0-9]/", '', $tmp[0]);
	  $tplrow = $start_row;
	  $start_row = $start_row+1; // karena fungsi insert add row before maka di loncat 1 row (disisipin).
	  // remapp untuk fungsi getColumnId ga masuk di loop setCellValue -> ex/. [A]([datetime][dtglproses])
	  foreach($mapp_row as $k=>$v){
		foreach($v as $sk=>$sv){
		  $mapp_col[$this->getColumnId($k)][$sk] = $sv;
		}
	  }
	  // insert data to excel
	  $bykdata = $rs->RecordCount(); 
	  $objWorksheet->insertNewRowBefore($start_row,$bykdata);
	  $row=0;
	  while(!$rs->EOF){
		foreach($mapp_col as $k=>$v){
		  foreach($v as $sk=>$sv){
			$idx = $start_row+$row;
			$cell_pos = $k.$idx;
			if($sk=="datetime"){
			  try{
				//1899-12-30 00:00:00 -> tidak valid
				$year=substr(trim($rs->fields[$sv]),0,4);
				if(($year!="") && ($year!="1899")){
					PHPExcel_Cell::setValueBinder( new PHPExcel_Cell_AdvancedValueBinder() );
					$objWorksheet->setCellValue($cell_pos,$rs->fields[$sv]);
					$objWorksheet->getStyle($cell_pos)
								 ->getNumberFormat()
								 ->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_XLSX15);
			    }
			  }catch (Exception $e){
                echo $e->getMessage();
			  }
			}else{
			  $objWorksheet->setCellValue($cell_pos,$rs->fields[$sv]);
			}
		  }
		}
		$row++;
		$rs->MoveNext();
	  } 
	  /*
	  $sql  = "SELECT SUM(mu.vgrandtotal) vtotal ";
	  $sql .= "FROM tr_muatanudara mu ";
	  $sql .= "WHERE mu.ckdcurrency = '$_REQUEST[kdcurr]' ";
	  $sql .= "AND YEAR(mu.dtglmuatan) = '$_REQUEST[cmbtahun]' AND MONTH(mu.dtglmuatan) = '$_REQUEST[cmbbln]' "; 
	  $sql .= "AND mu.ckdkotaasal = '$_REQUEST[kdkota]' ";
	  $sql .= isset($_REQUEST["kdkotatuj"]) && ($_REQUEST["kdkotatuj"]!="") ? " AND mu.ckdkotatujuan = '$_REQUEST[kdkotatuj]' " : "";
	  $sql .= isset($_REQUEST["kdterbang"]) && ($_REQUEST["kdterbang"]!="") ? " AND mu.cnopenerbangan = '$_REQUEST[kdterbang]' " : "";
	  $rs = $conn->Execute($sql);
	  $vsumtotal = $rs->fields["vtotal"];
	  $cell = $xlstpl->getCellByValue("#ONCE#SUMTOTAL");
	  $objWorksheet->setCellValue($cell,$vsumtotal);
	  */

	  $cell = $xlstpl->getCellByValue("#ONCE#PROYEK");
	  $objWorksheet->setCellValue($cell,$_SESSION["vKdProyek"]);
	  $cell = $xlstpl->getCellByValue("#ONCE#TGLCETAK");
	  $objWorksheet->setCellValue($cell,date("d-m-Y"));

	  $start_row = $tplrow+1;
	  $final_row = $tplrow+$row;

	  // copy formula dari cell template
	  $col = $objWorksheet->getHighestColumn(); 
	  $colmax = PHPExcel_Cell::columnIndexFromString($col);  
	  for($i=0;$i<$colmax;$i++){
		$column = PHPExcel_Cell::stringFromColumnIndex($i);
		$val = $objWorksheet->getCellByColumnAndRow($i,$tplrow)->getValue();
		$pos = strpos($val,"#RW#");
		if(($pos === false) && (trim($val) != "")){
		  $val = str_replace($tplrow,"#",$val);
		  for($idx=$start_row;$idx<=$final_row;$idx++){
			$cell_pos = $column.$idx;
			$val_new = str_replace("#",$idx,$val);
			$objWorksheet->setCellValue($cell_pos,$val_new);
		  }  
		}
	  }

	  // duplikasi style
	  foreach($mapp_col as $k=>$v){
		$baseStyle = $objWorksheet->getCell($k.$start_row)->getXfIndex();
		for($idx=$start_row;$idx<=$final_row;$idx++){
		  $objWorksheet->getCell($k.$idx)->setXfIndex($baseStyle);	
		} 
	  }

	  // hapus format mapp di excel
	  $objWorksheet->removeRow($tplrow,1);
	  
	  foreach($mapp_col as $k=>$v){
		
		$objWorksheet->getColumnDimension($k)->setAutoSize(true);
	  }
	  
	  $dtfile = date("YmdHis");
	  $proyfile = str_replace(" ","_",$_SESSION["vKdProyek"]);
	  //header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	  header('Content-Type: application/vnd.ms-excel');
	  header('Content-Disposition: attachment;filename="rekapitulasi_penjualan_summary_'.$dtfile.'.xls"');
	  header('Cache-Control: max-age=0');

	  PHPExcel_Shared_Font::setAutoSizeMethod(PHPExcel_Shared_Font::AUTOSIZE_METHOD_EXACT); 
	  $objWriter = PHPExcel_IOFactory::createWriter($xlstpl->objPHPExcel, 'Excel5');
	  $objWriter->save('php://output');
    }else{
	  echo "<script>alert('".$LABEL[DATA_TDK_DIKETEMUKAN]."');</script>";
	  echo "<script>history.back(-1);</script>";
	}

  }

}

?>