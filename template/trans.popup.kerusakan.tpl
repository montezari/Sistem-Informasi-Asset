		<div class="col-md">
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
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_hd.cNoRusak;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_hd.vNamaProyek;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal Kerusakan</label>
                                <input type="text" name="tglrusak" id="tglrusak" value="[grid_hd.dTglRusak;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium" style="width:100px;" readonly/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Departemen</label>
                                <input type="text" name="edtrusak" id="edtrusak" class="form-control" style="width:200px;" value="[grid_hd.vNmDept;noerr;]" readonly/>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Barang</label>
                                <input type="text" name="nm_barang_rusak" id="nm_barang_rusak" class="form-control" style="width:200px;" value="[grid_hd.vNmBarang;noerr;]" readonly/>
                            </div>
                            </td>
                            <td rowspan="2" valign="top">
							  <div class="form-group">                                
                                <label>Barang dikirim ke</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios1" value="1" [onshow; if [grid_hd.cFlagKirim;noerr;]=='1';then 'checked'; else ''] disabled>
                                        Kantor Pusat
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="2" [onshow; if [grid_hd.cFlagKirim;noerr;]=='2';then 'checked'; else ''] disabled>
                                        Tak Dikirim
                                    </label>
                                </div>                            
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkflag" id="optionsRadios2" value="3" [onshow; if [grid_hd.cFlagKirim;noerr;]=='3';then 'checked'; else ''] disabled>
                                        Lain-lain
                                    </label>
                                </div> 
                              </div>                           
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Kode Asset</label>
                                 <input type="text" name="kd_asset" id="kd_asset" class="form-control" style="width:200px;" value="[grid_hd.cKdAsset;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td style="padding-right:20px;">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Uraian Kerusakan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" readonly>[grid_hd.cKetRusak;noerr;]</textarea>
                            </div>
                            </td>
                            <td valign="top">
                            <div class="form-group">
                                <label>Keterangan lain-lain</label>
                                <textarea class="form-control" name="mmketlain" id="mmketlain" rows="3" readonly>[grid_hd.cKetKirim;noerr;]</textarea>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>No Analisa</label>
                                <input type="text" name="edtnoanalisa" id="edtnoanalisa" class="form-control" style="width:200px;" value="[grid_hd.cNoAnalisa;noerr;]" readonly/>
                            </div>    
                            </td>
                            <td style="padding-right:20px;" valign="top">
                            <div class="form-group">
                                <label>Jenis Kerusakaan</label>
                                <input type="text" name="cmbjnsrusak" id="cmbjnsrusak" class="form-control" style="width:200px;" value="[grid_hd.vNamaKerusakan;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" style="padding-right:20px;" >
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal Analisa</label>
                                <input type="text" name="tglanalisa" id="tglanalisa" value="[grid_hd.dTglAnalisa;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium" style="width:100px;" readonly/>
                            </div><!-- /.form group -->
                            </td>
                            <td rowspan="2" valign="top">
							  <div class="form-group">                                
                                <label>Hasil analisa/perbaikan</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="1" [onshow; if [grid_hd.cFlagAnalisa;noerr;]=='1';then 'checked'; else ''] disabled>
                                        Bisa diatasi, barang dikirim kembali ke proyek/bagian
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="2" [onshow; if [grid_hd.cFlagAnalisa;noerr;]=='2';then 'checked'; else ''] disabled/>
                                        Dikirim ke supplier
                                    </label>
                                    <input type="text" name="edtsupp" id="edtsupp" class="form-control input-sm" style="width:200px;" value="[grid_hd.cSupplier;noerr;]" readonly>
                                </div>                            
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="3" [onshow; if [grid_hd.cFlagAnalisa;noerr;]=='3';then 'checked'; else ''] disabled/>
                                        Ditukar dengan No.
                                    </label>
                                    <input type="text" name="edttukar" id="edttukar" class="form-control input-sm" style="width:200px;" value="[grid_hd.cSupplier;noerr;]" readonly>
                                </div> 
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="chkanalisa" id="chkanalisa" value="4" [onshow; if [grid_hd.cFlagAnalisa;noerr;]=='4';then 'checked'; else ''] disabled>
                                        Tidak bisa diperbaiki, barang kembali ke Kantor Pusat
                                    </label>
                                </div> 
                              </div>                            </td>
                          </tr>
                          <tr>
                            <td valign="top" style="padding-right:20px;" >
                            <div class="form-group">
                                <label>Uraian Analisa</label>
                                <textarea class="form-control" name="mmketanalisa" id="mmketanalisa" rows="3" readonly>[grid_hd.cKetAnalisa;noerr;]</textarea>
                            </div>
                            </td>
                          </tr>
                        </table>

                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="150">Harga</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_blk.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_qty[]" id="val_qty[]" value="[grid_blk.nQty;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_blk.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_price[]" id="val_price[]" value="[grid_blk.nHarga;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="nn_keterangan[]" id="nn_keterangan[]" value="[grid_blk.cKeterangan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>
                        
                        <div class="box-footer">
                            <button type="button" id="FormClose" name="FormClose" onclick="javascript:window.close();" value="Batal" class="btn btn-primary">Tutup</button>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>