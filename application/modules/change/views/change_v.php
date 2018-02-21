<!DOCTYPE html>
<html>
<head>
  <title><?php echo $title; ?></title>

  <link rel="stylesheet" href="<?php echo base_url()?>assets/template/lte2/bootstrap/css/bootstrap.min.css">
  <style type="text/css">
    body{background: #eee;}
    html,body{
        position: relative;
        height: 100%;
    }

    .login-container{
        position: relative;
        width: 500px;
        margin: 80px auto;
        padding: 20px 40px 40px;
        text-align: center;
        background: #fff;
        border: 1px solid #ccc;
    }

    .login-container::before,.login-container::after{
        content: "";
        position: absolute;
        width: 100%;height: 100%;
        top: 3.5px;left: 0;
        background: #fff;
        z-index: -1;
        -webkit-transform: rotateZ(4deg);
        -moz-transform: rotateZ(4deg);
        -ms-transform: rotateZ(4deg);
        border: 1px solid #ccc;

    }

    .login-container::after{
        top: 5px;
        z-index: -2;
        -webkit-transform: rotateZ(-2deg);
         -moz-transform: rotateZ(-2deg);
          -ms-transform: rotateZ(-2deg);

    }

    .avatar{
        width: 100px;height: 100px;
        margin: 10px auto 30px;
        background-size: cover;
    }

    .form-box input[class="cs"]{
        width: 100%;
        padding: 10px;
        text-align: center;
        height:40px;
        border: 1px solid #ccc;;
        background: #fafafa;
        transition:0.2s ease-in-out;

    }

    .form-box input[class="cs"]:focus{
        outline: 0;
        background: #eee;
    }

    .form-box input[class="cs"]{
        border-radius: 5px 5px 5px 5px;
        
    }

    .form-box select[class="cs"]{
        width: 100%;
        padding: 10px;
        text-align: center;
        height:40px;
        border: 1px solid #ccc;;
        background: #fafafa;
        transition:0.2s ease-in-out;

    }

    .form-box select[class="cs"]:focus{
        outline: 0;
        background: #eee;
    }

    .form-box select[class="cs"]{
        border-radius: 5px 5px 5px 5px;
        
    }

    .form-box input.login{
        margin-top:15px;
        padding: 10px 20px;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="login-container">
        
        <?php if ($this->session->flashdata('message')): ?>
        <div class="alert alert-danger alert-dismissible bts-bwh" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <center><?php echo $this->session->flashdata('message');?></center>
        </div>
      <?php endif ?>

        
        <img class="avatar" src="<?php echo base_url()?>assets/img/lain/lock.png">
       
        <div class="form-box">
        <div class="alert alert-danger alert-dismissible bts-bwh" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <center>Maaf! Anda tidak memiliki hak mengakses waroeng ini! <br/> Silahkan pilih waroeng terlebih dahulu.</center>
        </div>
			<form action="<?php echo base_url('change/process_ubah'); ?>" method="POST">
				<select class="cs" name="outlet">
					<option value="">-- PILIH WAROENG --</option>
					<?php foreach ($get_uo as $key => $value): ?>
						<option value="<?php echo $value->outletID; ?>"><?php echo $value->outletName; ?></option>
					<?php endforeach ?>
				</select>
				<br/>
				<br/>
				<input type="submit" class="btn btn-primary btn-block login" value="Ubah">
			</form>
			<a href="<?php echo base_url('logout') ?>" class="btn btn-danger btn-block login">Logout</a>
        </div>
    </div>
</div>
</body>
</html>