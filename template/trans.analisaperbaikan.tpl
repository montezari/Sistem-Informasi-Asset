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
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
<script src="js/advanced-form/advanced-form.js"></script>
<script language="javascript">
function ProsesTerima(val){
  var key = document.grid.fkey;
  var id = document.grid.fid;
  if(confirm('Proses pengiriman data ini...?')){
     key.value = val; 
     id.value = "TERIMA"; 
	 document.grid.submit();
  }  
}

$(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
});

function doprint(id){
  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/trans.analisaperbaikan.php?key='+id),
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
                            <th>No Analisa</th>
                            <th colspan="3">&nbsp;</th>
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
                            <td>[grid_blk.cNoAnalisa;noerr;block=tr]</td>
                            <td width="25" align="center"><a href="#" class="back" onClick="doprint([grid_blk.cIdRusak;noerr]);"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cFlagKirim;noerr;block=tr]-[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='1-S-valid';then <a href="#" class="back" onClick="ProsesTerima('[grid_blk.cIdRusak;noerr]')"><span class="glyphicon glyphicon-log-in info-tooltip" title="Proses Penerimaan Barang"></span></a>;else '<span class="glyphicon glyphicon-log-in"></span>']</td>
                            <td width="25" align="center">[var.button.E;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.E;noerr]'=='R-valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdRusak;noerr]'"><span class="glyphicon glyphicon-cog info-tooltip" title="Proses Analisa Kerusakan"></span></a>;else '<span class="glyphicon glyphicon-cog"></span>']</td>
                        </tr>
                        <tr>
                          <td colspan="9">&nbsp;</td>
                          <td colspan="3" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="glyphicon glyphicon-plus info-tooltip" title="New Data"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
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
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_blk.vNamaProyek;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal Kerusakan</label>
                                <input type="text" name="tglrusak" id="tglrusak" value="[grid_blk.dTglRusak;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium" style="width:100px;" readonly/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Departemen</label>
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_blk.vNmDept;noerr;]" readonly/>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Barang</label>
                                <input type="hidden" name="kd_barang_rusak" id="kd_barang_rusak" class="form-control input-sm" value="[grid_blk.cKdBarang;noerr;]" readonly/>
                                <input type="hidden" name="kd_satuan_rusak" id="kd_satuan_rusak" class="form-control input-sm" value="[grid_blk.cKdSatuan;noerr;]" readonly/>
                                <input type="text" name="nm_barang_rusak" id="nm_barang_rusak" class="form-control" style="width:200px;" value="[grid_blk.vNmBarang;noerr;]" readonly/>
                            </div>
                            </td>
                            <td rowspan="2" valign="top">
							  <div class="form-group">                                
                                <label>Barang dikirim ke</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios1" value="1" [onshow; if [grid_blk.cFlagKirim;noerr;]=='1';then 'checked'; else ''] disabled>
                                        Kantor Pusat
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="2" [onshow; if [grid_blk.cFlagKirim;noerr;]=='2';then 'checked'; else ''] disabled>
                                        Tak Dikirim
                                    </label>
                                </div>                            
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="3" [onshow; if [grid_blk.cFlagKirim;noerr;]=='3';then 'checked'; else ''] disabled>
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
                                <input type="hidden" name="id_asset" id="id_asset" class="form-control input-sm" value="[grid_blk.cIdAsset;noerr;]" readonly/>
                                <input type="text" name="kd_asset" id="kd_asset" class="form-control" style="width:200px;" value="[grid_blk.cKdAsset;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="padding-right:20px;">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Uraian Kerusakan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" readonly>[grid_blk.cKetRusak;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">
                            <div class="form-group">
                                <label>Keterangan lain-lain</label>
                                <textarea class="form-control" name="mmketlain" id="mmketlain" rows="3" readonly>[grid_blk.cKetKirim;noerr;]</textarea>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>No Analisa</label>
                                <input type="text" name="edtnoanalisa" id="edtnoanalisa" class="form-control" style="width:200px;" value="[grid_blk.cNoAnalisa;noerr;]" readonly/>
                            </div>    
                            </td>
                            <td style="padding-right:20px;" valign="top">
                            <div class="form-group">
                                <label>Jenis Kerusakaan</label>
                                <select class="form-control" id="cmbjnsrusak" name="cmbjnsrusak" style="width:450px;">
                                  <option value=''></option>
                                  <option value='[blk_jnsrusak.cKdKerusakan;noerr;block=option]' [onshow; if [grid_blk.cKdKerusakan;noerr]==[blk_jnsrusak.cKdKerusakan;noerr];then 'selected';else '']>[blk_jnsrusak.vNamaKerusakan;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" style="padding-right:20px;" >
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal Analisa</label>
                                <input type="text" name="tglanalisa" id="tglanalisa" value="[grid_blk.dTglAnalisa;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                            </div><!-- /.form group -->
                            </td>
                            <td rowspan="2" valign="top">
							  <div class="form-group">                                
                                <label>Hasil analisa/perbaikan</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="1" [onshow; if [grid_blk.cFlagAnalisa;noerr;]=='1';then 'checked'; else '']>
                                        Bisa diatasi, barang dikirim kembali ke proyek/bagian
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="2" [onshow; if [grid_blk.cFlagAnalisa;noerr;]=='2';then 'checked'; else '']>
                                        Dikirim ke supplier
                                    </label>
                                    <input type="text" name="edtsupp" id="edtsupp" class="form-control input-sm" style="width:200px;" value="[grid_blk.cSupplier;noerr;]" />
                                </div>                            
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="3" [onshow; if [grid_blk.cFlagAnalisa;noerr;]=='3';then 'checked'; else '']>
                                        Ditukar dengan No.
                                    </label>
                                    <input type="text" name="edttukar" id="edttukar" class="form-control input-sm" style="width:200px;" value="[grid_blk.cSupplier;noerr;]" />
                                </div> 
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="4" [onshow; if [grid_blk.cFlagAnalisa;noerr;]=='4';then 'checked'; else '']>
                                        Tidak bisa diperbaiki, barang kembali ke Kantor Pusat
                                    </label>
                                </div> 
                              </div>                            </td>
                          </tr>
                          <tr>
                            <td valign="top" style="padding-right:20px;" >
                            <div class="form-group">
                                <label>Uraian Perbaikan</label>
                                <textarea class="form-control" name="mmketanalisa" id="mmketanalisa" rows="3">[grid_blk.cKetAnalisa;noerr;]</textarea>
                            </div>
                            </td>
                          </tr>
                        </table>

<script>
  $(".numeric").numeric();
  $(function() {
	//Datemask dd/mm/yyyy
	$("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
	$("[data-mask]").inputmask();
  });

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
			  $('#nm_satuan').val("");
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
			  $( "#nm_satuan" ).val( ui.item.vNmSatuan );
			  return false;
		  }
	  });

  });

  var itemCount = 0;
 $(document).ready(function(){
	var objs=[];
	var temp_objs=[];
	$( "#add_button" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount,
			"KODE_BARANG" :  $("#kd_barang").val(),
			"NAMA_BARANG" :  $("#nm_barang").val(),
			"QUANTITY" : $("#val_qty").val(),
			"KODE_SATUAN" : $("#kd_satuan").val(),
			"SATUAN" : $("#nm_satuan").val(),
			"HARGA" : $("#val_price").val(),
			"KETERANGAN" : $("#nn_keterangan").val()
		}   
		if(obj['KODE_BARANG']!=""){
		objs.push(obj);
		itemCount--;
		html = "<tr id='tr"+itemCount+"'>"+
			   "<input type='hidden' name='kd_barang[]' id='kd_barang[]' value='"+obj['KODE_BARANG']+"' class='form-control input-sm'/>"+ 	
		       "<td><input type='text' class='form-control input-sm' name='nm_barang[]' id='nm_barang[]' value='"+obj['NAMA_BARANG']+"' readonly/></td>"+
			   "<td><input type='text' class='form-control input-sm numeric' name='val_qty[]' id='val_qty[]' value='"+obj['QUANTITY']+"'/></td>"+
			   "<input type='hidden' name='kd_satuan[]' id='kd_satuan[]' class='form-control input-sm'  value='"+obj['KODE_SATUAN']+"'/>"+
			   "<td><input type='text' class='form-control input-sm' name='nm_satuan[]' id='nm_satuan[]' value='"+obj['SATUAN']+"' readonly/></td>"+
			   "<td><input type='text' class='form-control input-sm numeric' name='val_price[]' id='val_price[]' value='"+obj['HARGA']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='nn_keterangan[]' id='nn_keterangan[]' value='"+obj['KETERANGAN']+"'/></td>"+
			   "<td><a href='javascript:dodelete("+itemCount+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tbldetail").append(html);
	    $('#kd_barang').val("");
	    $('#nm_barang').val("");
	    $('#val_qty').val("");
	    $('#val_price').val("");
	    $('#kd_satuan').val("");
	    $('#nm_satuan').val("");
	    $('#nn_keterangan').val("");
		}else{
		  if(obj['KODE_BARANG']!=""){
		    alert('Nama barang harus di isi.');
		  }else{
		    alert('Nama barang tidak valid.');
		  }
		}
	});
 });

 function dodelete(buttonId){
	if(confirm('anda yakin ingin menghapus detail data ini...?')){
	  $("#tr"+buttonId).remove();	
	}
 }
 
 $(document).ready(function() {
    $('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        fields: {
            cmbjnsrusak: {
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

                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="150">Harga</th>
                                        <th width="250">Keterangan</th>
                                        <th width="30">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <input type="hidden" name="kd_barang" id="kd_barang" class="form-control input-sm"/>
                                	<td><div class="has-success"><input type="text" name="nm_barang" id="nm_barang" class="form-control input-sm" placeholder="Input nama barang"/></div></td>
                                    <td><div class="has-success"><input type="text" name="val_qty" id="val_qty" class="form-control input-sm numeric"/></div></td>
                                    <input type="hidden" name="kd_satuan" id="kd_satuan" class="form-control input-sm"/>
                                    <td><div class="has-success"><input type="text" name="nm_satuan" id="nm_satuan" class="form-control input-sm" readonly/></div></td>
                                    <td><div class="has-success"><input type="text" name="val_price" id="val_price" class="form-control input-sm numeric"/></div></td>
                                    <td><div class="has-success"><input type="text" name="nn_keterangan" id="nn_keterangan" class="form-control input-sm"/></div></td>
                                    <td><a href="#" name="add_button" id="add_button"><span class="glyphicon glyphicon-plus"></span></a></td>
                                </tr>
                                <tr id="tr[grid_dtl.cIdSPADet;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_qty[]" id="val_qty[]" value="[grid_dtl.nQty;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_price[]" id="val_price[]" value="[grid_dtl.nHarga;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_dtl.cKeterangan;block=tr;noerr]" class="form-control input-sm"/></td>
                                    <td><a href="javascript:dodelete([grid_dtl.cIdSPADet;block=tr;noerr]);"><span class="glyphicon glyphicon-trash"></span></a></td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>
                        
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




