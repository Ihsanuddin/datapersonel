<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title ?></title>
    <link rel="icon" href="<?php echo base_url(); ?>/assets/favicon.ico">
    <link rel="shortcut icon" href="<?php echo base_url(); ?>/assets/favicon.ico" type="image/x-icon">

    <link href="<?php echo base_url(); ?>/assets/favicon.png" rel="icon" sizes="192x192" />
    <link href="<?php echo base_url(); ?>/assets/favicon.png" rel="icon" sizes="128x128" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <!--
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <!--
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    -->
    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/plugins/datatables/dataTables.bootstrap.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/plugins/select2/dist/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/dist/css/skins/_all-skins.min.css">

    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/customized/style.css">

    <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/customized/bootstrap-horizon.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.1.4 -->
    <script src="<?php echo base_url()?>assets/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/bootstrap-sweetalert/lib/sweet-alert.min.css">

    <script src="<?php echo base_url()?>assets/template/lte2/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!--Table Fixed-->
    <script src="<?php echo base_url(); ?>/assets/template/lte2/plugins/fixedtabel/tableHeadFixer.js"></script>
    <!--Date Time-->
    <script src="<?php echo base_url()?>assets/template/lte2/customized/date_time.js"></script>

    <!-- Custim JS -->
    <script src="<?php echo base_url()?>assets/template/lte2/customized/javascript.js"></script>

    <!-- HTML To Excel -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/htmlexcel/jquery.table2excel.min.js"></script>

    <!-- Jquery Mask -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/mask/dist/jquery.mask.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/template/lte2/datepicker/jquery.datetimepicker.min.css'); ?>" />
    <script type="text/javascript" src="<?php echo base_url('assets/template/lte2/datepicker/jquery.datetimepicker.js'); ?>"></script>

    <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/template/lte2/plugins/bootstrap-select/bootstrap-select.css'); ?>" />

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  </head>
  <body class="hold-transition skin-red layout-top-nav">
    <div class="wrapper fixed">

      <?php $this->load->view('template/lte2top/header'); ?>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <div class="container">
          <!-- Content Header (Page header) -->
          <?php $this->load->view('template/lte2top/content-header'); ?>

          <!-- Main content -->
          <?php $this->load->view($module.'/'.$page); ?>
          <!-- <div id="snackbar" class="show">Info: <br>"inv.finance-wss.com"<br> Akan berpindah ke - <br> <a style="background-color: #FDFDFD" href="https://is.pedasabis.com/">is.pedasabis.com</a></div> -->
        </div>

      </div><!-- /.content-wrapper -->
      <?php $this->load->view('template/lte2top/footer'); ?>
    </div><!-- ./wrapper -->

    <!-- Bootstrap 3.3.5 -->
    <script src="<?php echo base_url()?>assets/template/lte2/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- <script src="https://cdn.datatables.net/fixedcolumns/3.2.2/js/dataTables.fixedColumns.min.js"></script> -->

    <!-- SlimScroll -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo base_url()?>assets/template/lte2/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?php echo base_url()?>assets/template/lte2/dist/js/demo.js"></script>
    <!-- Select2 -->
    <script src="<?php echo base_url()?>assets/template/lte2/plugins/select2/dist/js/select2.full.min.js"></script>

    <script src="<?php echo base_url()?>assets/template/lte2/plugins/bootstrap-select/bootstrap-select.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/template/lte2/plugins/responsivedatatables/css/dataTables.responsive.css">
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>assets/template/lte2/plugins/responsivedatatables/js/dataTables.responsive.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/template/lte2/plugins/toastr/toastr.css">
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>assets/template/lte2/plugins/toastr/toastr.js"></script>
    <!-- page script -->
    <script>
      $(function () {
        $("#example1").DataTable({
          // "ordering": false
        });
        $('#example2').DataTable({
          "paging": false,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": false,
          "autoWidth": false
        });

        //Initialize Select2 Elements
        $sel = $(".select2").select2();
        $sel2 = $(".select2-area").select2();
      });

      function toastr_gagal(title, msg) {
        toastr.options = {
          "closeButton": true,
          "debug": false,
          "newestOnTop": true,
          "progressBar": true,
          "positionClass": "toast-top-right",
          "preventDuplicates": false,
          "onclick": null,
          "showDuration": "300",
          "hideDuration": "1000",
          "timeOut": "2500",
          "extendedTimeOut": "100",
          "showEasing": "swing",
          "hideEasing": "linear",
          "showMethod": "fadeIn",
          "hideMethod": "fadeOut"
        }

        return toastr['error'](msg, title); // 'Error!', 'Data gagal disimpan!'
      }

      function toastr_pringatan(title, msg) {
        toastr.options = {
          "closeButton": true,
          "debug": false,
          "newestOnTop": true,
          "progressBar": true,
          "positionClass": "toast-top-right",
          "preventDuplicates": false,
          "onclick": null,
          "showDuration": "300",
          "hideDuration": "1000",
          "timeOut": "2500",
          "extendedTimeOut": "100",
          "showEasing": "swing",
          "hideEasing": "linear",
          "showMethod": "fadeIn",
          "hideMethod": "fadeOut"
        }

        return toastr['warning'](msg, title); // 'Error!', 'Data gagal disimpan!'
      }

      function toastr_sukses(title, msg) {
        toastr.options = {
          "closeButton": true,
          "debug": false,
          "newestOnTop": true,
          "progressBar": true,
          "positionClass": "toast-top-right",
          "preventDuplicates": false,
          "onclick": null,
          "showDuration": "300",
          "hideDuration": "1000",
          "timeOut": "2500",
          "extendedTimeOut": "100",
          "showEasing": "swing",
          "hideEasing": "linear",
          "showMethod": "fadeIn",
          "hideMethod": "fadeOut"
        }

        return toastr['success'](msg, title); // 'Sukses!', 'Data berhasil disimpan!', 'Sukses!', 'Data berhasil dihapus!'
      }

      Highcharts.setOptions({
        lang: {
          numericSymbols: [ "K" , "JT" , "M" , "T" , "P" , "E"]
        }
      });
    </script>
  </body>
</html>
