<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery.ui.combogrid.css"/>
<link type="text/css" href="js/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
<link href="js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>
    $.fn.bootstrapBtn = $.fn.button.noConflict();
</script>
<script type="text/javascript" src="js/plugins/jquerycombogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquerycombogrid/plugin/jquery.ui.combogrid-1.6.3.js"></script>
<script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript" src="js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="js/advanced-form/advanced-form.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  var id = document.grid.fid;
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
     id.value = "HAPUS"; 
	 document.grid.submit();
  }  
}

function ProsesKirim(val){
  var key = document.grid.fkey;
  var id = document.grid.fid;
  if(confirm('Proses pengiriman data ini...?')){
     key.value = val; 
     id.value = "KIRIM"; 
	 document.grid.submit();
  }  
}

$(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
});

function doprint(id){
  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/trans.kerusakan.php?key='+id),
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
                <input name='fid' id='fid' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>No Kerusakan</th>
                            <th>Tgl Kerusakan</th>
                            <th>Proyek</th>
                            <th>Departemen</th>
                            <th>Barang</th>
                            <th>No. Inventaris</th>
                            <th>Tgl Kirim</th>
                            <th>Pengirim</th>
                            <th colspan="4">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoRusak;noerr;block=tr]</td>
                            <td>[grid_blk.dTglRusak;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td>[grid_blk.vNmBarang;noerr;block=tr]</td>
                            <td>[grid_blk.cKdAsset;noerr;block=tr]</td>
                            <td>[grid_blk.dTglKirim;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.cUserPengirim;noerr;block=tr]</td>
                             <td width="25" align="center"><a href="#" class="back" onClick="doprint([grid_blk.cIdRusak;noerr]);"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cFlagKirim;noerr;block=tr]-[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='1-O-valid';then <a href="#" class="back" onClick="ProsesKirim('[grid_blk.cIdRusak;noerr]')"><span class="glyphicon  glyphicon-log-out info-tooltip" title="Proses Pengiriman Barang"></span></a>;else '<span class="glyphicon  glyphicon-log-out"></span>']</td>
                            <td width="25" align="center">[var.button.E;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.E;noerr]'=='O-valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdRusak;noerr]'"><span class="glyphicon glyphicon-eject info-tooltip" title="Update Data"></span></a>;else '<span class="glyphicon glyphicon-eject"></span>']</td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='O-valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cIdRusak;noerr]')"><span class="glyphicon glyphicon-trash info-tooltip" title="Delete Data"></span></a>;else '<span class="glyphicon glyphicon-trash"></span>']</td>
                        </tr>
                        <tr>
                          <td colspan="9">&nbsp;</td>
                          <td colspan="4" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="glyphicon glyphicon-plus info-tooltip" title="New Data"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        
		<div class="col-md">
        [onload_1; when [var.mode;noerr]==1; block=div]
            <!-- general form elements disabled -->
            <div class="box box-warning">
