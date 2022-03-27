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
                        <table width="94%" border="0">
                        <tr>
                          <td width="10%" height="47"><img src="./images/logo_tata.gif" alt="logo" width="100" height="45" align="left" /></td>
                          <td width="1%">&nbsp;
                          </td>
                          <td colspan="4"><div align="center"><font size="4"><strong>SURAT PENERIMAAN BARANG</strong></font></div></td>
                          </tr>
                           <tr>
                          <td width="10%">Pemasok</td>
                          <td width="1%">:</td>
                          <td width="39%">[print_hd.vNmSupplier;noerr;]</td>
                          <td width="18%">No SPB</td>
                          <td width="1%">:</td>
                          <td width="31%">[print_hd.cNoSPB;noerr;]</td>
                           </tr>
                            <td>Proyek</td>
                          <td>:</td>
                          <td>[print_hd.vNamaProyek;noerr;]</td>
                          <td width="18%">Tgl SPB</td>
                          <td width="1%">:</td>
                          <td>[print_hd.dTglSPB;frm='dd/mm/yyyy';noerr;]</td>
                          </tr>
                          <tr>
                          <td>Keterangan</td>
                          <td>:</td>
                          <td>[print_hd.cKeterangan;noerr;]</td>
                          <td width="18%">SPM</td>
                          <td width="1%">:</td>
                          <td>[print_hd.cNoSPM;noerr;]</td>
                          </tr>
                                                    <tr>
                          <td>Dikirim Via</td>
                          <td>: </td>
                          <td>[print_hd.cExpedisi;noerr;]</td>
                          <td width="18%">OP. No.</td>
                          <td width="1%">:</td>
                          <td>[print_hd.cNoOP;noerr;]</td>
                          </tr>
                                                    <tr>
                                                      <td>&nbsp;</td>
                                                      <td>&nbsp;</td>
                                                      <td>&nbsp;</td>
                                                      <td>SJ. No.</td>
                                                      <td>:</td>
                                                      <td>[print_hd.cNoSJ;noerr;]</td>
                                                    </tr>
                        </table>
                        
                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                    	<th width="30">No.</th>
                                        <th width="180">Nama Barang</th>
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
                            <a class="btnPrint" href='print/trans.spb.php?key=[print_hd.cIdSPB;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




