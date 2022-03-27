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
                            <th>Nama Pegawai</th>
                            <th>Nip</th>
                            <th>Proyek</th>
                            <th>Departemen</th>
                            <th>Email</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.vNamaPegawai;noerr;block=tr]</td>
                            <td>[grid_blk.cNip;noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td>[grid_blk.cEmail;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cKdPegawai;noerr]'"><span class="glyphicon glyphicon-eject"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cKdPegawai;noerr]')"><span class="glyphicon glyphicon-trash"></span></a>;else <span class="glyphicon glyphicon-trash"></span>]</td>
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
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cKdPegawai;noerr;]' size=/>
                        <div class="form-group">
                            <label>Proyek</label>
                            <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:350px;">
                                <option value=''></option>
                                <option value='[blk_proyek.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cIdProyek;noerr]==[blk_proyek.cIdProyek;noerr];then 'selected';else '']>[blk_proyek.vNamaProyek;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Departemen</label>
                            <select class="form-control" id="cmbdept" name="cmbdept" style="width:350px;">
                                <option value=''></option>
                                <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Nama Pegawai</label>
                            <input type="text" name="vNamaPegawai" id="vNamaPegawai" class="form-control" style="width:250px;" value="[grid_blk.vNamaPegawai;noerr;]"/>
                        </div>
                        <div class="form-group">Nip
                          <label></label>
                            <input type="text" name="nip" id="nip" class="form-control" style="width:250px;" value="[grid_blk.cNip;noerr;]"/>
                      </div>
                        <div class="form-group">
                            Email
                              <label></label>
                            <input type="text" name="email" id="email" class="form-control" style="width:250px;" value="[grid_blk.cEmail;noerr;]"/>
                        </div>
                      <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="cPejabat" name="cPejabat" [onshow; if [grid_blk.cPejabat;noerr;]=='1';then 'checked';else '']/>
                                    Pejabat
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
            cmbproyek: {
                validators: {
                    notEmpty: {
                        message: 'Pilih proyek terlebih dahulu'
                    }
                }
            },			
            cmbdept: {
                validators: {
                    notEmpty: {
                        message: 'Pilih departemen terlebih dahulu'
                    }
                }
            },			
            vNamaPegawai: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Imputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 50,
                        message: 'Inputan maksimal 3 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
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



