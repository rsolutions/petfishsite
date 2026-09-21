<?php include_once('base.php'); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" href="<?=FAVICON?>" type="image/x-icon" />
	<title><?=$_titulo?> - <?=TITULO_VIEW?></title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="stylesheet" href="<?=LAYOUT?>bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<link rel="stylesheet" href="<?=LAYOUT?>plugins/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="<?=LAYOUT?>dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<?=LAYOUT?>dist/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="<?=LAYOUT?>plugins/select2/select2.min.css">
	<link rel="stylesheet" href="<?=LAYOUT?>plugins/iCheck/square/blue.css">	
	<link rel="stylesheet" href="<?=LAYOUT?>api/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<link rel="stylesheet" href="<?=LAYOUT?>plugins/colorpicker/bootstrap-colorpicker.min.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<?php include_once('css.php'); ?>

</head>
<body class="hold-transition skin-blue <?php if($_base['menu_fechado'] == 1){ echo "sidebar-collapse"; } ?> sidebar-mini">
	<div class="wrapper">

		<?php require_once('htm_modal.php'); ?>

		<?php require_once('htm_topo.php'); ?>

		<?php require_once('htm_menu.php'); ?>

		<div class="content-wrapper">

			<section class="content-header">
				<h1>
					<?=$_titulo?>
					<small><?=$_subtitulo?></small>
				</h1> 
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">        	
					<div class="col-xs-12">


						<div class="nav-tabs-custom">

							<ul class="nav nav-tabs">

								<li class='active' >
									<a href="#dados" data-toggle="tab">Dados</a>
								</li>
								
							</ul>

							<div class="tab-content" >

								<div id="dados" class="tab-pane active" >
									<form action="<?=$_base['objeto']?>alterar_grv" class="form-horizontal" method="post">  					
										<fieldset>

											<div class="row"> 
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-md-12" >Titulo</label>
														<div class="col-md-12">
															<input name="titulo" type="text" class="form-control" value="<?=$data->titulo?>" >
														</div>
													</div>
												</div>

												<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-12">Mostrar titulo</label>
														<div class="col-md-12">
															<select name="mostrar_titulo" class="form-control select2" style="width: 100%;" >
																<option value='0' <?php if($data->mostrar_titulo == 0){ echo " selected='' "; } ?> >Não</option>
																<option value='1' <?php if($data->mostrar_titulo == 1){ echo " selected='' "; } ?> >Sim</option>
															</select>
														</div>
													</div>
												</div>

												<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-12">Tela inteira</label>
														<div class="col-md-12">
															<select name="enquadramento" class="form-control select2" style="width: 100%;" >
																<option value='0' <?php if($data->enquadramento == 0){ echo " selected='' "; } ?> >Sim</option>
																<option value='1' <?php if($data->enquadramento == 1){ echo " selected='' "; } ?> >Não</option>
															</select>
														</div>
													</div>
												</div>
												
											</div>

											<div class="row"> 

												<?php											
												foreach ($cores as $key => $value) {
													
													echo "
													<div class='col-md-6' >
													<div class='form-group' >
													<label class='col-md-12' >Cor: ".$value['titulo']."</label>
													<div class='col-md-12'>
													<input name='cor_".$value['id']."' type='text' class='form-control my-colorpicker1' value='".$value['cor']."' autocomplete='off' >
													</div>
													</div>
													</div>
													";

												}
												?>
												
											</div>
											
											<div class="form-group">
												<label class="col-md-12">Conteúdo</label>
												<div class="col-md-12">
													<textarea class="form-control" id="descricao" name="descricao" rows="10" ><?=htmlspecialchars_decode(base64_decode($data->conteudo));?></textarea>
												</div>
											</div>
											
										</fieldset>
										
										<div>
											<button type="submit" class="btn btn-primary">Salvar</button>
											<input type="hidden" name="codigo" value="<?=$data->codigo?>" >
											<input type="hidden" name="id" value="<?=$data->id?>" >
											<button type="button" class="btn btn-default" onClick="window.location='<?=$_base['objeto']?>inicial';" >Voltar</button>
										</div>
										
									</form>
								</div>
								
							</div>

						</div>
					</div>
					<!-- /.row -->
				</section>
				<!-- /.content -->

			</div>
			<!-- /.content-wrapper -->
			<?php require_once('htm_rodape.php'); ?>

		</div>
		<!-- ./wrapper -->

		<script src="<?=LAYOUT?>plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="<?=LAYOUT?>api/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
		<script src="<?=LAYOUT?>bootstrap/js/bootstrap.min.js"></script>
		<script src="<?=LAYOUT?>plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="<?=LAYOUT?>plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="<?=LAYOUT?>plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="<?=LAYOUT?>plugins/fastclick/fastclick.js"></script>
		<script src="<?=LAYOUT?>plugins/select2/select2.full.min.js"></script>
		<script src="<?=LAYOUT?>plugins/iCheck/icheck.min.js"></script>	 
		<script src="<?=LAYOUT?>dist/js/app.min.js"></script>
		<script src="<?=LAYOUT?>dist/js/demo.js"></script>
		<script src="<?=LAYOUT?>ckeditor412/ckeditor.js"></script>		
		<script src="<?=LAYOUT?>plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script src="<?=LAYOUT?>api/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		<script>

			$(document).ready(function() {

				$(".select2").select2();

				$(".my-colorpicker1").colorpicker();

			}); 

		</script>


		<script>function dominio(){ return '<?=DOMINIO?>'; }</script>
		<script src="<?=LAYOUT?>js/funcoes.js"></script>
		<script src="<?=LAYOUT?>js/ajuda.js"></script> 

	</body>
	</html>