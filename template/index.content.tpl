<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">

					<div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Status SPA</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tr>
                                            <th width="150">No SPA</th>
                                            <th width="100">Tgl SPA</th>
                                            <th width="100">Tgl HO Terima SPA</th>
                                            <th width="100">Lamanya SPA</th>
                                            <th width="100">Proyek</th>
                                            <th width="200">Departemen</th>
                                            <th width="100">Tgl Approval</th>
                                            <th width="100">Status</th>
                                        </tr>
                                        <tr>
                                            <td><a href="javascript:showdetaildokumen('spa',[data_spa.cIdSPA;noerr;block=tr])">[data_spa.cNoSPA;noerr;block=tr]</a></td>
                                            <td>[data_spa.dTglSPA;frm='dd-mmm-yy';noerr;block=tr]</td>
                                            <td>[data_spa.dTglTerimaSPA;frm='dd-mmm-yy';noerr;block=tr]</td>
                                            <td>[data_spa.lamaspa;noerr;block=tr]</td>
                                            <td>[data_spa.vNamaProyek;noerr;block=tr]</td>
                                            <td>[data_spa.vNmDept;noerr;block=tr]</td>
                                            <td>[data_spa.dTglApproval;frm='dd-mmm-yy';noerr;block=tr]</td>
                                            <td>[data_spa.calert;if [data_spa.calert;noerr]=='alert';then <img src="images/allert_red.gif" height="20" width="40" />;else '' ]</td>
                                        </tr>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>


					<div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Status Kerusakan Asset</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tr>
                                            <th width="150">No Laporan</th>
                                            <th width="100">Tgl Laporan</th>
                                            <th>Proyek</th>
                                            <th width="300">Departemen</th>
                                            <th width="100">Tgl Kirim</th>
                                            <th width="100">Tgl Analisa</th>
                                        </tr>
                                        <tr>
                                            <td><a href="javascript:showdetaildokumen('rusak',[data_rusak.cIdRusak;noerr;block=tr],800)">[data_rusak.cNoRusak;noerr;block=tr]</a></td>
                                            <td>[data_rusak.dTglRusak;frm='dd-mmm-yy';noerr;block=tr]</td>
                                            <td>[data_rusak.vNamaProyek;noerr;block=tr]</td>
                                            <td>[data_rusak.vNmDept;noerr;block=tr]</td>
                                            <td>[data_rusak.dTglKirim;frm='dd/mm/yyyy';noerr;block=tr]</td>
                                            <td>[data_rusak.dTglAnalisa;frm='dd/mm/yyyy';noerr;block=tr]</td>
                                        </tr>
                                  </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>

				<!-- Main content -->

</section><!-- /.content -->
