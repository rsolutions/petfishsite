<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; } ?>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title>Resultados para <?=$buscatag?> - <?=$data_pagina->meta_titulo?></title>
	<link rel="shortcut icon" href="<?=$_base['favicon'];?>" />

  <meta name="description" content="<?=$data_pagina->meta_descricao?>" />
  <meta property="og:description" content="<?=$data_pagina->meta_descricao?>" />
  <meta name="author" content="<?=AUTOR?>" />
  <meta name="classification" content="Website" />
  <meta name="robots" content="index, follow" />
  <meta name="Indentifier-URL" content="<?=DOMINIO?>" />

  <link href="<?=LAYOUT?>api/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/fontawesome/css/all.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>css/animate.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/hover-master/css/hover-min.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>css/main.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>css/responsiveslides.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/photobox-master/photobox/photobox.css" rel="stylesheet" type="text/css"> 


  <?php include_once('htm_css.php'); ?>
  <?php include_once('htm_css_resp.php'); ?>

  <style type="text/css">
    body {
      background-color:<?=$pagina_cores[1]?>;
    }
  </style>

</head>
<body>

  <?=$_base['analytics']?>

  <?php include_once('htm_modal.php'); ?>

  <?php
  
  foreach ($layout_lista as $key_layout => $value_layout) {

    if($value_layout['tipo'] == 'topo'){
      $conteudo_id = $value_layout['id'];
      $conteudo_sessao = $value_layout['conteudo'];
      include 'htm_conteudo_'.$value_layout['tipo'].'.php';
    }

  }

  ?>
  
  <section class="animate-effect">

    <div class="container">
      <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-12" >

          <div style="font-size:18px; text-align: left; margin-top:50px; padding-bottom: 10px;">Resultados para: <strong><?=$buscatag?></strong></div>

          <hr>
          <div style="margin-top:30px; padding-bottom: 100px; ">
            <?php

            if(count($lista) == 0){

              echo "
              <div style='font-size:14px; color:#666; padding-bottom:100px; text-align:left;' >
              Nenhum resultado encontrado!
              </div>
              ";

            } else {

              foreach ($lista as $key => $value) {

                echo "
                <div style='margin-top:15px;'>
                <a href='".$value['endereco']."' class='link_busca' >
                ".$value['titulo']."
                </a>
                </div>
                ";


              }
            }

            ?>
          </div>

        </div>
        
      </div>      
    </div>

  </section>

  
  <?php

  foreach ($layout_lista as $key_layout => $value_layout) {

    if($value_layout['tipo'] == 'rodape'){
      $conteudo_id = $value_layout['id'];
      $conteudo_sessao = $value_layout['conteudo'];
      include 'htm_conteudo_'.$value_layout['tipo'].'.php';
    }

  }

  ?>

  <script type="text/javascript" src="<?=LAYOUT?>js/jquery-2.2.4.min.js" ></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/jquery-ui.min.js"></script>  
  <script type="text/javascript" >function dominio(){ return '<?=DOMINIO?>'; }</script>
  <script type="text/javascript" src="<?=LAYOUT?>js/funcoes.js"></script>
  <script src='https://www.google.com/recaptcha/api.js'></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/animation.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/responsiveslides.min.js"></script>

  <?php

  foreach ($layout_lista as $key_layout => $value_layout) {

    if($value_layout['tipo'] == 'topo'){      
      $conteudo_id = $value_layout['id'];
      $id_script = '#slider_topo_'.$conteudo_id;
      ?>
      <script>        
        $("<?=$id_script?>").responsiveSlides({
          auto: true,
          pager: false,
          nav: false,
          speed: 500,
          pause: true,
          pauseControls: true,
          namespace: "callbacks",
          before: function () {
            $('.events').append("<li>before event fired.</li>");
          },
          after: function () {
            $('.events').append("<li>after event fired.</li>");
          }
        });

      </script>
      <?php
    }

    // termina lista
  }

  ?>


</body>
</html>