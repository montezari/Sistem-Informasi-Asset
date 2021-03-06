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
<script src="js/plugins/prettify/run_prettify.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
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


function doprint(id){
  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/trans.spb.php?key='+id),
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
                <form action="?m=[var.~moduleid;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>No SPB</th>
                            <th>Tgl SPB</th>
                            <th>Proyek</th>
                            <th>No SPA</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoSPB;noerr;block=tr]</td>
                            <td>[grid_blk.dTglSPB;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.cNoSPA;noerr;block=tr]</td>
                            <td width="25" align="center"><a href="#" class="back" onClick="doprint([grid_blk.cIdSPB;noerr]);"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdSPB;noerr]'"><span class="glyphicon glyphicon-eject info-tooltip" title="Update Data"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cIdSPB;noerr]')"><span class="glyphicon glyphicon-trash"></span></a>;else <span class="glyphicon glyphicon-trash info-tooltip" title="Delete Data"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="5">&nbsp;</td>
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
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdSPB;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No SPB</label>
                                <input type="text" name="edtspb" id="edtspb" class="form-control" style="width:200px;" value="[grid_blk.cNoSPB;noerr;]" readonly/>
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
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal SPB</label>
                                <input type="text" name="tglspb" id="tglspb" value="[grid_blk.dTglSPB;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                                <div class="form-group">
                                    <label>Pemasok</label>
                                    <input type="hidden" name="idsupp" id="idsupp" class="form-control input-sm" value="[grid_blk.cKdSupplier;noerr;]"/>
                                    <input type="text" name="edtsupp" id="edtsupp" class="form-control" style="width:200px;" value="[grid_blk.vNmSupplier;noerr]">
                                </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                                <div class="form-group">
                                    <label>No SPA</label>
                                    <input type="hidden" name="idspa" id="idspa" class="form-control input-sm" value="[grid_blk.cIdSPA;noerr;]"/>
                                    <input type="text" name="edtspa" id="edtspa" class="form-control" style="width:200px;" value="[grid_blk.cNoSPA;noerr;]" />
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label>OP No.</label>
                                    <input type="text" name="edtop" id="edtop" class="form-control" style="width:200px;" value="[grid_blk.cNoOP;noerr;]" />
                                </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                                <div class="form-group">
                                    <label>SPM</label>
                                    <input type="text" name="edtspm" id="edtspm" class="form-control" style="width:200px;" value="[grid_blk.cNoSPM;noerr;]" />
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label>SJ No.</label>
                                    <input type="text" name="edtnosj" id="edtnosj" class="form-control" style="width:200px;" value="[grid_blk.cNoSJ;noerr;]" />
                                </div>
                             </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" >[grid_blk.cKeterangan;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">
                               <div class="form-group">
                                    <label>Di Kirim Via</label>
                                    <input type="text" name="edtekspedisi" id="edtekspedisi" class="form-control" style="width:200px;" value="[grid_blk.cExpedisi;noerr;]" />
                                </div>
                            </td>
                          </tr>
                        </table>
                        
