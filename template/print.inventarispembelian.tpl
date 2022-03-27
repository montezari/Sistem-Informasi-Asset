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
        <div class="box">
            <div class="box-body table-responsive">
             <form name="print" id="print">
                <table id="example2" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th font size="5" colspan="5"><div align="center">LAPORAN PEMBELIAN INVENTARIS</div></th>
                        </tr>
                        <tr>
                            <th>#</th>
                            <th>Supplier</th>
                            <th>Nama Barang</th>
                            <th>Proyek</th>
                            <th>Jumlah Asset</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td height="21">[print_blk.#; block=tr;noerr]</td>
                            <td>[print_blk.vNmSupplier;noerr;block=tr]</td>
                            <td>[print_blk.vNmBarang;noerr;block=tr]</td>
                            <td>[print_blk.cKdProyek;noerr;block=tr]</td>
                            <td>[print_blk.nqty;noerr;block=tr]</td>
                        </tr>
                    </tbody>
                </table>
              <div class="box-footer">
                    <a class="btnPrint" href='print/report.inventarispembelian.php?tglawal=[var.tglawal;noerr;]&tglakhir=[var.tglakhir;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
              </div>
              </form>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    
    </div>
</div>



