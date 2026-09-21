<?php include_once('base.php'); ?>


<div class="nav-tabs-custom">

	<ul class="nav nav-tabs">

		<li class='active' >
			<a href="#dados" data-toggle="tab">Dados</a>
		</li> 
		<li>
			<a href="#fundo" data-toggle="tab">Fundo</a>
		</li>

	</ul>

	<div class="tab-content" >

		<div id="dados" class="tab-pane active" >

			<form action="<?=$_base['objeto']?>grupos_alterar_grv" class="form-horizontal" method="post" >

				<fieldset>

					<div class="form-group">
						<label class="col-md-12" >Titulo</label>
						<div class="col-md-12">
							<input name="titulo" type="text" class="form-control" value="<?=$data->titulo?>" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12" >Mostrar titulo</label>
						<div class="col-md-12">
							<select name="mostrar_titulo" class="form-control select2" style="width: 100%;" >
								<option value='1' <?php if($data->mostrar_titulo == 1){ echo " selected='' "; } ?> >Sim</option>
								<option value='0' <?php if($data->mostrar_titulo == 0){ echo " selected='' "; } ?> >Não</option> 
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12" >Itens por linha</label>
						<div class="col-md-12">
							<select name="itens_por_linha" class="form-control select2" style="width: 100%;" >
								<option value='1' <?php if($data->itens_por_linha == 1){ echo " selected='' "; } ?> >1</option>
								<option value='2' <?php if($data->itens_por_linha == 2){ echo " selected='' "; } ?> >2</option>
								<option value='3' <?php if($data->itens_por_linha == 3){ echo " selected='' "; } ?> >3</option>
								<option value='4' <?php if($data->itens_por_linha == 4){ echo " selected='' "; } ?> >4</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12">Descrição (opcional)</label>
						<div class="col-md-12">
							<textarea class="form-control" name="descricao" rows="5" ><?=$data->descricao?></textarea>
						</div>
					</div>

					<?php

					foreach ($cores as $key => $value) {

						echo "
						<div class='form-group' >
						<label class='col-md-12' >Cor: ".$value['titulo']."</label>
						<div class='col-md-8'>
						<input name='cor_".$value['id']."' type='text' class='form-control my-colorpicker1' value='".$value['cor']."' autocomplete='off' >
						</div>
						</div>
						";

					}
					?>

				</fieldset>

				<button type="submit" class="btn btn-primary">Salvar</button>
				<input name="codigo" type="hidden" value="<?=$data->codigo?>" >
			</form>

		</div>

		<div id="fundo" class="tab-pane" >

			<?php if(!$data->imagem_fundo){ ?>
				<form action="<?=$_base['objeto']?>grupos_imagem_fundo/codigo/<?=$data->codigo?>" method="post" enctype="multipart/form-data">

					<fieldset> 
						<label>Arquivo</label> 
						<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="input-append">
								<div class="uneditable-input">
									<i class="fa fa-file fileupload-exists"></i>
									<span class="fileupload-preview"></span>
								</div>
								<span class="btn btn-default btn-file">
									<span class="fileupload-exists">Alterar</span>
									<span class="fileupload-new">Procurar arquivo</span>
									<input type="file" name="arquivo" />
								</span>
								<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remover</a>
							</div>
						</div>
					</fieldset>

					<div style="text-align:left; padding-top:10px;">
						<button type="submit" class="btn btn-primary">Enviar</button> 
					</div>

				</form>
			<?php } else { ?>

				<div style="text-align:left;">
					<img src="<?=PASTA_CLIENTE?>img_planos/<?=$data->imagem_fundo?>" style="max-width:300px;" >
				</div>

				<div style="text-align:left; padding-top:10px;">
					<button type="button" class="btn btn-primary" onClick="confirma('<?=$_base['objeto']?>grupos_apagar_imagem_fundo/codigo/<?=$data->codigo?>');" >Apagar Imagem</button> 
				</div>

			<?php } ?>

		</div>

	</div>

</div>


<script>
	$(function () {

		$(".select2").select2();

		$(".my-colorpicker1").colorpicker();
		
	});
</script>