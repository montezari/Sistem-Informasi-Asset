<link rel="stylesheet" type="text/css" href="includes/dhtmlxsuite/dhtmlxgrid/dhtmlxgrid.css">
<link rel="stylesheet" type="text/css" href="includes/dhtmlxsuite/dhtmlxgrid/skins/dhtmlxgrid_dhx_skyblue.css">
<script  src="includes/dhtmlxsuite/dhtmlxgrid/dhtmlxcommon.js"></script>
<script  src="includes/dhtmlxsuite/dhtmlxgrid/dhtmlxgrid.js"></script>        
<script  src="includes/dhtmlxsuite/dhtmlxgrid/dhtmlxgridcell.js"></script>
<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}
</script>
<table width="100%"  border="0" cellpadding="2" cellspacing="1" id="tabel">
<form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid'>
[onload_1; when [var.mode;noerr]==0; block=table]
<div>Jumlah Data : [var.~recordcount;noerr]</div>
<div>Halaman : [var.~page_sequence;noerr]</div>
<br/>
<input name='fkey' id='fkey' type='hidden' size=/>
  <tr bgcolor="#999999">
    <th width="10" >#</th>
    <th bgcolor="#999999">No BBK</th>
    <th bgcolor="#999999">Tgl BBK</th>
    <th bgcolor="#999999">No SO</th>
    <th bgcolor="#999999">Customer</th>
    <th colspan="2">#</th>
  </tr>
  <tr valign="top">
    <td align="center" bgcolor="#D2D2D2">[grid_blk.#; block=tr;noerr] </td>
    <td>[grid_blk.cNoBBK;noerr;block=tr]</td>
    <td>[grid_blk.dTglBBK;noerr;block=tr;frm=dd/mm/yyyy]</td>
    <td>[grid_blk.cNoSo;noerr;block=tr]</td>
    <td>[grid_blk.vNamaRelasi;noerr;block=tr]</td>
    <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cNoBBK;noerr]'">Ubah</a>;else 'Ubah']</td>
    <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cNoBBK;noerr]')">Hapus</a>;else 'Hapus']</td>
  </tr>
  <tr>
    <td colspan="5" bgcolor="#D2D2D2">&nbsp;</td>
    <td colspan="3" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'">Tambah</a>;else 'Tambah']</td>
  </tr>
  <input type="hidden" name="FormAction" value="HAPUS">
  </form>
</table>

<form name="form" method="post" action="?m=[var.~moduleid;noerr]" onSubmit="return validasi();">
[onload_1; when [var.mode;noerr]==1; block=form]
  <table width="100%"  border="0" cellspacing="0" cellpadding="1">
