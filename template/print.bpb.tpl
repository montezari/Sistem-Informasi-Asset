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
                        <table width="100%" border="0">
                        <tr></tr>
                        <tr>
                          <td width="10%" height="47"><img src="./images/logo_tata.gif" alt="logo" width="100" height="45" align="left" /></td>
                          <td width="1%">&nbsp;</td>
                          <td colspan="4"><div align="center"><strong><font size="4">BUKTI PENGELUARAN BARANG</font></strong></div></td>
                        </tr>
                        <tr>
                          <td width="10%">Tujuan</td>
                          <td width="1%">:</td>
                          <td width="48%">[print_hd.vNamaProyekTerima;noerr;]</td>
                          <td width="14%">No BPB</td>
                          <td width="1%">:</td>
                          <td width="26%">[print_hd.cNoBPB;noerr;]</td>
                        </tr>
  <td>Proyek Penerima</td>
  <td>:</td>
  <td>&nbsp;</td>
  <td width="14%">Angkutan</td>
  <td width="1%">:</td>
  <td>[print_hd.cExpedisi;noerr;]</td>
</tr>
<tr>
  <td>Keterangan</td>
  <td>:</td>
  <td>&nbsp;</td>
  <td width="14%">No. Mobil</td>
  <td width="1%">:</td>
  <td>[print_hd.cNoMobil;noerr;]</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td width="14%">Pengirim</td>
  <td width="1%">:</td>
  <td>[print_hd.vNamaProyekKirim;noerr;]</td>
</tr>
                        </table>
                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                    	<th width="30">No.</th>
                                        <th>Nama Barang</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                  	<td>[print_blk.#; block=tr;noerr]</td>
                                    <td>[print_blk.vNmBarang;block=tr;noerr]</td>
                                    <td>[print_blk.nQty;block=tr;noerr]</td>
                                    <td>[print_blk.vNmSatuan;block=tr;noerr]</td>
                                    <td>[print_blk.cKeterangan;block=tr;noerr]</td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>

                      <div class="box-footer">
                            <a class="btnPrint" href='print/trans.bpb.php?key=[print_hd.cIdBPB;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
                        <table width="100%" border="0">
                              <tr>
                                <td width="28%">Referensi : SPM/SPA/Memo :</td>
                                <td width="18%">[print_hd.cKetKirim;noerr;]</td>
                                <td width="30%">&nbsp;</td>
                                <td width="24%" align="right">Jakarta, [print_hd.dTglBPB;frm='dd/mm/yyyy';noerr;]</td>
                              </tr>
                        </table>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




