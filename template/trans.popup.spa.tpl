		
        <div class="col-md" id="popups">
            <!-- general form elements disabled -->
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdSPA;noerr;]' size=/>
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td width="50%">
                            <!-- text input -->
                            <div class="form-group">
                                <label>No SPA</label>
                                <input type="text" name="edtspa" id="edtspa" class="form-control" style="width:200px;" value="[grid_hd.cNoSPA;noerr;]" readonly/>
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <input type="text" name="edtproy" id="edtproy" class="form-control" style="width:200px;" value="[grid_hd.vNamaProyek;noerr;]" readonly/>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal SPA</label>
                                <input type="text" name="tglspa" id="tglspa" value="[grid_hd.dTglSPA;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" readonly/>
                            </div><!-- /.form group -->
                            </td>
                            <td>
                            <div class="form-group">
                                <label>Departemen</label>
                                <input type="text" name="edtdept" id="edtdept" class="form-control" style="width:200px;" value="[grid_hd.vNmDept;noerr;]" readonly/>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td style="padding-right:20px;">
                            <!-- textarea -->
                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea class="form-control" name="mmket" id="mmket" rows="3" readonly>[grid_hd.cKeterangan;noerr;]</textarea>
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
                                        <th width="75">Qty SPA</th>
                                        <th width="100">Qty SPB</th>
                                        <th width="100">Qty Sisa</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="text" name="nm_barang[]" id="nm_barang[]" value="[grid_blk.vNmBarang;block=tr;noerr]" class="form-control input-sm" readonly/></td>
                                    <td><input type="text" name="val_qty_spa[]" id="val_qty_spa[]" value="[grid_blk.nQtyReq;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="val_qty_spb[]" id="val_qty_spb[]" value="[grid_blk.nQtySPB;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="val_qty[]" id="val_qty[]" value="[grid_blk.nQty;block=tr;noerr]" class="form-control  input-sm numeric" readonly/></td>
                                    <td><input type="text" name="nm_satuan[]" id="nm_satuan[]" value="[grid_blk.vNmSatuan;block=tr;noerr]" class="form-control input-sm" readonly/></td>
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


