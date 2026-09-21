<?php include_once('base.php'); ?>

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
			<label class="col-md-12" >Tipo de envio</label>
			<div class="col-md-12">
				<select name="tipo_envio" class="form-control select2" style="width: 100%;" >
					<option value='todos' <?php if($data->tipo_envio == 'todos'){ echo " selected='' "; } ?> >Enviar para todos</option>
					<option value='individual' <?php if($data->tipo_envio == 'individual'){ echo " selected='' "; } ?> >Selecionar departamento</option>
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

<script>
	$(function () {

		$(".select2").select2();

		$(".my-colorpicker1").colorpicker();
		
	});
</script>