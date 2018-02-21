<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>Kas</title>
    
    <link rel="icon" href="<?php echo base_url(); ?>/assets/favicon.ico">
    <link rel="shortcut icon" href="<?php echo base_url(); ?>/assets/favicon.ico" type="image/x-icon">

    <link href="<?php echo base_url(); ?>/assets/favicon.png" rel="icon" sizes="192x192" />
    <link href="<?php echo base_url(); ?>/assets/favicon.png" rel="icon" sizes="128x128" />

    <link rel="stylesheet" href="<?php echo base_url('assets/materiallogin/css/reset.css'); ?>">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="<?php echo base_url('assets/materiallogin/css/style.css'); ?>">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  </head>

  <body>


  <div class="pen-title">
    <strong><h1>WAROENG SPESIAL SAMBAL</h1><span><a href='#'>Buku Kas dan Bank</a> <i class='fa fa-code'></i> </span></strong>
  </div>
  <div class="container">
    <div class="card"></div>
    <div class="card">
      <h1 class="title">Login</h1>
      <center>
        <div id="infoMessage"><?php echo $message;?></div>
      </center>


      <?php echo form_open("login");?>

        <?php
          $identity['class'] = 'input-txt';
          $identity['required'] = 'required';

          $password['class'] = 'input-txt';
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
        <div class="input-container">
          <?php echo form_input($identity);?>
          <label for="Username">Username</label>
          <div class="bar"></div>
        </div>
        <div class="input-container">
          <?php echo form_input($password);?>
          <label for="Password">Password</label>
          <div class="bar"></div>
        </div>
        <div class="button-container">
          <button type="submit"><span>Login</span></button>
        </div>
        <div class="footer"><a href="forgot_password" class="lnk"><?php echo lang('login_forgot_password');?></a></div>

      <?php echo form_close();?>

    </div>
    <div class="card alt">
      <div class="toggle"></div>
      <h1 class="title">Register
        <div class="close"></div>
      </h1>
      <form>
        <div class="input-container">
          <input type="text" id="Username" required="required"/>
          <label for="Username">Username</label>
          <div class="bar"></div>
        </div>
        <div class="input-container">
          <input type="password" id="Password" required="required"/>
          <label for="Password">Password</label>
          <div class="bar"></div>
        </div>
        <div class="input-container">
          <input type="password" id="Repeat Password" required="required"/>
          <label for="Repeat Password">Repeat Password</label>
          <div class="bar"></div>
        </div>
        <div class="button-container">
          <button><span>Next</span></button>
        </div>
      </form>
    </div>
  </div>
  <!--
  <a id="portfolio" href="#" title="#"><i class="fa fa-link"></i></a>
  <a id="codepen" href="#" title="#"><i class="fa fa-codepen"></i></a>
  -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script src="<?php echo base_url('assets/materiallogin/js/index.js'); ?>"></script>
  </body>
</html>
