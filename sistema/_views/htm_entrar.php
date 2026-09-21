<?php include_once('base.php'); ?>
<!DOCTYPE html>
<html>
<head>
  
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <title>Entrar - <?=TITULO_VIEW?></title>
  <link rel="icon" href="<?=FAVICON?>" type="image/x-icon" />
  
  <link rel="stylesheet" href="<?=LAYOUT?>bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="<?=LAYOUT?>dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="<?=LAYOUT?>plugins/iCheck/square/blue.css">
  <style type="text/css">
  .login-box .login-box-body{
    background-color: #000000;
    color: #fff;
  }
  .login-logo{
    background-color: #000000;
  }
</style>
  <?php include_once('css.php'); ?>
  
</head>
<body class="hold-transition login-page" style="padding-top:30px;">

  <?php require_once('htm_modal.php'); ?>
  
  <div class="login-box login-box-body" style="padding-top:30px; text-align: center;">
    <div class="login-logo">
      <center><img class="img-responsive" src="<?=$_base['logo']?>"></center>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">Utilize seu email e senha para entrar</p>

      <form action="<?=DOMINIO?>autenticacao/login" method="post">
        <div class="form-group has-feedback">
          <input type="text" class="form-control" placeholder="Usuário" name="usuario">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control" placeholder="Senha" name="senha">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
          <div class="col-xs-8">
            <div><a href="<?=DOMINIO?>recuperar"><span class="btn btn-primary btn-block btn-flat">Esqueci minha senha!</span></a></div>
          </div>
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->

  <script src="<?=LAYOUT?>plugins/jQuery/jquery-2.2.3.min.js"></script>
  <script src="<?=LAYOUT?>bootstrap/js/bootstrap.min.js"></script>
  <script src="<?=LAYOUT?>js/ajuda.js"></script>
</body>
</html>
