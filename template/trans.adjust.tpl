<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="js/plugins/jquerycombogrid/css/smoothness/jquery.ui.combogrid.css"/>
<link type="text/css" href="js/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
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
<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}
$(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
});
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
                            <th>No Adjusment</th>
                            <th>Tgl Adjusment</th>
                            <th>Proyek</th>
                            <th>Departemen</th>
                            <th>Jenis Adjustment</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoAdjust;noerr;block=tr]</td>
                            <td>[grid_blk.TglAdjust;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td>[grid_blk.CJenisAdjust;noerr;block=tr]</td>
                            <td width="25" align="center"><a href="#" class="back" onClick="#"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>
                          <td width="25" align="center">[var.button.E;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.E;noerr]'=='O-valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdAdjust;noerr]'"><span class="glyphicon glyphicon-eject info-tooltip" title="Update Data"></span></a>;else '']</td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='O-valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cIdAdjust;noerr]')"><span class="glyphicon glyphicon-trash info-tooltip" title="Delete Data"></span></a>;else '']</td>
                        </tr>
                        <tr>
                          <td colspan="6">&nbsp;</td>
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
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdAdjust;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="49%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No Adjusment</label>
                                <input type="text" name="edtadjust" id="edtadjust" class="form-control" style="width:200px;" value="[grid_blk.cNoAdjust;noerr;]" readonly/>
                            </div>
                            </td>
                            <td width="51%">
                            <div class="form-group">
                                <label>Proyek</label>
                                <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:450px;">
                                  <option value=''></option>
                                  <option value='[blk_proy.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cIdProyek;noerr]==[blk_proy.cIdProyek;noerr];then 'selected';else '']>[blk_proy.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td height="24"><span class="form-group">
                              <label>Tanggal Adjusment</label>
                              <input type="text" name="tgladjust" id="tgladjust" value="[grid_blk.TglAdjust;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="data-mask"/>
                            </span></td>
                            <td><div class="form-group">
                              <div class="form-group">
                                <label>Department</label>
                                <select class="form-control" id="cmbdept" name="cmbdept" style="width:300px;">
                                  <option value=''></option>
                                  <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                                </select>
                              </div>
                            </div></td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                              <label>Keterangan</label>
                              <textarea class="form-control" name="mmket" id="mmket" rows="3" >[grid_blk.cKeterangan;noerr;]</textarea>
                            </div>                            <!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                              Jenis Adjust
                                  <div class="radio">
                                <label>
                                  <input type="radio" name="chkflag" id="optionsRadios1" value="1" [onshow; if [grid_blk.CJenisAdjust;noerr;]=='1';then 'checked'; else '']>
                                  Pemutihan </label>
                              </div>
                              <div class="radio">
                                <label>
                                  <input type="radio" name="chkflag" id="optionsRadios2" value="2" [onshow; if [grid_blk.CJenisAdjust;noerr;]=='2';then 'checked'; else '']>
                                  Adjusment </label>
                              </div>
                              <div class="radio">
                                <label>
                                  <input type="radio" name="chkflag" id="optionsRadios2" value="3" [onshow; if [grid_blk.CJenisAdjust;noerr;]=='3';then 'checked'; else '']>
                                  Lain-lain </label>
                              </div>
                            </div></td>
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