<script>

  function getdetail(id) {
	 jQuery.ajax({
        type: 'GET',
        url: 'ajax/spa.detail.php',
        data: 'id=' + id,
        dataType: 'json',
        success: function(response) {
		  var idx = 0;
		  var objs=[];
		  for (var i in response){
            var row = response[i];          
			var html = "";
			var obj={
				"ROW_ID" : idx,
				"KODE_BARANG" : row['cKdBarang'],
				"NAMA_BARANG" : row['vNmBarang'],
				"QUANTITY" : row['nQty'],
				"KODE_SATUAN" : row['cKdSatuan'],
				"SATUAN" : row['vNmSatuan'],
				"KETERANGAN" : row['cKeterangan']
			}   
			objs.push(obj);
			idx--;
			html = "<tr id='tr"+idx+"'>"+
				   "<input type='hidden' name='kd_barang[]' id='kd_barang[]' value='"+obj['KODE_BARANG']+"' class='form-control input-sm'/>"+ 	
				   "<td><input type='text' class='form-control input-sm' name='nm_barang[]' id='nm_barang[]' value='"+obj['NAMA_BARANG']+"' readonly/></td>"+
				   "<td><input type='text' class='form-control input-sm numeric' name='val_qty[]' id='val_qty[]' value='"+obj['QUANTITY']+"'/></td>"+
				   "<input type='hidden' name='kd_satuan[]' id='kd_satuan[]' class='form-control input-sm'  value='"+obj['KODE_SATUAN']+"'/>"+
				   "<td><input type='text' class='form-control input-sm' name='nm_satuan[]' id='nm_satuan[]' value='"+obj['SATUAN']+"' readonly/></td>"+
				   "<td><input type='text' class='form-control input-sm' name='nn_keterangan[]' id='nn_keterangan[]' value='"+obj['KETERANGAN']+"'/></td>"+
				   "<td><a href='javascript:dodelete("+idx+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
			$("#tbldetail").append(html);

          }         
		}
    });    
  }

  $(".numeric").numeric();
  $(function() {
	//Datemask dd/mm/yyyy
	$("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
	$("[data-mask]").inputmask();
  });
  
  // popup nospa
  jQuery(document).ready(function(){
	  var cols = [{'columnName':'cNoSPA','width':'30','label':'No SPA'},
				  {'columnName':'dTglSPA','width':'20','label':'Tgl SPA'},
				  {'columnName':'vNamaProyek','width':'25','label':'Proyek'},
				  {'columnName':'vNmDept','width':'25','label':'Departemen'},
				  {'columnName':'cIdSPA','width':'30','hidden': true,'label':'cIdSPA'}
				 ];	
					
	  $( "#edtspa" ).bind('keyup', function(){
		  if($( "#edtspa" ).val().length==0){
			  $('#idspa').val("");
			  $('#tbldetail > tbody > tr:nth-child(n+2)').remove();
		  }
	  });
	  
	  $( "#edtspa" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/spa.list.php',
		  select: function( event, ui ) {
			  $( "#idspa" ).val( ui.item.cIdSPA );
			  $( "#edtspa" ).val( ui.item.cNoSPA );
			  $('#tbldetail > tbody > tr:nth-child(n+2)').remove();
			  getdetail(ui.item.cIdSPA);
			  return false;
		  }
	  });

  });


  // popup supplier
  jQuery(document).ready(function(){
	  var cols = [{'columnName':'vNmSupplier','width':'30','label':'Nama Supplier'},
				  {'columnName':'cKdSupplier','width':'30','label':'Kode Supplier'}
				 ];	
					
	  $( "#edtsupp" ).bind('keyup', function(){
		  if($( "#edtsupp" ).val().length==0){
			  $('#idsupp').val("");
		  }
	  });
	  
	  $( "#edtsupp" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/supplier.list.php',
		  select: function( event, ui ) {
			  $( "#idsupp" ).val( ui.item.cKdSupplier );
			  $( "#edtsupp" ).val( ui.item.vNmSupplier );
			  return false;
		  }
	  });

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
			   "<td><input type='text' class='form-control input-sm' name='nn_keterangan[]' id='nn_keterangan[]' value='"+obj['KETERANGAN']+"'/></td>"+
			   "<td><a href='javascript:dodelete("+itemCount+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tbldetail").append(html);
	    $('#kd_barang').val("");
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
                                    <td><div class="has-success"><input type="text" name="nn_keterangan" id="nn_keterangan" class="form-control input-sm"/></div></td>
                                    <td><a href="#" name="add_button" id="add_button"><span class="glyphicon glyphicon-plus"></span></a></td>
                                </tr>
                                <tr id="tr[grid_dtl.cIdSPBDet;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_qty[]" id="val_qty[]" value="[grid_dtl.nQty;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_dtl.cKeterangan;block=tr;noerr]" class="form-control input-sm"/></td>
                                    <td><a href="javascript:dodelete([grid_dtl.cIdSPBDet;block=tr;noerr]);"><span class="glyphicon glyphicon-trash"></span></a></td>
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