<script>
  $(function() {
	//Datemask dd/mm/yyyy
	$("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
	$("[data-mask]").inputmask();
  });
  
  // popup barang
  jQuery(document).ready(function(){
	  var cols = [{'columnName':'cKdBarang','width':'10','label':'Kode'}, 
		          {'columnName':'vNmBarang','width':'30','label':'Nama'},
				  {'columnName':'vNmGroupBarang','width':'30','label':'Group'},
				  {'columnName':'cKdSatuan','width':'30','hidden': true,'label':'cKdSatuan'},
				  {'columnName':'vNmSatuan','width':'30','label':'Satuan'}
				 ];	
					
	  $( "#nm_barang" ).bind('keyup', function(){
		  if($( "#nm_barang" ).val().length==0){
			  $('#kd_barang').val("");
			  $('#kd_satuan').val("");
			  $('#kd_barang').val("");
			  $('#nm_barang').val("");
			  $('#kd_satuan').val("");
		  }
	  });
	  
	  $( "#nm_barang" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/barang.php',
		  select: function( event, ui ) {
			  $( "#kd_barang" ).val( ui.item.cKdBarang );
			  $( "#nm_barang" ).val( ui.item.vNmBarang );
			  $( "#kd_satuan" ).val( ui.item.cKdSatuan );
			  return false;
		  }
	  });

	  var cols_asset = [{'columnName':'cIdAsset','width':'10','hidden': true,'label':'ID'}, 
					    {'columnName':'cKdAsset','width':'80','label':'Kode Asset'},
					    {'columnName':'dTglAsset','width':'20','label':'Tgl Asset'}
					   ];	
					
	  $( "#kd_asset" ).bind('keyup', function(){
		  if($( "#kd_asset" ).val().length==0){
			  $('#kd_asset').val("");
			  $('#id_asset').val("");
		  }
	  });
	  
	  $( "#kd_asset" ).combogrid({
		  debug:true,
		  colModel: cols_asset,
		  param : 'kd_barang',
		  url: 'ajax/asset.php',
		  select: function( event, ui ) {
			  $( "#kd_asset" ).val( ui.item.cKdAsset );
			  $( "#id_asset" ).val( ui.item.cIdAsset );
			  return false;
		  }
	  });

  });

 $(document).ready(function() {
    $('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        fields: {
            cmbproyek: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            cmbdept: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            }
		}
    });
 });

</script>
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdRusak;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No Kerusakan</label>
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_blk.cNoRusak;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:450px;">
                                  <option value=''></option>
                                  <option value='[blk_proy.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cKdProyek;noerr]==[blk_proy.cIdProyek;noerr];then 'selected';else '']>[blk_proy.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td><!-- Date dd/mm/yyyy -->
                              <div class="form-group">
                                <label>Tanggal Kerusakan</label>
                                <input type="text" name="tglrusak" id="tglrusak" value="[grid_blk.dTglRusak;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="data-mask"/>
                              </div>
                              <!-- /.form group --></td>
                            <td><div class="form-group">
                              <label>Departemen</label>
                              <select class="form-control" id="cmbdept" name="cmbdept" style="width:300px;">
                                <option value=''></option>
                                <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if="if" [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                              </select>
                            </div></td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Jenis Barang</label>
                                <input type="hidden" name="kd_barang" id="kd_barang" class="form-control input-sm" value="[grid_blk.cKdBarang;noerr;]"/>
                                <input type="hidden" name="kd_satuan" id="kd_satuan" class="form-control input-sm" value="[grid_blk.cKdSatuan;noerr;]"/>
                                <input type="text" name="nm_barang" id="nm_barang" class="form-control" style="width:200px;" value="[grid_blk.vNmBarang;noerr;]" />
                            </div>
                            </td>
                            <td rowspan="2" valign="top">
							  <div class="form-group">                                
                                <label>Barang dikirim ke</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios1" value="1" [onshow; if [grid_blk.cFlagKirim;noerr;]=='1';then 'checked'; else '']>
                                        Kantor Pusat
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="2" [onshow; if [grid_blk.cFlagKirim;noerr;]=='2';then 'checked'; else '']>
                                        Tak Dikirim
                                    </label>
                                </div>                            
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="3" [onshow; if [grid_blk.cFlagKirim;noerr;]=='3';then 'checked'; else '']>
                                        Lain-lain
                                    </label>
                                </div> 
                              </div>                           
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                No. Inventaris
                                  <label></label>
                                <input type="hidden" name="id_asset" id="id_asset" class="form-control input-sm" value="[grid_blk.cIdAsset;noerr;]"/>
                                <input type="text" name="kd_asset" id="kd_asset" class="form-control" style="width:200px;" value="[grid_blk.cKdAsset;noerr;]" />
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="padding-right:20px;">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Uraian Kerusakan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" >[grid_blk.cKetRusak;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">
                            <div class="form-group">
                                <label>Keterangan lain-lain</label>
                                <textarea class="form-control" name="mmketlain" id="mmketlain" rows="3" >[grid_blk.cKetKirim;noerr;]</textarea>
                            </div>
                            </td>
                          </tr>
                        </table>
                        
                        <div class="box-footer">
                          <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn btn-primary">Simpan</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




