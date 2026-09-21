<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; } ?>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title><?=$data->titulo?> - <?=$data_pagina->meta_titulo?></title>
	<link rel="shortcut icon" href="<?=$_base['favicon'];?>" />

  <meta name="description" content="<?=$data->previa?>" />
  <meta name="author" content="<?=AUTOR?>" />
  <meta name="classification" content="Website" />
  <meta name="robots" content="index, follow" />
  <meta name="Indentifier-URL" content="<?=$endereco_noticia_sem_ssl?>" />

  <meta property="og:locale" content="pt_BR" />
  <meta property="og:type" content="article" />
  <meta property="og:title" content="<?=$data->titulo?> - <?=$data_pagina->meta_titulo?>" />
  <meta property="og:description" content="<?=$data->previa?>" />
  <meta property="og:url" content="<?=$endereco_noticia_sem_ssl?>" />
  <meta property="og:site_name" content="<?=$_base['titulo_pagina']?>" />

  <meta property="article:tag" content="destaque" />
  <meta property="article:published_time" content="<?=date('c', $data->data);?>" />
  <meta property="article:modified_time" content="<?=date('c', $data->data);?>" />
  <meta property="og:updated_time" content="<?=date('c', $data->data);?>" />  
  <meta property="og:image" content="<?=$imagem_principal_sem_ssl?>" />
  <meta property="og:image:secure_url" content="<?=$imagem_principal_sem_ssl?>" />
  <meta property="og:image:width" content="<?=$imagem_principal_largura?>" />
  <meta property="og:image:height" content="<?=$imagem_principal_altura?>" />
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:description" content="<?=$data->previa?>" />
  <meta name="twitter:title" content="<?=$data->titulo?> - <?=$data_pagina->meta_titulo?>" />
  <meta name="twitter:image" content="<?=$imagem_principal_sem_ssl?>" />

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

        <div class="col-xs-12 col-sm-8 col-md-8" >

          <div style="padding-top: 35px;">

            <h2 class='blog_lista_titulo' >
              <a href='#' class='blog_lista_titulo' ><?=$data->titulo?></a>
            </h2>

            <ul class='blog_lista_meta' >

              <li><i class='far fa-calendar-alt' ></i> <?=$dia?></li>                  
              <li><i class='fas fa-folder-open' ></i> <?=$categoria?></li>

              <?php
              if($autor){
                echo "<li><i class='fa fa-user' ></i> ".$autor."</li>";
              }
              ?>

            </ul>
          </div>

          <div class='blog_divisao_interna' ></div>

          <div class="blog_padrao_conteudo" >

            <?php
            if($imagens[0]['imagem_g']){
              echo "<img src='".$imagens[0]['imagem_g']."' class='noticias_imagem_lateral_interna' >";
            }
            ?>

            <?=$data->conteudo?>

          </div>

          <?php

          $n_img = 0;
          foreach ($imagens as $key => $value) {

            if($n_img != 0){
              echo "<div class='blog_imagem_interna' ><img src='".$value['imagem_g']."' ></div>";
              if($value['legenda']){
                echo "<div class='blog_legenda' >".$value['legenda']."</div>";
              }
            }

            $n_img++;
          }

          ?>

          <div class="social" >

            <div class='social_titulo' >
              Gostou? Compartilhe!
            </div>
            <ul>
              <li>
                <a href="https://www.facebook.com/sharer.php?u=<?=$endereco_noticia_sem_ssl?>" class="facebook" target="_blank" title="Compartilhar via Facebook"><i class="fab fa-facebook"></i></a>
              </li>
              <li>
                <a href="https://twitter.com/intent/tweet?text=<?=$data->titulo?>&url=<?=$endereco_noticia_sem_ssl?>" class="twitter" target="_blank" title="Compartilhar via Twitter"><i class="fab fa-twitter"></i></a>
              </li>
              <li>
                <a href="https://api.whatsapp.com/send?text=Veja esta matéria:<?=$endereco_noticia_sem_ssl?>" class="whats" target="_blank" title="Compartilhar via WhatsApp"><i class="fab fa-whatsapp"></i></a>
              </li>
            </ul>

          </div>

          <div class="blog_voltar_noticia" >
            <a class="btn botao_leitura hvr-float-shadow" style="padding-left:20px; padding-right:20px; padding-top:10px; padding-bottom:7px;" href="#" onClick="history.go(-1)" >Voltar</a>
          </div>
          
          <div style="clear:left;" ></div>
          
        </div>

        <div class="col-xs-12 col-sm-4 col-md-4" >
          <div class="blog_divisao_lateral" style="margin-top:50px;" >

            <?php include_once('htm_conteudo_banners_esq.php'); ?>
            <?php include_once('htm_conteudo_banners_dir.php'); ?>
            
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