<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }



//echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";

$cores = $conteudo_sessao['cores']['lista'];

$conteudo_config = $conteudo_sessao['data_grupo'];



$imagem_fundo_sessao = "";

if($conteudo_config->imagem_fundo){

	$imagem_fundo = "background-image:url(".PASTA_CLIENTE."img_planos/".$conteudo_config->imagem_fundo."); background-size:cover; background-position:center;";	

}

?>



<section id="section-planos-<?=$conteudo_id?>" class="" style="padding-top:20px; padding-bottom:40px; background-color: <?=$cores[44]?>; <?=$imagem_fundo?> ">

	<div class="container">



		<?php if($conteudo_config->mostrar_titulo == 1){ ?>



			<div class='row' >

				<div class='col-xs-12 col-sm-12 col-md-12' >

					<div>

						<h2 class="titulo_padrao" style="color:<?=$cores[45]?> !important; border-color:<?=$cores[45]?> !important; " ><?=$conteudo_config->titulo?></h2>

						

					</div>

				</div>

			</div>



		<?php } ?>



		<?php if($conteudo_config->descricao){ ?>



			<div class='row' >

				<div class='col-xs-12 col-sm-12 col-md-12' >

					<div style="margin-top:-10px; padding-bottom:20px; font-size: 18px; color:<?=$cores[45]?>; text-align: center;">

						<?=$conteudo_config->descricao?>

					</div>

				</div>

			</div>



		<?php } ?>



		<?php



		$planos_lista = $conteudo_sessao['lista'];



		$n_row = 1;

		foreach ($planos_lista as $key => $value) {



			if($n_row == 1){ echo "<div class='row' >"; }


			if($conteudo_config->itens_por_linha == 1){

				echo "<div class='col-xs-12 col-sm-12 col-md-12' >";

			}



			if($conteudo_config->itens_por_linha == 2){

				echo "<div class='col-xs-12 col-sm-6 col-md-6' >";

			}

			if($conteudo_config->itens_por_linha == 3){

				echo "<div class='col-xs-12 col-sm-4 col-md-4' >";

			}

			if($conteudo_config->itens_por_linha == 4){

				echo "<div class='col-xs-12 col-sm-3 col-md-3' >";

			}



			$imagem_fundo = "";

			if($value['imagem_fundo']){

				$imagem_fundo = "background-image:url(".PASTA_CLIENTE."img_planos/".$value['imagem_fundo']."); background-size:cover; background-position:center;";

			}

			

			echo "

			<div class='planos_div hvr-float-shadow' style='background-color:".$cores['80']."; ".$imagem_fundo."'  >

			";



			if($value['icone']){

				echo "<div class='planos_icone' style='color:".$cores['129']."; ' >".$value['icone']."</div>";

			}



			if($value['imagem']){

				echo "<div class='planos_imagem' ><img src='".PASTA_CLIENTE."img_planos/".$value['imagem']."' ></div>";

			}



			echo "

			<div class='planos_titulo' style='color:".$cores['81']."; ' >".$value['titulo']."</div>

			<div class='planos_descricao' style='color:".$cores['130']."; ' >".$value['descricao']."</div>

			<div class='planos_valor' style='color:".$cores['82']."; line-height:24px; ' ><span style='color:".$cores['130']."; font-size:13px; font-weight:normal; ' >POR APENAS: </span><br><span style='font-size:14px;'>R$</span> ".$value['valor']."</div>



			<hr> 



			<ul class='planos_itens'>	

			";



			foreach ($value['itens'] as $key2 => $value2) {



				if($value2['tipo'] == 1){

					$ico = "<i class='fa fa-toggle-on'></i>";

					$cor = $cores[76];

					} else {

						$ico = "<i class='fa fa-toggle-off'></i>";				

						$cor = $cores[77];

					}



					echo "

					<li style='color:".$cor." !important;' ><span>$ico</span> ".$value2['titulo']."</li>						

					";



				}



				echo "

				</ul>



				<hr>

				<div class='col-md-6' >

				<a class='pull-left planos_botao hvr-pulse' style='background-color:".$cores[78]."; color:".$cores[79].";' href='".$value['enderecolink']."' target='_blank' >COMPRAR AGORA</a>

				<a class='pull-right hidden-md hidden-sm hidden-lg hidden-xl planos_botao hvr-pulse' style='background-color:".$cores[78]."; color:".$cores[79].";' href='".$value['endereco']."' target='_blank' >DEMONSTRAÇÃO</a>
				</div>


				<div class='hidden-xs col-md-6' >

				<a class='pull-right planos_botao hvr-pulse' style='background-color:".$cores[78]."; color:".$cores[79].";' href='".$value['endereco']."' target='_blank' >DEMONSTRAÇÃO</a>
				</div>



				</div>

				</div>

				";





				if($n_row == $conteudo_config->itens_por_linha){ echo "</div>"; $n_row = 1; } else { $n_row++; }



			}

			if($n_row != 1){ echo "</div>"; }



			?>



			</div>

			</section>