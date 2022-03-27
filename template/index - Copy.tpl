        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.php" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                <!--Sistem Berkas-->
                <img src="images/logo.png" alt="">
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="label label-warning">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-people info"></i>Notifikasi 1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-warning danger"></i>Notifikasi 2
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users warning"></i>Notifikasi 3
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-cart success"></i>Notifikasi 4
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-person danger"></i>Notifikasi 5
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>[var._SESSION.cNamaLengkap;noerr;]<i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                        Administrator - Kantor Pusat
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="?m=admin.auth&logout=1" class="btn btn-default btn-flat">Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active" style="margin-top:5px;">
                            <a href="index.php">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-laptop"></i>
                                <span>Master Data</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                              <li><a href="?m=master.proyek"><i class="fa fa-angle-double-right"></i>Proyek</a></li>
                              <li><a href="?m=master.dept"><i class="fa fa-angle-double-right"></i>Departemen</a></li>
                              <li><a href="?m=master.pegawai"><i class="fa fa-angle-double-right"></i>Pegawai</a></li>
                              <li><a href="?m=master.jenisdok"><i class="fa fa-angle-double-right"></i>Jenis Dokumen</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-edit"></i> <span>Transaction</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                              <li><a href="?m=trans.dokumen"><i class="fa fa-angle-double-right"></i>Pengiriman Dokumen</a></li>
                              <li><a href="?m=trans.terimadok"><i class="fa fa-angle-double-right"></i>Penerimaan Dokumen</a></li>
                              <li><a href="?m=trans.status"><i class="fa fa-angle-double-right"></i>Status Dokumen</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-bar-chart-o"></i> <span>Report</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-angle-double-right"></i>Laporan I</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i>Laporan II</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
			[var.~content;noerr]
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        <!-- add new calendar event modal -->
        
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!--
<script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<script src="js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
<script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

<script src="js/AdminLTE/app.js" type="text/javascript"></script>
<script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>     
-->
<script src="js/AdminLTE/app.js" type="text/javascript"></script>
<script src="js/AdminLTE/demo.js" type="text/javascript"></script>