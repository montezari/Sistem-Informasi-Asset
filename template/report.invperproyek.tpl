<link href="js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<style>
   .login-dialog .modal-dialog {
		width: 1024px;
	}
</style>
<script src="js/plugins/prettify/run_prettify.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>

<script language="javascript">
function doexpexcel(){ 
	var _url = "excel.php?export=xlsx&id=report.invperproyek";
	window.location = _url;
    //alert(_url);
}
</script>

<script language="javascript">

function doprint(){
  var _proy = document.form.cmbproyek;
  var proy = _proy.options[_proy.selectedIndex].value;
  var _dept = document.form.cmbdept;
  var dept = _dept.options[_dept.selectedIndex].value;


  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/report.invperproyek.php?proy='+proy+'&dept='+dept),
	cssClass: 'login-dialog',
  });
}

</script>
<div class="row">
    <div class="col-xs-12">
		<div class="col-md">
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                        <!-- text input -->
                        <table width="100%" border="0">
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Proyek</label>
                                <select class="form-control" id="cmbproyek" name="cmbproyek" style="width:450px;">
                                  <option value=''>ALL</option>
                                  <option value='[blk_proy.cIdProyek;noerr;block=option]' [onshow; if [grid_blk.cIdProyek;noerr]==[blk_proy.cIdProyek;noerr];then 'selected';else '']>[blk_proy.vNamaProyek;noerr;block=option]</option>
                                </select>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Departemen</label>
                                <select class="form-control" id="cmbdept" name="cmbdept" style="width:300px;">
                                  <option value=''>ALL</option>
                                  <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                                </select>
                            </div>                                        
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                        </table>

                        <div class="box-footer">
                          <button type="button" id="FormPrint" name="FormPrint" onclick="doprint();" value="Batal" class="btn btn-primary">Preview Data</button>
                          <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn btn-success">Export Excel</button>
                      </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>




