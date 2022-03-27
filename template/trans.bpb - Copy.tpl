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
    message: $('<div></div>').load('print/trans.bpb.php?key='+id),
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
                            <th>No BPB</th>
                            <th>Tgl BPB</th>
                            <th>Proyek Tujuan</th>
                            <th>Dept Tujuan</th>
                            <th>Tgl Kirim</th>
                            <th colspan="4">&nbsp;</th>
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
                            <td width="25" align="center"><a href="#" class="back" onClick="doprint([grid_blk.cIdBPB;noerr]);"><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='O-valid';then <a href="#" class="back" onClick="ProsesKirim('[grid_blk.cIdBPB;noerr]')"><span class="glyphicon  glyphicon-log-out info-tooltip" title="Proses Pengiriman Barang"></span></a>;else '']</td>
                            <td width="25" align="center">[var.button.E;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.E;noerr]'=='O-valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdBPB;noerr]'"><span class="glyphicon glyphicon-eject info-tooltip" title="Update Data"></span></a>;else '']</td>
                            <td width="25" align="center">[var.button.D;if '[grid_blk.cStatus;noerr;block=tr]-[var.button.D;noerr]'=='O-valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cIdBPB;noerr]')"><span class="glyphicon glyphicon-trash info-tooltip" title="Delete Data"></span></a>;else '']</td>
                        </tr>
                        <tr>
                          <td colspan="6">&nbsp;</td>
                          <td colspan="4" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="glyphicon glyphicon-plus info-tooltip" title="New Data"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="PROSES">
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
                                <select class="form-control" id="cmbproyterima" name="cmbproyterima" style="width:450px;">
                                  <option value=''></option>
                                  <option value='[blk_proyterima.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cKdProyekTerima;noerr]==[blk_proyterima.cIdProyek;noerr];then 'selected';else '']>[blk_proyterima.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal BPB</label>
                                <input type="text" name="tglbpb" id="tglbpb" value="[grid_blk.dTglBPB;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Departemen Tujuan</label>
                                <select class="form-control" id="cmbdeptterima" name="cmbdeptterima" style="width:300px;">
                                  <option value=''></option>
                                  <option value='[blk_deptterima.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDeptTerima;noerr]==[blk_deptterima.cKdDept;noerr];then 'selected';else '']>[blk_deptterima.vNmDept;noerr;block=option]</option>
                                </select>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td><div class="form-group">
                              No. SPB
                                  <label></label>
                                  <input type="hidden" name="idspb" id="idspb" class="form-control input-sm" value="[grid_blk.cIdSPB;noerr;]"/>
                                    <input type="text" name="edtspb" id="edtspb" class="form-control" style="width:200px;" value="[grid_blk.cNoSPB;noerr;]" />
                            </div></td>
                            <td><div class="form-group">
                              <label>Expedisi</label>
                              <input type="text" name="edtexpedisi" id="edtexpedisi" class="form-control" style="width:200px;" value="[grid_blk.cExpedisi;noerr;]"/>
                            </div></td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Proyek Pengirim</label>
                                <select class="form-control" id="cmbproykirim" name="cmbproykirim" style="width:450px;">
                                  <option value=''></option>
                                  <option value='[blk_proykirim.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cKdProyekKirim;noerr]==[blk_proykirim.cIdProyek;noerr];then 'selected';else '']>[blk_proykirim.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                            <td><div class="form-group">
                              <label>No Mobil</label>
                              <input type="text" name="edtnomobil" id="edtnomobil" class="form-control" style="width:200px;" value="[grid_blk.cNoMobil;noerr;]"/>
                            </div></td>
                          </tr>
                          <tr>
                            <td valign="top">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" >[grid_blk.cKetKirim;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                        </table>
                        
<script>

