<link href="js/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<style>
   .login-dialog .modal-dialog {
		width: 1024px;
	}
</style>
<script type="text/javascript" src="js/plugins/jquerycombogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="js/plugins/jquerycombogrid/plugin/jquery.ui.combogrid-1.6.3.js"></script>
<script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
<script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type="text/javascript" src="js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="js/plugins/prettify/run_prettify.js"></script>
<script src="js/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js"></script>
<script src="js/advanced-form/advanced-form.js"></script>
<script language="javascript">
function doexpexcel(){ 
	var _url = "excel.php?export=xlsx&id=report.inventarismutasi";
	window.location = _url;
    //alert(_url);
}
</script>

<script language="javascript">

function doprint(){
  var _tglawal = document.form.tglawal;
  var tglawal = _tglawal.value;

  var _tglakhir = document.form.tglakhir;
  var tglakhir = _tglakhir.value;

  BootstrapDialog.show({
	title : 'Print Preview',
    message: $('<div></div>').load('print/report.inventarismutasi.php?tglawal='+tglawal+'&tglakhir='+tglakhir),
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
<!-- Date dd/mm/yyyy -->
                            <div class="form-group">
                                <label>Tanggal Awal</label>
                                <input type="text" name="tglawal" id="tglawal" value="[var.tglawal;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                            </div><!-- /.form group -->
                            </td>
                          </tr>
                          
                          <tr>
                            <td>
                            <div class="form-group">
                                <label>Tanggal Akhir</label>
                                <input type="text" name="tglakhir" id="tglakhir" value="[var.tglakhirl;frm='dd/mm/yyyy';noerr;]" class="form-control form-control-inline input-medium default-date-picker" style="width:100px;" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                            </div><!-- /.form group -->
                            </td>
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




