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

							<ul class="nav nav-tabs ">
								
								<li <?php if($aba_selecionada == "dados"){ echo "class='active'"; } ?> >
									<a href="#dados" data-toggle="tab">Dados</a>
								</li>
								<li <?php if($aba_selecionada == "itens"){ echo "class='active'"; } ?> >
									<a href="#itens" data-toggle="tab">Itens</a>
								</li>
								<li <?php if($aba_selecionada == "cores"){ echo "class='active'"; } ?> >
									<a href="#cores" data-toggle="tab">Cores</a>
								</li>

							</ul>

							<div class="tab-content" >

								<div id="dados" <?php if($aba_selecionada == "dados"){ echo "class='tab-pane active'"; } else { echo "class='tab-pane'"; } ?> >

									<form action="<?=$_base['objeto']?>alterar_grv" class="form-horizontal" method="post">

										<fieldset>

											<div class="form-group">
												<label class="col-md-12" >Titulo</label>
												<div class="col-md-6">
													<input name="titulo" type="text" class="form-control" value="<?=$data->titulo?>" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12" >Url amigavel, sem acentos ou espaços, ex: nossos_servicos.</label>
												<div class="col-md-6">
													<input name="chave" type="text" class="form-control" value="<?=$data->chave?>" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12">Status</label>
												<div class="col-md-3">
													<select name="bloqueio" class="form-control select2" style="width: 100%;" >
														<option value="0" <?php if($data->bloqueio == 0){ echo "selected"; } ?> >Ativo</option>
														<option value="1" <?php if($data->bloqueio == 1){ echo "selected"; } ?> >Inativo</option>
													</select>
												</div>
											</div>

											<hr>

											<div class="form-group">
												<label class="col-md-12" >Meta Titulo</label>
												<div class="col-md-6">
													<input name="meta_titulo" type="text" class="form-control" value="<?=$data->meta_titulo?>" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-12" >Meta Descrição</label>
												<div class="col-md-6">
													<textarea name="meta_descricao" class="form-control" style="height:60px;" ><?=$data->meta_descricao?></textarea>
												</div>
											</div>

										</fieldset>

										<div style="margin-top: 15px; margin-left:5px;">
											<button type="submit" class="btn btn-primary">Salvar</button>
											<input type="hidden" name="codigo" value="<?=$data->codigo?>" />

											<?php if( ($data->codigo != 1) AND ($data->fixa != 1) ){ ?>
												<button type="button" class="btn btn-danger" onClick="confirma('<?=$_base['objeto']?>apagar_pagina/codigo/<?=$data->codigo?>');">Remover Página</button>
											<?php } ?>

											<button type="button" class="btn btn-default" onClick="window.location='<?=$_base['objeto']?>';">Voltar</button>
										</div>

									</form>

								</div>

								<div id="itens" <?php if($aba_selecionada == "itens"){ echo "class='tab-pane active'"; } else { echo "class='tab-pane'"; } ?> >

									<form action="<?=$_base['objeto']?>alterar_itens_grv" class="form-horizontal" method="post">

										<div style="padding-bottom:10px; padding-left: 10px;">Você pode habilitar, desabilitar ou arraste para ordenar os itens da página</div>

										<div id="sortable" >
											<?php

											foreach ($itens as $key => $value){

												if($value['ativo'] == 1){
													$selected1 = " selected='' ";
													$selected2 = "";
												} else {
													$selected2 = " selected='' ";
													$selected1 = "";
												}

												if($value['fixo'] == 1){
													$cor_diferente = "background-color:#ddd;";
												} else {
													$cor_diferente = "background-color:#f2f2f2;";
												}

												echo "
												<div id='item_".$value['id']."' style='padding:10px; margin-left:5px; margin-right:5px; margin-top:10px; border:1px solid #ddd; $cor_diferente' >

												<div style='float:left; cursor:grab; width:70%; padding-top:7px; font-size:15px; font-weight:bold;' >".$value['titulo']."</div>

												<div style='float:right; width:20%; padding-bottom:0px; ' > 

												<div style='text-align:center;'>
												<select name='ativo_".$value['codigo']."' class='form-control select2' style='width: 100%;'>
												<option value='1' ".$selected1." >Ativo</option>
												<option value='0' ".$selected2." >Inativo</option>	
												</select>
												</div>

												</div>

												<div style='clear:both;'></div>
												</div>
												";

											}

											?>
										</div>

									</fieldset>

									<div style="margin-top: 15px; margin-left:5px;">
										<button type="submit" class="btn btn-primary">Salvar</button>
										<input type="hidden" name="codigo" value="<?=$data->codigo?>" />

										<button type="button" class="btn btn-default" onClick="window.location='<?=$_base['objeto']?>';">Voltar</button>
									</div>

								</form>
							</div> 


							<div id="cores" <?php if($aba_selecionada == "cores"){ echo "class='tab-pane active'"; } else { echo "class='tab-pane'"; } ?> >
								<form action="<?=$_base['objeto']?>cores_grv" class="form-horizontal" method="post">
									<?php

									$i = 1;
									foreach ($listacores as $key => $value) {	                			 
										
										if(!($i % 2)) { $bg = " style='padding-bottom:15px; background-color:#eee; ' "; } else { $bg = " style='padding-bottom:15px; ' "; } $i++;
										
										echo "
										<div class='row'>
										<div class='col-xs-12' $bg >";

										echo "
										<div style='float:left; width:50%; text-align:center; margin-top:15px;' >
										<input type='text' class='form-control' name='cor_titulo_".$value['id']."' value='".$value['titulo']."' >
										</div>
										<div style='float:left; width:25%; text-align:center; margin-top:15px;' >
										<input type='text' class='form-control my-colorpicker1' name='cor_".$value['id']."' value='".$value['cor']."' >
										</div>
										<div style='clear:both'></div>
										";
										
										echo "
										</div>
										</div>
										";

									}

									?>

									<div style="padding-top:15px;">
										<button type="submit" class="btn btn-primary">Salvar</button>
										<input type="hidden" name="pagina" value="<?=$data->codigo?>">
										<button type="button" class="btn btn-default" onClick="window.location='<?=$_base['objeto']?>';">Voltar</button>
									</div>

								</form>
							</div> 

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