//untuk get detail spb
function getdetail(id) {
	 jQuery.ajax({
        type: 'GET',
        url: 'ajax/spb.detail.php',
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
				"QUANTITY" : row['jumlah'],
				"KODE_SATUAN" : row['cKdSatuan'],
				"SATUAN" : row['vNmSatuan'],
				"KODE_ASSET" : row['cKdAsset']
			}   
			objs.push(obj);
			idx--;
			html = "<tr id='tr"+idx+"'>"+
				   "<input type='hidden' name='kd_barang[]' id='kd_barang[]' value='"+obj['KODE_BARANG']+"' class='form-control input-sm'/>"+ 	
				   "<td><input type='text' class='form-control input-sm' name='nm_barang[]' id='nm_barang[]' value='"+obj['NAMA_BARANG']+"' readonly/></td>"+
				   "<td><input type='text' class='form-control input-sm' name='kd_asset[]' id='kd_asset[]' value='"+obj['KODE_ASSET']+"' readonly/></td>"+
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


  // popup nospb
  jQuery(document).ready(function(){
	  var cols = [{'columnName':'cIdSPB','width':'30','label':'cIdSPB'},
	  			  {'columnName':'cNoSPB','width':'30','label':'No SPB'},
				  {'columnName':'vNamaProyek','width':'30','label':'Proyek'},
				  {'columnName':'vNmDept','width':'25','label':'Departemen'}
				 ];	
					
	  $( "#edtspb" ).bind('keyup', function(){
		  if($( "#edtspb" ).val().length==0){
			  $('#idspb').val("");
			  $('#tbldetail > tbody > tr:nth-child(n+2)').remove();
		  }
	  });
	  
	  $( "#edtspb" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/spb.list.php',
		  select: function( event, ui ) {
			  $( "#idspb" ).val( ui.item.cIdSPB );
			  $( "#edtspb" ).val( ui.item.cNoSPB );
			  $('#tbldetail > tbody > tr:nth-child(n+2)').remove();
			  getdetail(ui.item.cIdSPB);
			  return false;
		  }
	  });
	  
  });


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
			  $('#kd_asset').val("");
			  $('#id_asset').val("");
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
			  $('#kd_asset').val("");
			  $('#id_asset').val("");
			  $( "#kd_satuan" ).val( ui.item.cKdSatuan );
			  $( "#nm_satuan" ).val( ui.item.vNmSatuan );
			  return false;
		  }
	  });

	  var cols_asset = [{'columnName':'cIdAsset','width':'10','hidden': true,'label':'ID'}, 
					    {'columnName':'cKdAsset','width':'80','label':'Kode Asset'},
					    {'columnName':'jumlah','width':'20','label':'Qty'}
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
			"ID_ASSET" : $("#id_asset").val(),
			"KODE_ASSET" : $("#kd_asset").val(),
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
			   "<input type='hidden' name='id_asset[]' id='id_asset[]' value='"+obj['ID_ASSET']+"' class='form-control input-sm'/>"+ 	
			   "<td><input type='text' class='form-control input-sm' name='kd_asset[]' id='kd_asset[]' value='"+obj['KODE_ASSET']+"' readonly/></td>"+
			   "<input type='hidden' name='kd_satuan[]' id='kd_satuan[]' class='form-control input-sm'  value='"+obj['KODE_SATUAN']+"'/>"+
			   "<td><input type='text' class='form-control input-sm' name='nm_satuan[]' id='nm_satuan[]' value='"+obj['SATUAN']+"' readonly/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='nn_keterangan[]' id='nn_keterangan[]' value='"+obj['KETERANGAN']+"'/></td>"+
			   "<td><a href='javascript:dodelete("+itemCount+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tbldetail").append(html);
	    $('#kd_barang').val("");
	    $('#nm_barang').val("");
	    $('#kd_asset').val("");
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
            cmbproykirim: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            cmbproyterima: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            cmbdeptterima: {
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
                                        <th>No. Inventaris</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                        <th width="30">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <input type="hidden" name="kd_barang" id="kd_barang" class="form-control input-sm"/>
                                	<td><div class="has-success"><input type="text" name="nm_barang" id="nm_barang" class="form-control input-sm" placeholder="Input nama barang"/></div></td>
                                    <input type="hidden" name="id_asset" id="id_asset" class="form-control input-sm"/>
                                	<td><div class="has-success"><input type="text" name="kd_asset" id="kd_asset" class="form-control input-sm" placeholder="Input kode asset"/></div></td>
                                    <input type="hidden" name="kd_satuan" id="kd_satuan" class="form-control input-sm"/>
                                    <td><div class="has-success"><input type="text" name="nm_satuan" id="nm_satuan" class="form-control input-sm" readonly/></div></td>
                                    <td><div class="has-success"><input type="text" name="nn_keterangan" id="nn_keterangan" class="form-control input-sm"/></div></td>
                                    <td><a href="#" name="add_button" id="add_button"><span class="glyphicon glyphicon-plus"></span></a></td>
                                </tr>
                                <tr id="tr[grid_dtl.cIdBPBDet;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <input type="hidden" name="id_asset[]" id="id_asset[]" value="[grid_dtl.cIdAsset;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="kd_asset[]" id="kd_asset[]" value="[grid_dtl.cKdAsset;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_dtl.cKeterangan;block=tr;noerr]" class="form-control input-sm"/></td>
                                    <td><a href="javascript:dodelete([grid_dtl.cIdBPBDet;block=tr;noerr]);"><span class="glyphicon glyphicon-trash"></span></a></td>
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




