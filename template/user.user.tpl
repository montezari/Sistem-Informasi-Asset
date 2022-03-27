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
                            <th>Proyek</th>
                            <th>Departemen</th>
                            <th>Nama Pegawai</th>
                            <th>User Name</th>
                            <th>Status</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td>[grid_blk.vNamaPegawai;noerr;block=tr]</td>
                            <td>[grid_blk.cUserName;noerr;block=tr]</td>
                            <td>[grid_blk.cAktif;noerr;if [grid_blk.cAktif;noerr]=='1';then 'Aktif';else 'Tidak Aktif';block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdPeg;noerr]'"><span class="glyphicon glyphicon-eject"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
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
                    <form name="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cUserId;noerr;]' size=/>
                    <input name='fpeg' id='fpeg' type='hidden' value='[grid_blk.cIdPeg;noerr;]' size=/>
                        <!-- text input -->
                        <div class="form-group">
                            <label>Proyek</label>
                            <input type="text" name="vNamaProyek" id="vNamaProyek" class="form-control" style="width:250px;" value="[grid_blk.vNamaProyek;noerr;]" disabled/>
                        </div>
                        <div class="form-group">
                            <label>Departemen</label>
                            <input type="text" name="vNmDept" id="vNmDept" class="form-control" style="width:250px;" value="[grid_blk.vNmDept;noerr;]" disabled/>
                        </div>
                        <div class="form-group">
                            <label>Nama Pegawai</label>
                            <input type="text" name="vNamaPegawai" id="vNamaPegawai" class="form-control" style="width:250px;" value="[grid_blk.vNamaPegawai;noerr;]" disabled/>
                        </div>
                       <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="cUserName" id="cUserName" class="form-control" style="width:250px;" value="[grid_blk.cUserName;noerr;]"/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="cPassword" id="cPassword" class="form-control" style="width:250px;" value="[var.cPassword;noerr;]"/>
                        </div>
                        <div class="form-group">
                            
                            <label>User Group</label>
                          <select class="form-control" id="cmbgroup" name="cmbgroup" style="width:250px;">
                            <option value=''></option>
                            <option value='[blk_grp.cKdGroupUser;noerr;block=option]' [onshow; if [grid_blk.cKdGroupUser;noerr]==[blk_grp.cKdGroupUser;noerr];then 'selected';else '']>[blk_grp.vNmGroupUser;noerr;block=option]</option>
                          </select>
                        </div>
                        <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="cAktif" name="cAktif" [onshow; if [grid_blk.cAktif;noerr;]=='1';then 'checked'; else '']/>Aktif</label>                                                
                            </div>
                        </div>
                        <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="cSuper" name="cSuper" [onshow; if [grid_blk.cSuper;noerr;]=='1';then 'checked'; else '']/>Super Administrator</label>                                                
                            </div>
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



