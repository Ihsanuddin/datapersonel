<!DOCTYPE html>
<html lang="en">
  <!--================================================================================
	Item Name: Materialize - Material Design Admin Template
	Version: 4.0
	Author: PIXINVENT
	Author URL: https://themeforest.net/user/pixinvent/portfolio
================================================================================ -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title>Login Page | Personel</title>
    <!-- Favicons-->
    <link rel="icon" href="<?php echo base_url(); ?>/assets/template/materialize/images/favicon/favicon-32x32.png" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="<?php echo base_url(); ?>/assets/template/materialize/images/favicon/apple-touch-icon-152x152.png">
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4">
    <meta name="msapplication-TileImage" content="<?php echo base_url(); ?>/assets/template/materialize/images/favicon/mstile-144x144.png">
    <!-- For Windows Phone -->
    <!-- CORE CSS-->
    <link href="<?php echo base_url(); ?>/assets/template/materialize/css/themes/fixed-menu/materialize.css" type="text/css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>/assets/template/materialize/css/themes/fixed-menu/style.css" type="text/css" rel="stylesheet">
    <!-- Custome CSS-->
    <link href="<?php echo base_url(); ?>/assets/template/materialize/css/custom/custom.css" type="text/css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>/assets/template/materialize/css/layouts/page-center.css" type="text/css" rel="stylesheet">
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="<?php echo base_url(); ?>/assets/template/materialize/vendors/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet">
  </head>
  <body class="cyan">
    <!-- Start Page Loading -->
    <div id="loader-wrapper">
      <div id="loader"></div>
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
    </div>
    <!-- End Page Loading -->
    <div id="login-page" class="row">
      <div class="col s12 z-depth-4 card-panel">
        <!-- <form class="login-form"> -->
          <?php $attributes = array('class' => 'login-form', 'id' => 'myform'); ?>
          <?php echo form_open("login",$attributes);?>

          <?php
            // $identity['class'] = 'input-txt';
            $identity['required'] = 'required';

            // $password['class'] = 'input-txt';
            $password['required'] = 'required';

            switch ($_SERVER['HTTP_HOST']) {
              case 'localhost':
                $identity['value'] = '';
                $password['value'] = '';
                break;

              default:
                $identity['value'] = '';
                $password['value'] = '';
                break;
            }

          ?>
          <div class="row">
            <div class="input-field col s12 center">
              <img src="<?php echo base_url(); ?>/assets/template/materialize/images/logo/login-logo.png" alt="" class="circle responsive-img valign profile-image-login">
              <p class="center login-form-text">Data Personel<br> Waroeng Spesial Sambal 'SS'</p>
            </div>
          </div>
          <?php if(!empty($message)): ?>
          <div class="row">
            <div id="card-alert" class="card red lighten-5">
              <div class="card-content red-text">
                <p>Username atau password tidak valid.</p>
              </div>
              <button type="button" class="close red-text" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
          </div>
          <?php endif ?>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix pt-5">person_outline</i>
              <!-- <input id="username" type="text"> -->
              <?php echo form_input($identity);?>
              <label for="identity" class="center-align">Username</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix pt-5">lock_outline</i>
              <!-- <input id="password" type="password"> -->
              <?php echo form_input($password);?>
              <label for="password">Password</label>
            </div>
          </div>
          <div class="row">
            <div class="col s12 m12 l12 ml-2 mt-3">
              <input type="checkbox" id="remember-me" name="remember" />
              <label for="remember-me">Remember me</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <button type="submit" class="btn waves-effect waves-light col s12">Login</button>
            </div>
          </div>
          
          <div class="row">
            <div class="input-field col s6 m6 l6">
              <p class="margin medium-small"><a href="page-register.html">Register Now!</a></p>
            </div>
            <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="page-forgot-password.html">Forgot password ?</a></p>
            </div>
          </div>
        <!-- </form> -->
        <?php echo form_close();?>
      </div>
    </div>
    <!-- ================================================
    Scripts
    ================================================ -->
    <!-- jQuery Library -->
    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/template/materialize/vendors/jquery-3.2.1.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/template/materialize/js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/template/materialize/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/template/materialize/js/plugins.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/template/materialize/js/custom-script.js"></script>
  </body>
</html>