<!-- jQuery 2.2.3 -->
<script src="<?=LAYOUT?>plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<?=LAYOUT?>api/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
<script src="<?=LAYOUT?>bootstrap/js/bootstrap.min.js"></script>
<script src="<?=LAYOUT?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?=LAYOUT?>plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<?=LAYOUT?>plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<?=LAYOUT?>plugins/fastclick/fastclick.js"></script>
<script src="<?=LAYOUT?>plugins/select2/select2.full.min.js"></script>
<script src="<?=LAYOUT?>plugins/iCheck/icheck.min.js"></script>
<script src="<?=LAYOUT?>plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="<?=LAYOUT?>dist/js/app.min.js"></script>
<script src="<?=LAYOUT?>dist/js/demo.js"></script>
<script>function dominio(){ return '<?=DOMINIO?>'; }</script>
<script src="<?=LAYOUT?>js/funcoes.js"></script>
<script>
	$(function () {

		$(".select2").select2();	 	 

		$( "#sortable" ).sortable({
			update: function(event, ui){
				var postData = $(this).sortable('serialize');
				console.log(postData);
				
				$.post('<?=$_base['objeto']?>salvar_ordem', { list: postData, codigo:'<?=$data->codigo?>' }, function(o){
					console.log(o);
				}, 'json');
			}
		});


		$(".my-colorpicker1").colorpicker();
	});
</script>

<script src="<?=LAYOUT?>js/ajuda.js"></script> 
</body>
</html>
