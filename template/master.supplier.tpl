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
                <form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid' id="grid">
                  <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cKdSupplier;noerr;]' size=/>
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Kode Supplier</th>
                      <th>Nama Supplier</th>
                      <th>Alamat</th>
                      <th>Kota</th>
                      <th>Tlp</th>
                      <th>Email</th>
                      <th colspan="2">&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>[grid_blk.#; block=tr;noerr]</td>
                      <td>[grid_blk.cKdSupplier;noerr;block=tr]</td>
                      <td>[grid_blk.vNmSupplier;noerr;block=tr]</td>
                      <td>[grid_blk.vAlamat;noerr;block=tr]</td>
                      <td>[grid_blk.vKota;noerr;block=tr]</td>
                      <td>[grid_blk.vTlp;noerr;block=tr]</td>
                      <td>[grid_blk.vEmail;noerr;block=tr]</td>
                      <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onclick="window.location = '?m=[var.~moduleid;noerr]&amp;mode=form&amp;key=[grid_blk.cKdSupplier;noerr]'"><span class="glyphicon glyphicon-eject"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                      <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onclick="ConfirmDelete('[grid_blk.cKdSupplier;noerr]')"><span class="glyphicon glyphicon-trash"></span></a>;else <span class="glyphicon glyphicon-trash"></span>]</td>
                    </tr>
                    <tr>
                      <td colspan="7">&nbsp;</td>
                      <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onclick="window.location = '?m=[var.~moduleid;noerr]&amp;mode=form'"><span class="glyphicon glyphicon-plus"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
                    </tr>
                  </tbody>
                  <input type="hidden" name="FormAction2" value="HAPUS" />
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
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cKdSupplier;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                              <label>Kode Supplier</label>
                              <input type="text" name="edtKode" id="edtKode" class="form-control" style="width:150px;" value="[grid_blk.cKdSupplier;noerr;]" />
                            </div></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                              <label>Nama Supplier</label>
                              <input type="text" name="edtNama" id="edtNama" class="form-control" style="width:250px;" value="[grid_blk.vNmSupplier;noerr;]"/>
                            </div>                            <!-- /.form group -->
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td><div class="form-group">
                              <label>Alamat</label>
                              <textarea class="form-control" name="alamat" id="alamat" rows="3" >[grid_blk.vAlamat;noerr;]</textarea>
                            </div></td>
                            <td rowspan="2" valign="top"><p class="form-group">
                              <label>Kota</label>
                                <input type="text" name="kota" id="kota" class="form-control" style="width:250px;" value="[grid_blk.vKota;noerr;]"/>
<label>No. Tlp</label>
                                <input type="text" name="tlp" id="tlp" class="form-control" style="width:250px;" value="[grid_blk.vTlp;noerr;]"/>
                            </p>
                            <p class="form-group">
                              <label>No. Fax</label>
                              <input type="text" name="fax" id="fax" class="form-control" style="width:250px;" value="[grid_blk.vFax;noerr;]"/>
                            </p></td>
                          </tr>
                          <tr>
                            <td><div class="form-group"> Email
                              <input type="text" name="email" id="email" class="form-control" style="width:250px;" value="[grid_blk.vEmail;noerr;]"/>
                            </div></td>
                          </tr>
                          <tr>
                            <td colspan="2" style="padding-right:20px;">
                            <!-- textarea -->

                            <div class="form-group"><span class="checkbox">
                              <label>
                                <input type="checkbox" value="1" id="chkAktif" name="chkAktif" [onshow; if [grid_blk.cAktif;noerr;]=='1';then 'checked'; if [grid_blk.cKdGroupUser;noerr;]=='';then 'checked';else '']/>
                                Aktif </label>
                            </span></div>
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
                        message: 'Inputan tidak boleh kosong dan harus di isi'
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
            edtNama: {
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
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




