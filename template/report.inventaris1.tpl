<div class="row">
    <div class="col-md-12">
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                <input name="rec" id="rec" type="hidden" value="[var.bykdata;noerr;]" size=/>
                    <div class="form-body">
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KODE_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="kdterbang" id="kdterbang" class="form-control" value="[var._POST.kdterbang;noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TANGGAL_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="tglawal" id="tglawal" class="form-control date-picker" value="[var.tglawal;frm='dd/mm/yyyy';noerr;]">
                                </div>
                            </div>
                        </div>    
                    </div>

                    <div class="portlet-body flip-scroll hidden-print">
                    [onload_1; when [var.mode;noerr]==1; block=div]
                        <div class="row">
                          <div class="col-xs-10">
                          <br>
                          [var.LABEL.RPT_KODE_PENERBANGAN;noerr;] : <strong>[var._POST.kdterbang;noerr;]</strong><br>
                          [var.LABEL.RPT_TANGGAL_PENERBANGAN;noerr;] : <strong>[var.tglawal;frm='dd/mm/yyyy';noerr;]</strong>
                          </div>  	
                        </div>
                        <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content">
                        <tr>
                            <th>[var.LABEL.RPT_AGENT;noerr;]</th>
                            <th width="14%">[var.LABEL.RPT_NO_SMU;noerr;]</th>
                            <th>[var.LABEL.RPT_TANGGAL;noerr;]</th>
                            <th>[var.LABEL.RPT_FROM;noerr;]</th>
                            <th>[var.LABEL.RPT_DESTINATION;noerr;]</th>
                            <th>[var.LABEL.RPT_KOMODITI;noerr;]</th>
                            <th>[var.LABEL.RPT_JML_CARGO;noerr;]</th>
                            <th>[var.LABEL.RPT_TOTAL_KG;noerr;]</th>
                            <th>[var.LABEL.RPT_TOTAL_KOLI;noerr;]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.cnomuatan;noerr;block=tr]</td>
                            <td>[grid_blk.dtglmuatan;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotaasal;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotatuj;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkomoditi;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlcargo;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlberat;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlkoli;frm='0,000.00';noerr;block=tr]</td>
                        </tr>
                        </tbody>
                        </table>
                    </div>
                   
                   <div class="portlet-body flip-scroll barcode-print" style="display:none;">
                        <div class="row">
                          <div class="col-xs-10">
                          <br>
                          Penerbangan : <strong>[var._POST.kdterbang;noerr;]</strong> (<strong>[var.tglawal;frm='dd/mm/yyyy';noerr;]</strong>)
                          </div>  	
                        </div>
                        <table class="table table-bordered flip-content">
                        <tbody>
                        <tr>
                            <td align="center">[grid_barcode.cbarcode1;noerr;block=tr] [grid_barcode.cnomuatan;noerr;block=tr]</td>
                            <td align="center">[grid_barcode.cbarcode2;noerr;block=tr] [grid_barcode.cjmlcargo;noerr;block=tr]</td>
                            <td align="center">[grid_barcode.cbarcode3;noerr;block=tr]</td>
                            <td align="center">[grid_barcode.cbarcode4;noerr;block=tr]</td>
                            <td align="center">[grid_barcode.cbarcode5;noerr;block=tr]</td>
                        </tr>
                        </tbody>
                        </table>
                   </div> 

                   <div style="display:none;" id="panel" class="progress progress-striped active">
                   	  <div class="progress-bar progress-bar-success" id="progressBar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="ViewData" class="btn blue">Tampilkan Data</button>
                        <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn green">Export Excel</button>
                        <button type="button" id="FormCetak" name="FormCetak" onclick="docetak();" value="Cetak" class="btn default hidden-print">Print</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>