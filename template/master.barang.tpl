<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
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
                            <th>Kode Barang</th>
                            <th>Nama Barang</th>
                            <th>Group Barang</th>
                            <th>Satuan</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cKdBarang;noerr;block=tr]</td>
                            <td>[grid_blk.vNmBarang;noerr;block=tr]</td>
                            <td>[grid_blk.vNmGroupBarang;noerr;block=tr]</td>
                            <td>[grid_blk.vNmSatuan;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cKdBarang;noerr]'"><span class="glyphicon glyphicon-eject"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cKdBarang;noerr]')"><span class="glyphicon glyphicon-trash"></span></a>;else <span class="glyphicon glyphicon-trash"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="5">&nbsp;</td>
                          <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="glyphicon glyphicon-plus"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
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
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cKdBarang;noerr;]' size=/>
                        <!-- text input -->
                        <div class="form-group">
                            <label>Kode Barang</label>
                            <input type="text" name="edtKode" id="edtKode" class="form-control" style="width:150px;" value="[grid_blk.cKdBarang;noerr;]"  [onshow; if [grid_blk.cKdBarang;noerr]!='';then 'disabled';else '']/>
                        </div>
                        <div class="form-group">
                            <label>Nama Barang</label>
                            <input type="text" name="edtNama" id="edtNama" class="form-control" style="width:250px;" value="[grid_blk.vNmBarang;noerr;]"/>
                        </div>
                        <div class="form-group">
                            <label>Group Barang</label>
                            <select class="form-control" id="cmbgrpbarang" name="cmbgrpbarang" style="width:350px;">
                                <option value=''></option>
                                <option value='[blk_grp.cKdGroupBarang;noerr;block=option]' [onshow; if [grid_blk.cKdGroupBarang;noerr]==[blk_grp.cKdGroupBarang;noerr];then 'selected';else '']>[blk_grp.vNmGroupBarang;noerr;block=option]</option>
                            </select>
                        </div>
                         <div class="form-group">
                            <label>Satuan</label>
                            <select class="form-control" id="cmbsatuan" name="cmbsatuan" style="width:350px;">
                                <option value=''></option>
                                <option value='[blk_sat.cKdSatuan;noerr;block=option]' [onshow; if [grid_blk.cKdSatuan;noerr]==[blk_sat.cKdSatuan;noerr];then 'selected';else '']>[blk_sat.vNmSatuan;noerr;block=option]</option>
                            </select>
                        </div>
                       <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="chkAktif" name="chkAktif" [onshow; if [grid_blk.cAktif;noerr;]=='1';then 'checked'; if [grid_blk.cKdGroupUser;noerr;]=='';then 'checked';else '']/>
                                    Aktif
                                </label>                                                
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn btn-primary">Simpan</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                        </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
<script type="text/javascript">
$(document).ready(function() {
    $('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            edtKode: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Imputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: 'Inputan maksimal 10 karakter'
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
            },
            cmbgrpbarang: {
                validators: {
                    notEmpty: {
                        message: 'Pilih group barang terlebih dahulu'
                    }
                }
            }			
		}
    });
});
</script>
        </div>
        
    </div>
</div>



