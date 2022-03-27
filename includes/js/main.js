function doprintpage() {
  window.print();
}
function SetHandlers(){
	for(var i=0;i<document.forms.length;i++){
		f=document.forms[i];
		for(var j=0;j<f.length;j++){
			c=f[j];
			if(c.type=="text" || c.type=="password"){
				c.onfocus=clearDefault;
				c.onblur=restoreDefault;
			}
		}
	}
}
function restoreDefault(){
	if (!this.value){
		this.value=this.defaultValue;
	}
}
function clearDefault(){
	if (this.value==this.defaultValue){
		this.value="";
	}
}

function addRow(tableID,hdrRow) {
  var table = document.getElementById(tableID);
  var rowCount = table.rows.length;
  var row = table.insertRow(rowCount);
  var colCount = table.rows[hdrRow].cells.length;

  for(var i=0; i<colCount; i++) {
    var newcell	= row.insertCell(i);
	newcell.vAlign = "top";
    newcell.innerHTML = table.rows[hdrRow].cells[i].innerHTML;
    //alert(table.rows[hdrRow].cells[i].innerHTML);
    switch(newcell.childNodes[0].type) {
	  case "text":
	    newcell.childNodes[0].value = "";
	  break;
	  case "checkbox":
	    newcell.childNodes[0].checked = false;
	  break;
	  case "select-one":
	    newcell.childNodes[0].selectedIndex = 0;
	  break;
     }
   }
}

function deleteRow(tableID,hdrRow) {
  try {
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;

    for(var i=0; i<rowCount; i++) {
	  var row = table.rows[i];
	  var chkbox = row.cells[0].childNodes[0];
	  if(null != chkbox && true == chkbox.checked) {
	    if(rowCount <= hdrRow+1) {
		  //alert("anda tidak dapat menghapus semua baris");
		  break;
	    }
	    table.deleteRow(i);
	    rowCount--;
	    i--;
	  }
    }
  }catch(e){
    alert(e);
  }
}

function goUploadFoto(){
  var url = 'upload.php';
  var attr = 'scrollbars=yes,menubar=no,height=180,width=400,resizable=no,toolbar=no,location=no,status=no';
  window.open(url,'_upload',attr);
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function valnumber(){
  if(!((event.keyCode>=48)&&(event.keyCode<=57))){
    event.keyCode=0;
  }
}

function kalenderevent(){
  $(function(){
	$.datepicker.setDefaults($.datepicker.regional['id']);
	$("#kalender-event").datepicker({
	  dateFormat: "dd/mm/yy"
	});
  });
}

/*
function showdetaildokumen(type,id,tinggi="500"){
  var url = 'view.php?type='+type +'&key='+id;
  var attr = 'scrollbars=yes,menubar=no,height='+tinggi+',width=1024,resizable=yes,toolbar=no,location=no,status=no';
  window.open(url,'_popup'+id,attr);
}
*/