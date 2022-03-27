<script src="js/plugins/print/jquery.printPage.js"></script>
<script>  
  $(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
  });
  $(document).ready(function() {
    $(".btnPrint").printPage();
  });
</script>
<div class="row">
    <div class="col-xs-12">
		<div class="col-md">
            <div class="box">
                <div class="box-body">
                    <form name="print" id="print">
                        <!-- text input -->
                        <table width="93%" border="0">
                        <tr>
                          <td width="11%" height="55"><img src="./images/logo_tata.gif" alt="logo" width="100" height="45" align="left" /></td>
                          <td width="1%">&nbsp;</td>
                          <td colspan="4"><div align="center"><font size="4"><strong>SURAT PERMINTAAN ALAT</strong></font></div></td>
                          </tr>
                        <tr>
                          <td width="11%">Proyek</td>
                          <td width="1%">:</td>
                          <td width="51%">[print_hd.vNamaProyek;noerr;]</td>
                          <td width="13%">No SPA</td>
                          <td width="1%">:</td>
                          <td width="23%">[print_hd.cNoSPA;noerr;]</td>
                        </tr>
                        <tr>
                          <td>Keterangan</td>
                          <td>:</td>
                          <td>[print_hd.cKeterangan;noerr;]</td>
                          <td width="13%">Tanggal SPA</td>
                          <td width="1%">:</td>
                          <td width="23%">[print_hd.dTglSPA;frm='dd/mm/yyyy';noerr;]</td>
                        </tr>
                        </table>
                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                    	<th>No.</th>
                                        <th width="180">Nama Barang</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="180">Tgl Dibutuhkan</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>[print_blk.#; block=tr;noerr]</td>
                                    <td>[print_blk.vNmBarang;block=tr;noerr]</td>
                                    <td>[print_blk.nQtyReq;block=tr;noerr]</td>
                                    <td>[print_blk.vNmSatuan;block=tr;noerr]</td>
                                    <td>[print_blk.dTglButuh;frm='dd/mm/yyyy';noerr;]</td>
                                    <td>[print_blk.cKeterangan;block=tr;noerr]</td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>

                      <div class="box-footer">
                            <a class="btnPrint" href='print/trans.spa.php?key=[print_hd.cIdSPA;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




