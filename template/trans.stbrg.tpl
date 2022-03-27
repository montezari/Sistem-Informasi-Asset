<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery.ui.combogrid.css"/>
<link type="text/css" href="js/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
<link href="js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<style>
   .login-dialog .modal-dialog {
		width: 800px;
	}
</style>
<script type='text/javascript'>
    $.fn.bootstrapBtn = $.fn.button.noConflict();
</script>
<script type="text/javascript" src="js/plugins/jquerycombogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquerycombogrid/plugin/jquery.ui.combogrid-1.6.3.js"></script>
<script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript" src="js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="js/plugins/prettify/run_prettify.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
<script src="js/advanced-form/advanced-form.js"></script>
<script language="javascript">
$(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
});

function doprint(id){
  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/trans.stbrg.php?key='+id),
	cssClass: 'login-dialog',
  });
}
</script>
<div class="row">
    <div class="col-xs-12">
        <div class="box">
        [onload_1; when [var.mode;noerr]==0; block=div]
            <div class="box-header">
              <div style="padding-top:5px;padding-left:10px;">
                <div>Jumlah Data : [var.~recordcount;noerr]</div>
                <div>Halaman : [var.~page_sequence;noerr]</div>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>No BPB</th>
                            <th>Tgl BPB</th>
                            <th>Proyek Tujuan</th>
                            <th>Dept Tujuan</th>
                            <th>Tgl Kirim</th>
                            <th>Tgl Terima</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoBPB;noerr;block=tr]</td>
                            <td>[grid_blk.dTglBPB;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyekTerima;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDeptTerima;noerr;block=tr]</td>
                            <td>[grid_blk.dTglKirim;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.dTglTerima;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td width="25" align="center"><a href="#" class="back" onClick="doprint([grid_blk.cIdBPB;noerr]);"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>        
							<td width="25" align="center">[var.button.E;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.E;noerr]'=='S-valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdBPB;noerr]'"><span class="glyphicon glyphicon-log-in info-tooltip" title="Proses serah terima"></span></a>;else '']</td>


                        </tr>
                    </tbody>
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        
		<div class="col-md">
        [onload_1; when [var.mode;noerr]==1; block=div]
            <!-- general form elements disabled -->
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdBPB;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No BPB</label>
                                <input type="text" name="edtbpb" id="edtbpb" class="form-control" style="width:200px;" value="[grid_blk.cNoBPB;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Proyek Tujuan</label>
                                <input type="text" name="cmbproyterima" id="cmbproyterima" class="form-control" style="width:200px;" value="[grid_blk.vNamaProyekTerima;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal BPB</label>
                                <input type="text" name="tglbpb" id="tglbpb" value="[grid_blk.dTglBPB;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium" style="width:100px;" readonly/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Departemen Tujuan</label>
                                <input type="text" name="cmbdeptterima" id="cmbdeptterima" class="form-control" style="width:200px;" value="[grid_blk.vNmDeptTerima;noerr;]" readonly/>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Proyek Pengirim</label>
                                <input type="text" name="cmbproyterima" id="cmbproyterima" class="form-control" style="width:200px;" value="[grid_blk.vNamaProyekKirim;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Expedisi</label>
                                <input type="text" name="edtexpedisi" id="edtexpedisi" class="form-control" style="width:200px;" value="[grid_blk.cExpedisi;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Keterangan Kirim</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" readonly>[grid_blk.cKetKirim;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">
                            <div class="form-group">
                                <label>No Mobil</label>
                                <input type="text" name="edtnomobil" id="edtnomobil" class="form-control" style="width:200px;" value="[grid_blk.cNoMobil;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                            <div class="form-group">
                                <label>Keterangan Terima</label>
                                <textarea class="form-control" name="mmketterima" id="mmketterima" rows="3">[grid_blk.cKetTerima;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                        </table>

                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th>Kode Asset</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr id="tr[grid_dtl.cIdBPBDet;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="kd_asset[]" id="kd_asset[]" value="[grid_dtl.cKdAsset;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_dtl.cKeterangan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>

                        <div class="box-footer">
                          <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn btn-primary">Terima Barang</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




