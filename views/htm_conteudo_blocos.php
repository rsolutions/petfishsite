<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }

//echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";
$cores = $conteudo_sessao['cores']['lista'];

$fundo_css = "";
if($conteudo_sessao['imagem_fundo']){
	
	$fundo_css = "background-image:url(".PASTA_CLIENTE."img_blocos/".$conteudo_sessao['imagem_fundo']."); ";
	
	if($conteudo_sessao['imagem_fundo_tipo'] == 0){
		
		$fundo_css .= "background-size:cover; background-position:top; background-position:center; background-repeat: no-repeat; ";
		
	} else {
		
		$fundo_css .= "background-size: 100%; background-attachment: fixed; background-repeat: no-repeat; ";
		
	}
}


echo "
<section id='section-blocos-".$conteudo_id."' class=' blocos_sess' style='background-color:".$cores[5]."; $fundo_css ' >

<div class='container'>
<div class='row'>
";

if( $conteudo_sessao['mostrar_titulo'] == 1 ){
	echo "
	<div class='col-xs-12 col-sm-12 col-md-12' >
	<h2 class='titulo_padrao' style='padding-top: 5px; color:".$cores[7]." !important; border-color:".$cores[7]." !important; ' >".$conteudo_sessao['titulo']."</h2>
	<div class='titulo_padrao_linha' style='color:".$cores[7].";'><i class='fas fa-caret-down'></i></div> 
	</div>
	</div>

	<div class='row'>
	";
}

