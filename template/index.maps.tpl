<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="list.php?id=[var.grpbrg;noerr;]"></script>
<script type="text/javascript">
//<![CDATA[
var map = null;
function init() {

  var latlng = new google.maps.LatLng(lat[0],lon[0]);
  var myOptions = {
    zoom: 10,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    var bounds = new google.maps.LatLngBounds();
    var len = lat.length;

    var infowindow = new google.maps.InfoWindow({
    });

    var markers = new Array();
    for (var i=0;i<len;i++) {
      var latlng = new google.maps.LatLng(lat[i],lon[i]);
      bounds.extend(latlng);
      var marker = new google.maps.Marker({
        position: latlng,
        map: map,
		draggable:true,
        animation: google.maps.Animation.DROP,
        title: jud[i]
      });

	  markers.push(marker);

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent('<div class="marker-info-win">'+
        '<div class="marker-inner-win"><span class="info-content">'+
        '<h4 class="marker-heading">'+jud[i]+'</h4>'+
        'Detail : '+det[i]+'<br>'+
        'Address : '+addr[i]+
        '</span>'+
        '</div></div>');
          infowindow.open(map, marker);
        }
      })(marker, i));

   }
   map.fitBounds(bounds);
}//]]>
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Peta Inventaris
      <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Peta Inventaris</li>
    </ol>
</section>
<section class="content">
    <form action="index.php?view=peta" method="post" name='petaform'>
    <div class="form-group">
        <label>Group Barang</label>
        <select class="form-control" id="cmbgrpbarang" name="cmbgrpbarang" style="width:350px;" onchange="document.petaform.submit();">
            <option value='[blk_grp.cKdGroupBarang;noerr;block=option]' [onshow; if [var.grpbrg;noerr;]==[blk_grp.cKdGroupBarang;noerr];then 'selected';else '']>[blk_grp.vNmGroupBarang;noerr;block=option]</option>
            <option value='ALL'>SEMUA DATA</option>
        </select>
    </div>
	</form>
    <section id="sidebar">
        <div id="directions_panel"></div>
    </section>
    <section id="main">
        <div id="map_canvas" style="width: 100%; height: 500px;"></div>
    </section>
</section>