jQuery(document).ready(function(){
	  var cols = [{'columnName':'cKdAsset','width':'30','label':'Kode Asset'},
	  				 {'columnName':'cKdBarang','width':'10','label':'Kode'},
					 {'columnName':'cKdSatuan','width':'50','label':'Satuan'}
					];	
					
	  $( "#kd_asset" ).bind('keyup', function(){
		  if($( "#nm_barang" ).val().length==0){
			  $('#kd_barang').val("");
			  $('#kd_satuan').val("");
			  $('#nm_satuan').val("");
		  }
	  });
	  
	  $( "#kd_asset" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/asset_list.php',
		  select: function( event, ui ) {
			  $( "#kd_asset" ).val( ui.item.cKdAsset );
			  $( "#nm_barang" ).val( ui.item.vNmBarang );
			  $( "#kd_satuan" ).val( ui.item.cKdSatuan );
			  $( "#nm_satuan" ).val( ui.item.vNmSatuan );
			  $( "#kd_barang" ).val( ui.item.cKdBarang );
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
			"KODE_ASSET" :  $("#kd_asset").val(),
			"NAMA_BARANG" :  $("#nm_barang").val(),
			"QUANTITY" : $("#val_qty").val(),
			"KODE_SATUAN" : $("#kd_satuan").val(),
			"SATUAN" : $("#nm_satuan").val(),
			"KETERANGAN" : $("#nn_keterangan").val()
		}   
		if(obj['KODE_BARANG']!=""){
		objs.push(obj);
		itemCount--;
		html = "<tr id='tr"+itemCount+"'>"+
			   "<input type='hidden' name='kd_barang[]' id='kd_barang[]' value='"+obj['KODE_BARANG']+"' class='form-control input-sm'/>"+ 	
		       "<td><input type='text' class='form-control input-sm' name='nm_barang[]' id='nm_barang[]' value='"+obj['NAMA_BARANG']+"' readonly/></td>"+
			   "<td><input type='text' class='form-control input-sm numeric' name='kd_asset[]' id='kd_asset[]' value='"+obj['KODE_ASSET']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm numeric' name='val_qty[]' id='val_qty[]' value='"+obj['QUANTITY']+"'/></td>"+
			   "<input type='hidden' name='kd_satuan[]' id='kd_satuan[]' class='form-control input-sm'  value='"+obj['KODE_SATUAN']+"'/>"+
			   "<td><input type='text' class='form-control input-sm' name='nm_satuan[]' id='nm_satuan[]' value='"+obj['SATUAN']+"' readonly/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='nn_keterangan[]' id='nn_keterangan[]' value='"+obj['KETERANGAN']+"'/></td>"+
			   "<td><a href='javascript:dodelete("+itemCount+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tbldetail").append(html);
	    $('#kd_barang').val("");
		$('#kd_asset').val("");
	    $('#nm_barang').val("");
	    $('#val_qty').val("");
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

 $(document).ready(function() {
    $('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            cKdDept: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Imputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 6,
                        message: 'Inputan maksimal 3 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=[var.~moduleid;noerr]',
                        message: 'Inputan sudah ada'
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
                                        <th>No. Inventaris</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                        <th width="30">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <input type="hidden" name="kd_barang" id="kd_barang" class="form-control input-sm"/>
                                	<td><div class="has-success"><input type="text" name="nm_barang" id="nm_barang" class="form-control input-sm" placeholder="Input nama barang"/></div></td>
                                    <td><div class="has-success"><input type="text" name="kd_asset" id="kd_asset" class="form-control input-sm numeric"/></div></td>
                                    <td><div class="has-success"><input type="text" name="val_qty" id="val_qty" class="form-control input-sm numeric"/></div></td>
                                    <input type="hidden" name="kd_satuan" id="kd_satuan" class="form-control input-sm"/>
                                    <td><div class="has-success"><input type="text" name="nm_satuan" id="nm_satuan" class="form-control input-sm" readonly/></div></td>
                                    <td><div class="has-success"><input type="text" name="nn_keterangan" id="nn_keterangan" class="form-control input-sm"/></div></td>
                                    <td><a href="#" name="add_button" id="add_button"><span class="glyphicon glyphicon-plus"></span></a></td>
                                </tr>
                                <tr id="tr[grid_dtl.cIdAdjustDet;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="kd_asset[]" id="kd_asset[]" value="[grid_dtl.cKdAsset;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <td><input type="text" name="val_qty[]" id="val_qty[]" value="[grid_dtl.nQty;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_dtl.cKeterangan;block=tr;noerr]" class="form-control input-sm"/></td>
                                    <td><a href="javascript:dodelete([grid_dtl.cIdAdjustDet;block=tr;noerr]);"><span class="glyphicon glyphicon-trash"></span></a></td>
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




