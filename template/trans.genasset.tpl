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
                            <th>No SPB</th>
                            <th>Tgl SPB</th>
                            <th>Proyek</th>
                            <th>No SPA</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoSPB;noerr;block=tr]</td>
                            <td>[grid_blk.dTglSPB;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.cNoSPA;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdSPB;noerr]'"><span class="glyphicon glyphicon-cog info-tooltip" title="Generate Asset"></span></a>;else <span class="glyphicon glyphicon-cog"></span>]</td>
                        </tr>
                    </tbody>
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->

        <div class="box">
        [onload_1; when [var.mode;noerr]==1; block=div]

<script language="javascript">
function ConfirmCancel(val1,val2){
  var key = document.grid.fkey;
  var brg = document.grid.fbrg;
  var gen = document.grid.fgen;
  
  if(confirm('anda yakin ingin membatalkan data ini...?')){
     key.value = val1; 
	 brg.value = val2;
	 gen.value = 0;
	 document.grid.submit();
  }  
}

function ConfirmGenerate(val1,val2){
  var key = document.grid.fkey;
  var brg = document.grid.fbrg;
  var gen = document.grid.fgen;
  
  if(confirm('anda yakin ingin mengenerate data ini...?')){
     key.value = val1; 
	 brg.value = val2;
	 gen.value = 1;
	 document.grid.submit();
  }  
}

function ConfirmGenerateAll(val1){
  var key = document.grid.fkey;
  var brg = document.grid.fbrg;
  var gen = document.grid.fgen;
  
  if(confirm('anda yakin ingin mengenerate semua data ini...?')){
     key.value = val1; 
	 brg.value = "";
	 gen.value = 2;
	 document.grid.submit();
  }  
}
</script>

            <div class="box-header">
              <div style="padding-top:5px;padding-left:10px;">
                <div>Jumlah Data : [var.~recordcount;noerr]</div>
                <div>Halaman : [var.~page_sequence;noerr]</div>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr]&mode=form&key=[var._GET.key;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                <input name='fbrg' id='fbrg' type='hidden' size=/>
                <input name='fgen' id='fgen' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tgl Generate</th>
                            <th>No SPB</th>
                            <th>No SPA</th>
                            <th>Nama Barang</th>
                            <th>Jml Barang</th>
                            <th>Tgl Batal</th>
                            <th>Tgl Posting</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.dTglGenerate;noerr;block=tr]</td>
                            <td>[grid_blk.cNoSPB;noerr;block=tr]</td>
                            <td>[grid_blk.cNoSPA;noerr;block=tr]</td>
                            <td>[grid_blk.vNmBarang;noerr;block=tr]</td>
                            <td>[grid_blk.jml;noerr;block=tr]</td>
                            <td>[grid_blk.dTglBatal;noerr;block=tr]</td>
                            <td>[grid_blk.cDatePosting;noerr;block=tr]</td>
                            <td width="25" align="center">
                            [onshow; if '[grid_blk.dTglBatal;noerr]-[grid_blk.cDatePosting;noerr]'=='-'; then <a href="#" class="back" onClick="ConfirmCancel('[grid_blk.cIdGenerate;noerr]','[grid_blk.cKdBarang;noerr]')"><span class="glyphicon glyphicon-floppy-remove info-tooltip" title="Cancel Data"></span></a>;else '']</td>
                            <td width="25" align="center">
                            [onshow; if '[grid_blk.dTglBatal;noerr]-[grid_blk.cDatePosting;noerr]'=='-'; then <a href="#" class="back" onClick="ConfirmGenerate('[grid_blk.cIdGenerate;noerr]','[grid_blk.cKdBarang;noerr]')"><span class="glyphicon glyphicon-edit info-tooltip" title="Generate Data"></span></a>;else '']</td>
                        </tr>
                        <tr>
                          <td colspan="8">&nbsp;</td>
                          <td colspan="2" align="center"><a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[var._GET.key;noerr]&act=detail'"><span class="glyphicon glyphicon-plus info-tooltip" title="New Data"></span></a></td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
  					</form>
                </table>
                <div class="box-footer">
                    <button type="button" id="FormKembali" name="FormKembali" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]';" value="Kembali" class="btn btn-primary">Kembali</button>
                    <button type="button" id="FormGen" name="FormGen" onclick="javascript:ConfirmGenerateAll('[var._GET.key;noerr]')" value="Generate" class="btn btn-primary">Generate All</button>
                </div>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        
		<div class="col-md">
        [onload_1; when [var.mode;noerr]==2; block=div]
            <!-- general form elements disabled -->
<script>
  $(".numeric").numeric();

 function dodelete(buttonId){
	if(confirm('anda yakin ingin menghapus detail data ini...?')){
	  $("#tr"+buttonId).remove();	
	}
 }

</script>
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]&mode=form&key=[var._GET.key;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdSPB;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No SPB</label>
                                <input type="hidden" name="idspb" id="idspb" class="form-control" style="width:200px;" value="[grid_blk.cIdSPB;noerr;]" readonly/>
                                <input type="text" name="edtspb" id="edtspb" class="form-control" style="width:200px;" value="[grid_blk.cNoSPB;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <input type="text" class="form-control" style="width:300px;" value="[grid_blk.vNamaProyek;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Tgl SPB</label>
                                <input type="text" class="form-control" style="width:200px;" value="[grid_blk.dTglSPB;frm='dd/mm/yyyy';noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>No SPA</label>
                                <input type="hidden" name="idspa" id="idspa" class="form-control" style="width:200px;" value="[grid_blk.cIdSPA;noerr;]" readonly/>
                                <input type="text" name="edtspa" id="edtspa" class="form-control" style="width:200px;" value="[grid_blk.cNoSPA;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="padding-right:20px;">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" rows="3" readonly>[grid_blk.cKeterangan;noerr;]</textarea>
                            </div>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
                        
                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th width="75">Qty SPB</th>
                                        <th width="100">Qty Sdh Gen</th>
                                        <th width="100">Qty Generate</th>
                                        <th width="100">Satuan</th>
                                        <th width="30">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr id="tr[grid_dtl.#;block=tr;noerr]">
                                    <input type="hidden" name="kd_barang[]" id="kd_barang[]" value="[grid_dtl.cKdBarang;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_dtl.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_qty_spb[]" id="val_qty_spb[]" value="[grid_dtl.nQty;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="val_qty_finish[]" id="val_qty_finish[]" value="[grid_dtl.jml;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="val_qty_gen[]" id="val_qty_gen[]" value="[grid_dtl.nsisa;block=tr;noerr]" class="form-control  input-sm numeric"/></td>
                                    <input type="hidden" name="kd_satuan[]" id="kd_satuan[]" value="[grid_dtl.cKdSatuan;block=tr;noerr]" class="form-control input-sm"/>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_dtl.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                     <td><a href="javascript:dodelete([grid_dtl.#;block=tr;noerr]);"><span class="glyphicon glyphicon-trash"></span></a></td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>

                        <div class="box-footer">
                          <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn btn-primary">Simpan</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]&mode=form&key=[var._GET.key;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