if( ($conteudo_sessao['tipo'] == 0) OR ($conteudo_sessao['tipo'] == 2) ){


	if(!$conteudo_sessao['imagem']){

		if( $conteudo_sessao['mostrar_titulo'] == 2 ){
			echo "
			<div class='col-xs-12 col-sm-12 col-md-12' >
			<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important; '>".$conteudo_sessao['titulo']."</div>
			</div>
			";
		}

		echo "
		<div class='col-xs-12 col-sm-12 col-md-12' >

		<div class='bloco_descricao' style='color:".$cores[6]." !important; '>".$conteudo_sessao['descricao']."</div>
		";

		if($conteudo_sessao['tipo'] == 2){
			echo "
			<div class='bloco_botao_div' style='margin-top:5px; text-align:left;'>
			<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
			</div>
			";
		}

		echo "
		</div>
		";

	} else {

		if($conteudo_sessao['posicao'] == 1){

			echo "
			<div class='col-xs-12 col-sm-6 col-md-6' >

			<div class='bloco_imagem'><a href='".$conteudo_sessao['endereco']."' ><img src='".PASTA_CLIENTE."img_blocos/".$conteudo_sessao['imagem']."'></a></div>

			</div>
			<div class='col-xs-12 col-sm-6 col-md-6' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo' style='color:".$cores[7]." !important; '>".$conteudo_sessao['titulo']."</div>";
			}

			echo "
			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>
			";

			if($conteudo_sessao['tipo'] == 2){
				echo "
				<div class='bloco_botao_div' style='margin-top:20px; text-align:left;'>
				<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
				</div>
				";
			}

			echo "
			</div>
			";

		}

		if($conteudo_sessao['posicao'] == 2){

			echo "
			<div class='col-xs-12 col-sm-6 col-md-6' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>";
			}

			echo "
			";

			if($conteudo_sessao['tipo'] == 2){
				echo "
				<div class='bloco_botao_div' style='margin-top:20px; text-align:left;'>
				<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
				</div>
				";
			}

			echo "
			</div>
			<div class='col-xs-12 col-sm-6 col-md-6' >

			<div class='bloco_imagem'><a href='".$conteudo_sessao['endereco']."' ><img src='".PASTA_CLIENTE."img_blocos/".$conteudo_sessao['imagem']."'></a></div>

			</div>
			";

		}

		if($conteudo_sessao['posicao'] == 3){

			echo "
			<div class='col-xs-12 col-sm-2 col-md-2' ></div>

			<div class='col-xs-12 col-sm-8 col-md-8' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo'  style='padding-top: 20px; text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>";
			}

			echo "
			<div class='bloco_imagem'><a href='".$conteudo_sessao['endereco']."' ><img src='".PASTA_CLIENTE."img_blocos/".$conteudo_sessao['imagem']."'></a></div>

			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>
			";

			if($conteudo_sessao['tipo'] == 2){
				echo "
				<div class='bloco_botao_div' style='margin-top:20px; text-align:left;'>
				<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
				</div>
				";
			}

			echo "
			</div>

			<div class='col-xs-12 col-sm-2 col-md-2' ></div>
			";

		}	

		if($conteudo_sessao['posicao'] == 4){

			echo "
			<div class='col-xs-12 col-sm-2 col-md-2' ></div>

			<div class='col-xs-12 col-sm-8 col-md-8' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo'  style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>";
			}				

			echo "
			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>

			<div class='bloco_imagem'><a href='".$conteudo_sessao['endereco']."' ><img src='".PASTA_CLIENTE."img_blocos/".$conteudo_sessao['imagem']."'></a></div>
			";

			if($conteudo_sessao['tipo'] == 2){
				echo "
				<div class='bloco_botao_div' style='margin-top:20px; text-align:center;'>
				<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
				</div>
				";
			}

			echo "
			</div>

			<div class='col-xs-12 col-sm-2 col-md-2' ></div>
			";

		}

	}


} else {


	if(!$conteudo_sessao['endereco']){


		if( $conteudo_sessao['mostrar_titulo'] == 2 ){
			echo "
			<div class='col-xs-12 col-sm-12 col-md-12' >
			<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>
			</div>
			";
		}

		echo "
		<div class='col-xs-12 col-sm-12 col-md-12' >
		<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>
		</div>
		";

	} else {

		if($conteudo_sessao['posicao'] == 1){

			echo "
			<div class='col-xs-12 col-sm-6 col-md-6' >

			<div class='bloco_botao_div'>
			<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
			</div>

			</div>
			<div class='col-xs-12 col-sm-6 col-md-6' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2 ){
				echo "
				<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>
				";
			}

			echo "
			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>

			</div>
			";

		}

		if($conteudo_sessao['posicao'] == 2){

			echo "
			<div class='col-xs-12 col-sm-6 col-md-6' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>";
			}	

			echo "
			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>

			</div>
			<div class='col-xs-12 col-sm-6 col-md-6' >

			<div class='bloco_botao_div'>
			<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
			</div>

			</div>
			";

		}

		if($conteudo_sessao['posicao'] == 3){

			echo "
			<div class='col-xs-12 col-sm-2 col-md-2' ></div>

			<div class='col-xs-12 col-sm-8 col-md-8' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important; '>".$conteudo_sessao['titulo']."</div>";
			}

			echo "
			<div class='bloco_botao_div'>
			<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
			</div>

			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>

			</div>

			<div class='col-xs-12 col-sm-2 col-md-2' ></div>
			";

		}	

		if($conteudo_sessao['posicao'] == 4){

			echo "
			<div class='col-xs-12 col-sm-2 col-md-2' ></div>

			<div class='col-xs-12 col-sm-8 col-md-8' >
			";

			if( $conteudo_sessao['mostrar_titulo'] == 2){
				echo "<div class='bloco_titulo' style='text-align:left; color:".$cores[7]." !important;  '>".$conteudo_sessao['titulo']."</div>";
			}

			echo "
			<div class='bloco_descricao' style='color:".$cores[6]." !important;' >".$conteudo_sessao['descricao']."</div>

			<div class='bloco_botao_div'>
			<a href='".$conteudo_sessao['endereco']."' class='blocos_botao' style='color:".$cores[9]." !important; background-color:".$cores[8]." !important;' >".$conteudo_sessao['botao_titulo']."</a>
			</div>

			</div>

			<div class='col-xs-12 col-sm-2 col-md-2' ></div>
			";

		}

	}

}

echo "
</div>
</div>			
</section>
";