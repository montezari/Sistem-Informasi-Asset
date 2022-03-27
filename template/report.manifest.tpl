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
                                <div class="form-group">Proyek
                                  <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:450px;">
                                    <option value=''>ALL</option>
                                      <option value='[blk_proy.cIdProyek;noerr;block=option]' [onshow; if="if" [grid_blk.cIdProyek;noerr]==[blk_proy.cIdProyek;noerr];then 'selected';else '']>[blk_proy.vNamaProyek;noerr;block=option]</option>
                                  </select>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                  <label class="control-label">Departemen</label>
                                  <select class="form-control" id="cmbdept" name="cmbdept" style="width:300px;">
                                    <option value=''>ALL</option>
                                    <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if="if" [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                                  </select>
                                </div>
                            </div>
                        </div>    
                    </div>

                    <div class="portlet-body flip-scroll hidden-print">
                    [onload_1; when [var.mode;noerr]==1; block=div]
                        <div class="row">
                          <div class="col-xs-10">
                          <br>
                          Proyek : <strong>[var._POST.cmbproyek;noerr;]</strong><br>
                          Departemen : <strong>[var._POST.cmbdept;noerr;]</strong>
                          </div>  	
                        </div>
                        <table class="table table-bordered table-hover" id="example2">
                          <thead>
                            <tr>
                              <th>#</th>
                              <th>No. Inventaris</th>
                              <th>Nama Barang</th>
                              <th>Proyek</th>
                              <th>Jumlah Asset</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>[grid_blk.#; block=tr;noerr]</td>
                              <td>[grid_blk.ckdasset;noerr;block=tr]</td>
                              <td>[grid_blk.vnmbarang;noerr;block=tr]</td>
                              <td>[grid_blk.vnamaproyek;noerr;block=tr]</td>
                              <td>[grid_blk.jumlah;noerr;block=tr]</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                   
 
                   <div style="display:none;" id="panel" class="progress progress-striped active">
                   	  <div class="progress-bar progress-bar-success" id="progressBar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="ViewData" class="btn blue">View Data</button>
                        <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn green">Export Excel</button>
                        <button type="button" id="FormCetak" name="FormCetak" onclick="docetak();" value="Cetak" class="btn default hidden-print">Print</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>