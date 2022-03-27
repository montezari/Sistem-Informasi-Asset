<?php
//error_reporting(E_ALL);

class TExcelRptJualSMU extends TExcel {

  function doExportXls(){
  global $conn, $config, $LABEL;  

	$sql  = "SELECT mu.cidmuatan, mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, ";
	$sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
	$sql .= "mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli, ";
	$sql .= "IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn, ";
	$sql .= "((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, "; 
	$sql .= "mu.vbiayaadmsmu, mu.vgrandtotal, 0 as fcheck ";
	$sql .= "FROM tr_muatanudara mu ";
	$sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
	$sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
	$sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
	$sql .= "WHERE mu.ckdcurrency = '$_REQUEST[kdcurr]' ";
	$sql .= "AND YEAR(mu.dtglmuatan) = '$_REQUEST[cmbtahun]' AND MONTH(mu.dtglmuatan) = '$_REQUEST[cmbbln]' "; 
	$sql .= "AND mu.ckdkotaasal = '$_REQUEST[kdkota]' ";
	$sql .= isset($_REQUEST["kdkotatuj"]) && ($_REQUEST["kdkotatuj"]!="") ? " AND mu.ckdkotatujuan = '$_REQUEST[kdkotatuj]' " : "";
	$sql .= isset($_REQUEST["kdterbang"]) && ($_REQUEST["kdterbang"]!="") ? " AND mu.cnopenerbangan = '$_REQUEST[kdterbang]' " : "";
	$rs = $conn->Execute($sql);

	//print_r($rs);

	if($rs->RecordCount()>0){
	  $xlstpl = new TExcelTemplate("xls_template/jualsmu.xls");
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
	  $awalrow = 6+1;
	  $bykrow = (intval($row)-1)+$awalrow;
	  $sumrow = $row+$awalrow;
	  $objWorksheet->setCellValue("N".$sumrow,'=SUM(N'.$awalrow.':N'.$bykrow.')');
	  
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
	  header('Content-Disposition: attachment;filename="rincian_penjualan_smu_'.$dtfile.'.xls"');
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