<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }

// echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";
$cores = $conteudo_sessao['cores']['lista'];
$conteudo_config = $conteudo_sessao['data_grupo'];

?>

<section id="section-duvidas-<?=$conteudo_id?>" class="animate-effect" style="padding-top:50px; padding-bottom:80px; background-color: <?=$cores[34]?>; ">
	<div class="container">

		<?php if($conteudo_config->mostrar_titulo == 1){ ?>

			<div class='row' >
				<div class='col-xs-12 col-sm-12 col-md-12' >
					<div>
						<h2 class="titulo_padrao" style="color:<?=$cores[35]?> !important; border-color:<?=$cores[35]?> !important; " ><?=$conteudo_config->titulo?></h2>
						<div class="titulo_padrao_linha" style="color:<?=$cores[35]?>; " ><i class="fas fa-caret-down"></i></div> 
					</div>
				</div>
			</div>

		<?php } ?>
		
		<?php

		$duvidas = $conteudo_sessao['lista'];

		?>

		<div class="row">
			
			<div class="col-sm-4">
				<div style="margin-top: 30px; background-color:<?=$cores['88']?>; padding-left:20px; padding-right: 20px; padding-bottom: 20px; padding-top: 10px; border-radius: 15px 0px 15px 0px;">
					<?php

					$primeira_duvida = '';
					$n_duv = 0;
					foreach ($duvidas as $key => $value) {

						if($n_duv == 0){
							$primeira_duvida = $value['codigo'];
						}

						if($primeira_duvida == $value['codigo']){
							$ativo = "";
						} else {
							$ativo = '';
						}

						echo "
						<a class='duvidas_lista".$ativo."' style='color:".$cores['89']."' onclick=\"duvidas_respostas_".$conteudo_id."('".$value['codigo']."');\" >".$value['pergunta']."</a>
						";

						$n_duv++;
					}

					?>
				</div>
			</div>
			<div class="col-sm-8" style="margin-top: 10px; background-color:<?=$cores['88']?>; padding-left:20px; padding-right: 20px; padding-bottom: 5px; padding-top: 5px; border-radius: 15px 0px 15px 0px;">>
				<div class="duvidas_div" id="duvidas_div-<?=$conteudo_id?>" style="color:<?=$cores['35']?> !important;" >
					 
				</div>
			</div>

		</div>

	</div>
</section>