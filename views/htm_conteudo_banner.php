<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }

// echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";

echo '
<section style="position:relative;" >

<div id="banner-'.$conteudo_id.'" class="callbacks_container" style="width: 100%; overflow: hidden;">
<ul class="rslides" id="slider_'.$conteudo_id.'">
';

foreach ($conteudo_sessao['lista'] as $key => $value) {

	if($value['link']){
		$endereco = " onClick=\"window.open('".$value['link']."', '_blank');\" ";
	} else {
		$endereco = "";
	}
	
	echo "
	<li ".$endereco." >
	<div class='banner_personal' >
	<img src='".$value['imagem']."' >
	</div>
	</li>
	";
	
}

echo '
</ul>

</div>
<div class="clearfix"></div>

</section>
';