<script language="javascript">
function doApprovalData(val){
  var key = document.grid.fkey;
  
  if(confirm('Approve data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}
$(document).ready(function(){
    $(".info-tooltip").tooltip({placement: 'left'});
});
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
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>No SPA</th>
                            <th>Tgl SPA</th>
                            <th>Proyek</th>
                            <th>Departemen</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.cNoSPA;noerr;block=tr]</td>
                            <td>[grid_blk.dTglSPA;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vNamaProyek;noerr;block=tr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="doApprovalData('[grid_blk.cIdSPA;noerr]')"><span class="glyphicon glyphicon-check info-tooltip" title="Approval SPA"></span></a>;else <span class="glyphicon glyphicon-check"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="APPROVAL">
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        
    </div>
</div>