<input name='fkey' id='fkey' type='hidden' value='[grid_blk.cNoBBK;noerr;]' size=/>
  <tr>
    <td width="11%">Unit Key </td>
    <td width="1%">:</td>
    <td width="21%"><input name="edtcKdUnitKey" type="text" id="edtcKdUnitKey" class="text_require" value="[grid_blk.cKdUnitKey;noerr;]" readonly></td>
    <td width="11%">Sales Order </td>
    <td width="1%">:</td>
    <td width="21%"><input name="edtKodeTest32" type="text" id="edtKodeTest32" value="[grid_blk.cNoSo;noerr;]" class="[onshow;if [grid_blk.cNoBBK] == '';then 'text';else 'text_require']" [onshow;if [grid_blk.cNoBBK] == '';then '';else 'readonly']></td>
    <td width="11%">SJ No</td>
    <td width="1%">:</td>
    <td width="22%"><input name="edtNamaTest222" type="text" id="edtNamaTest222" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
  </tr>
  <tr>
    <td>No BBK</td>
    <td>:</td>
    <td><input name="edtKodeTest3" type="text" id="edtKodeTest5" value="[grid_blk.cNoBBK;noerr;]" class="[onshow;if [grid_blk.cNoBBK] == '';then 'text';else 'text_require']" [onshow;if [grid_blk.cNoBBK] == '';then '';else 'readonly']></td>
    <td>Tgl SO </td>
    <td>:</td>
    <td><input name="edtNamaTest23" type="text" id="edtNamaTest23" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
    <td>PO Cust No</td>
    <td>:</td>
    <td><input name="edtNamaTest223" type="text" id="edtNamaTest223" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
  </tr>
  <tr>
    <td>Tgl BBK </td>
    <td>:</td>
    <td><input name="edtdTglBBK" type="text" id="edtdTglBBK" class="text" value="[grid_blk.dTglBBK;noerr;]"></td>
    <td>Nama Supir </td>
    <td>:</td>
    <td><input name="edtNamaTest24" type="text" id="edtNamaTest24" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
    <td>Jenis</td>
    <td>:</td>
    <td><input name="edtNamaTest224" type="text" id="edtNamaTest224" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
  </tr>
  <tr>
    <td>Customer</td>
    <td>:</td>
    <td><input name="edtcKdCustomer" type="text" id="edtcKdCustomer" class="text_require" value="[grid_blk.cKdCustomer;noerr;]" readonly></td>
    <td>No Kendaraan</td>
    <td>:</td>
    <td><input name="edtNamaTest25" type="text" id="edtNamaTest25" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input name="edtvNmCustomer" type="text" id="edtvNmCustomer" class="text_require" value="[grid_blk.vNamaRelasi;noerr;]" readonly></td>
    <td>Ekspedisi</td>
    <td>:</td>
    <td><input name="edtNamaTest26" type="text" id="edtNamaTest26" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Keterangan</td>
    <td>:</td>
    <td><input name="edtvKeterangan" type="text" id="edtvKeterangan" class="text" value="[grid_blk.vKeterangan;noerr;]"></td>
    <td>Berat (Kg) </td>
    <td>:</td>
    <td><input name="edtNamaTest27" type="text" id="edtNamaTest27" class="text" value="[grid_blk.cNamaTest;noerr;]"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Informasi Lainnya </td>
    <td>:</td>
    <td><input name="edtvInformasiLain" type="text" id="edtvInformasiLain" class="text" value="[grid_blk.vInformasiLain;noerr;]"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="9">
<div id="gridbox" style="width:100%;height:175px;overflow:hidden"></div>
<p><a href="javascript:void(0)" onclick="mygrid.addRow((new Date()).valueOf(),[0,'','','',false,'na',false,''],mygrid.getRowIndex(mygrid.getSelectedId()))">Add Item</a>
<a href="javascript:void(0)" onclick="mygrid.deleteSelectedItem()">Delete Item</a></p>
<script>
	mygrid = new dhtmlXGridObject('gridbox');
	mygrid.setImagePath("includes/dhtmlxsuite/dhtmlxgrid/imgs/");
	mygrid.setColumnIds("gudang,kode_barang,nama_barang,prod_key,qty,satuan,tgl_prod,tgl_exp,kode_rack");
	mygrid.setHeader("Gudang,Kode Barang,Nama Barang,Prod Key,Qty,Sat,Tgl Prod,Tgl Exp,Kode Rack");
	mygrid.setInitWidths("75,75,275,150,60,45,75,75,75")
	mygrid.setColAlign("left,left,left,right,center,left,center,center,center")
	mygrid.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed");
	mygrid.setSkin("dhx_skyblue");
	mygrid.setColSorting("str,str,str,str,int,str,date,date,str")
	mygrid.init();
	mygrid.loadXML("data.php?tbl=bbk&id=[grid_blk.Id;noerr;]");
</script>
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="9" align="right">
	  <input name="FormAction" type="submit" id="FormAction" value="Simpan" class="button">
      <input name="btnBatal" type="button" id="btnBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr]';" value="Batal" class="button">
	</td>
    </tr>
</table>
</form>
<script language="javascript">

function validasi(){
  var vkey = document.form.edtKodeTest;
  
  if(vkey.value == ''){
    alert('Kode test harus anda isi');
    vkey.focus();
    return false;
  }
}  
</script>