<script language="javascript">
function doexpexcel(){ 
	var _url = "excel.php?export=xlsx&id=master.asset";
	window.location = _url;
    //alert(_url);
}
</script>

<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}
</script>

<script type="text/javascript">
    $(document).ready(function() {
		    if($('#checkkomp:checked').length) {
                $("#komp").show();
            } else {
                $("#komp").hide();
            }
        });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $("#checkkomp").click(function() {
            //if($('#checkkomp:checked').length) {
		    if($('#checkkomp:checked').length) {
                $("#komp").show();
            } else {
                $("#komp").hide();
            }
        });
    })
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
                <table width="1031" class="table table-bordered table-hover" id="example2">
                <form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th width="50">No.</th>
                            <th width="217">No. Inventaris</th>
                            <th width="229">Nama Barang</th>
                            <th width="80">Satuan</th>
                            <th width="100">Merk</th>
                            <th width="100">Type</th>
                            <th width="200">Spesifikasi</th>
                            <th width="80">&nbsp;</th>
                            <th width="80">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cKdAsset;noerr;block=tr]</td>
                            <td>[grid_blk.vNmBarang;noerr;block=tr]</td>
                            <td>[grid_blk.vNmSatuan;noerr;block=tr]</td>
                            <td>[grid_blk.cMerk;noerr;block=tr]</td>
                            <td>[grid_blk.cType;noerr;block=tr]</td>
                            <td>[grid_blk.cSpesifikasi;noerr;block=tr]</td>
                            <td width="63" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onclick="window.location = '?m=[var.~moduleid;noerr]&amp;mode=form&amp;key=[grid_blk.cIdAsset;noerr]'"><span class="glyphicon glyphicon-eject info-tooltip" title="Update Data"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                            <td width="205" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdAsset;noerr]'"><span class="glyphicon glyphicon-folder-open info-tooltip" title="Lihat Detail"></span></a>;else <span class="glyphicon glyphicon-folder-open"></span>]</td>
                        </tr>
                    </tbody>
  					</form>
                </table>
                <p>&nbsp;</p>
                <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn btn-success">Export Excel</button>

            </div><!-- /.box-body -->
        </div><!-- /.box -->

		<div class="col-md">
        [onload_1; when [var.mode;noerr]==1; block=div]
            <!-- general form elements disabled -->
            <div class="box box-warning">
                <div class="box-body">
                  <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdAsset;noerr;]' size=/>
                      <!-- text input -->
                    <table width="103%" border="0">
                        <tr>
                          <td width="235"><!-- text input -->
                            <div class="form-group">
                              No. Inventaris
                            </div></td>
                          <td width="296"><!-- text input -->
                            <div class="form-group">
                              <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.cKdAsset;noerr;]" readonly="readonly"/>
                            </div></td>
                          <td width="138"><div class="form-group">
                            <label>Tgl Inventaris</label>
                          </div></td>
                          <td width="634"><div class="form-group">
                            <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.dTglAsset;frm='dd/mm/yyyy';noerr;]" readonly="readonly"/>
                          </div></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>Kode Barang</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.cKdBarang;noerr;]" readonly="readonly"/>
                          </div></td>
                          <td><div class="form-group"> Merk
                            <label></label>
                          </div></td>
                          <td><div class="form-group">
                            <label></label>
                            <input type="text" name="merk" id="merk" tabindex="1" class="form-control" style="width:200px;" value="[grid_dtl.cMerk;noerr;]" />
                          </div></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>Nama Barang</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" name="namabrg" id="namabrg" style="width:200px;" value="[grid_dtl.vNmBarang;noerr;]" readonly="readonly"/>
                          </div></td>
                          <td><div class="form-group"> Type</div></td>
                          <td><span class="form-group">
                            <input type="text" name="type" id="type"  tabindex="2" class="form-control" style="width:200px;" value="[grid_dtl.cType;noerr;]" />
                          </span></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>Satuan</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.vNmSatuan;noerr;]" readonly="readonly"/>
                          </div></td>
                          <td><span class="form-group">Serial Number </span></td>
                          <td><div class="form-group">
                            <label></label>
                            <input type="text" name="serial" id="serial" tabindex="3" class="form-control" style="width:200px;" value="[grid_dtl.cSerialNumber;noerr;]" />
                          </div></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>No SPA</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.cNoSPA;noerr;]" readonly="readonly"/>
                          </div></td>
                          <td>Spesifikasi</td>
                          <td><span class="form-group">
                          <label>
                            <textarea class="form-control" name="spesifikasi" tabindex="4" id="spesifikasi" rows="3" >[grid_dtl.cSpesifikasi;noerr;]</textarea>
                          </label>
                          </span></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>No SPB</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" style="width:200px;" value="[grid_dtl.cNoSPB;noerr;]" readonly="readonly"/>
                          </div></td>
                          <td>&nbsp;</td>
                          <td><input type="checkbox" value="1" id="checkkomp" name="checkkomp" [onshow; if [grid_blk.cKomp;noerr;]=='1';then 'checked'; if [grid_blk.cKomp;noerr;]=='';then 'checked';else '']/>  Komputer</td>
                        </tr>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>Kode Barcode</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" name="kodebarcode" id="kodebarcode" style="width:200px;" value="[grid_dtl.id_barcode;noerr;]" />
                          </div></td>
                          <td valign="top"><div class="form-group">
                            <label>Alamat Asset</label>
                          </div></td>
                          <td><div class="form-group">
                            <textarea class="form-control" name="alamatasset" tabindex="4" id="alamatasset" rows="3" >[grid_dtl.address_barcode;noerr;]</textarea>
                          </div></td>
                        </tr>
                        <tr>
                          <td><div class="form-group">
                            <label>Logitude</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" name="longitude" id="longitude" style="width:200px;" value="[grid_dtl.longitude_barcode;noerr;]" />
                          </div></td>
                          <td><div class="form-group">
                            <label>Latitude</label>
                          </div></td>
                          <td><div class="form-group">
                            <input type="text" class="form-control" name="latitude" id="latitude" style="width:200px;" value="[grid_dtl.latitude_barcode;noerr;]" />
                          </div></td>
                        </tr>
                        </tr>
                      </table>
                      <div id=komp style="display:none">
                    <table width="103%" border="0">
                      <tr>
                        <td width="235">&nbsp;</td>
                        <td width="466">&nbsp;</td>
                        <td width="84">Processor</td>
                        <td width="518"><input type="text" class="form-control" name="processor" id="processor" value="[grid_dtl.cProcessor;noerr;]"></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>MainBoard</td>
                        <td><input type="text" class="form-control" name="mainboard" id="mainboard" value="[grid_dtl.cMainBoard;noerr;]"/></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>Harddisk</td>
                        <td><input type="text" class="form-control" name="harddisk" id="harddisk" value="[grid_dtl.cHarddisk;noerr;]"/></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>Vga Card</td>
                        <td><input type="text" class="form-control" name="vga" id="vga" value="[grid_dtl.cVgaCard;noerr;]"/></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>Memory</td>
                        <td><input type="text" class="form-control" name="memory" id="memory" value="[grid_dtl.cMemory;noerr;]"/></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>DVD/CD</td>
                        <td><input type="text" class="form-control" name="dvd" id="dvd" value="[grid_dtl.cDvdCd;noerr;]"/></td>
                      </tr>
                      &lt;
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



