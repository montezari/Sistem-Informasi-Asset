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
                            <th font size="5" colspan="5"><div align="center">LAPORAN SEBARAN INVENTARIS</div></th>
                        </tr>
                        <tr>
                            <th>#</th>
                            <th>No. Inventaris</th>
                            <th>Nama Barang</th>
                            <th>Lokasi Inventaris</th>
                            <th>Jumlah Inventaris</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[print_blk.#; block=tr;noerr]</td>
                            <td>[print_blk.ckdasset;noerr;block=tr]</td>
                            <td>[print_blk.vnmbarang;noerr;block=tr]</td>
                            <td>[print_blk.vnamaproyek;noerr;block=tr]</td>
                            <td>[print_blk.jumlah;noerr;block=tr]</td>
                        </tr>
                    </tbody>
                </table>
              <div class="box-footer">
                    <a class="btnPrint" href='print/report.invsebaran.php?proy=[var.cIdProyek;noerr;]&dept=[var.deptid;noerr;]'><span class="glyphicon glyphicon-print info-tooltip" title="Print"></span></a>
              </div>
              </form>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    
    </div>
</div>



