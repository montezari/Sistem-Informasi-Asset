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
                          <tr>
                            <td height="40" colspan="3"><div align="center"><strong>SERAH TERIMA  BARANG </strong></div></td>
                          </tr>
                          <tr>
                            <td width="14%">No BPB</td>
                            <td width="1%">:</td>
                            <td width="85%">[print_hd.cNoBPB;noerr;]</td>
                          </tr>
                          <tr>
                            <td>Tgl BPB</td>
                            <td>:</td>
                            <td>[print_hd.dTglBPB;frm='dd/mm/yyyy';noerr;]</td>
                          </tr>
                          <tr>
                            <td><div align="left">Proyek Pengirim</div></td>
                            <td>:</td>
                            <td>[print_hd.vNamaProyekKirim;noerr;]</td>
                          </tr>
                          <tr>
                            <td>Keterangan</td>
                            <td>:</td>
                            <td>[print_hd.cKeterangan;noerr;]</td>
                          </tr>
                        </table>
                        
                        <div class="box-body table-responsive">
                            <table id="tbldetail" name="tbldetail" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th width="75">Qty</th>
                                        <th width="100">Satuan</th>
                                        <th width="250">Keterangan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>[print_blk.vNmBarang;block=tr;noerr]</td>
                                    <td>[print_blk.nQty;block=tr;noerr]</td>
                                    <td>[print_blk.vNmSatuan;block=tr;noerr]</td>
                                    <td>[print_blk.cKeterangan;block=tr;noerr]</td>
                                  </tr>
                                </tbody>
                          </table>
                      </div>

                      <div class="box-footer">
                            <a class="btnPrint" href='print/trans.stbrg.php?key=[print_hd.cIdBPB;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




