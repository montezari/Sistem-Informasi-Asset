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
                            <td width="20%"><img src="./images/logo_tata.gif" alt="logo" width="76" height="57" style="width:60px;height:35px" align="left" /></td>
                            <td width="1%">&nbsp;</td>
                            <td width="85%"><font size="4">
                            <div align="center"><strong>LAPORAN PERBAIKAN BARANG</strong></div></td>
                          </tr>
                          <tr>
                            <td width="14%">No Kerusakan</td>
                            <td width="1%">:</td>
                            <td width="85%">[print_hd.cNoRusak;noerr;]</td>
                          </tr>
                          <tr>
                            <td>Tgl Kerusakan</td>
                            <td>:</td>
                            <td>[print_hd.dTglRusak;frm='dd/mm/yyyy';noerr;]</td>
                          </tr>
                          <tr>
                            <td><div align="left">Proyek</div></td>
                            <td>:</td>
                            <td>[print_hd.vNamaProyek;noerr;]</td>
                          </tr>
                          <tr>
                            <td>No Analisa</td>
                            <td>:</td>
                            <td>[print_hd.cNoAnalisa;noerr;]</td>
                          </tr><tr>
                            <td>Uraian Perbaikan</td>
                            <td>:</td>
                            <td>[print_hd.cKetAnalisa;noerr;]</td>
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
                                        <th width="300">Nama Barang</th>
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
                            <a class="btnPrint" href='print/trans.analisaperbaikan.php?key=[print_hd.cIdRusak;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a></div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
   						<tr>
                            <td width="14%">Dibuat Oleh </td> 
                            <td width="1%">:</td>
                          </tr>
        
    </div>
   </div>




