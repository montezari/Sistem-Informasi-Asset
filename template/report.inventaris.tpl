<link href="js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<style>
   .login-dialog .modal-dialog {
		width: 1024px;
	}
</style>
<script src="js/plugins/prettify/run_prettify.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>


<div class="row">
    <div class="col-xs-12">
		<div class="col-md">
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name="rec" id="rec" type="hidden" value="[var.bykdata;noerr;]" size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:450px;">
                                  <option value=''>ALL</option>
                                  <option value='[blk_proy.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cIdProyek;noerr]==[blk_proy.cIdProyek;noerr];then 'selected';else '']>[blk_proy.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Departemen</label>
                                <select class="form-control" id="cmbdept" name="cmbdept" style="width:300px;">
                                  <option value=''>ALL</option>
                                  <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                                </select>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>

                        <div class="row">
                          <div class="col-xs-12">
                            <div class="box">
                              <div class="box-body table-responsive">
                                <table id="example2" class="table table-bordered table-hover">
                                  <thead>
                                    <tr>
                                      <th font="font" size="5" colspan="5"><div align="center">LAPORAN INVENTARIS PER PROYEK</div></th>
                                    </tr>
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
                                <div class="box-footer"> <a class="btnPrint" href='print/report.invperproyek.php?proy=[var.cIdProyek;noerr;]&amp;dept=[var.deptid;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a> </div>
                              </div>
                              <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                          </div>
                        </div>
                        <div class="box-footer">
                          <button type="button" id="FormPrint" name="FormPrint" onclick="doprint();" value="Batal" class="btn btn-primary">Preview Data</button>
                          <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn green">Export Excel</button>
                        <button type="button" id="FormCetak" name="FormCetak" onclick="docetak();" value="Cetak" class="btn default hidden-print">Print</button>
                          <p>&nbsp;</p>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




