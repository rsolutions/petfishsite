<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; } ?>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title><?=$data_pagina->meta_titulo?></title>
	<link rel="shortcut icon" href="<?=$_base['favicon'];?>" />
	<meta name="description" content="<?=$data_pagina->meta_descricao?>" />
	<meta property="og:description" content="<?=$data_pagina->meta_descricao?>" />
  <meta name="keywords" content="Sistema PHP, Loja Virtual PHP, Script imobiliaria administravel, loja virtual responsiva, php mysql, Sistema completo em PHP, MySQL, Bootstrap e JQuery"/>
  <meta name="author" content="<?=AUTOR?>">
  <meta property="og:url" content="<?=DOMINIO?>"/>
  <meta property="og:type" content="article"/>
  <meta property="og:title" content="Sites prontos para você usar em seus projetos"/>
  <meta property="og:description" content="Procurando por Modelos prontos Para economizar tempo e esforço de programação?
  Sites em HTML5, Bootstrap & PHP"/>
  <meta property="og:image" content="https://www.divinosilva.com.br/wp-content/themes/host_divino_silva/template/divin0silva/images/Sites-prontos-para.jpg"/>
	<meta name="author" content="<?=AUTOR?>" />
	<meta name="classification" content="Website" />
	<meta name="robots" content="index, follow" />
	<meta name="Indentifier-URL" content="<?=DOMINIO?>" />
	
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!--link href="<?=LAYOUT?>api/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" /-->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" type="text/css" />
  <!--link href="<?=LAYOUT?>api/fontawesome/css/all.css" rel="stylesheet" type="text/css" /-->
  <link href="<?=LAYOUT?>css/animate.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/hover-master/css/hover-min.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>css/main.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>css/responsiveslides.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
  <link href="<?=LAYOUT?>api/select2/select2.min.css" rel="stylesheet" type="text/css" >
  <link href="<?=LAYOUT?>api/photobox-master/photobox/photobox.css" rel="stylesheet" type="text/css">
  <link href="<?=LAYOUT?>api/jquery-ui-1.12.1.custom/jquery-ui.min.css" rel="stylesheet" type="text/css">  

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

    $conteudo_id = $value_layout['id'];
    $conteudo_sessao = $value_layout['conteudo'];
    include 'htm_conteudo_'.$value_layout['tipo'].'.php';
    
  }

  ?>


  <?php
  if($status_radio == 1){
    ?>
    
    <div id="div_radio" class="faixa_radio" >
      <div class="container">
        <div class="row">      

          <div class="col-xs-12 col-sm-1 col-md-2" ></div>
          <div class="col-xs-2 col-sm-2 col-md-2" >

            <div class="play_radio" >

              <span class="icon_play_radio" onClick="play_radio();" ><i class="fas fa-play-circle"></i></span>

              <span class="icon_pause_radio" onClick="pause_radio();" ><i class="fas fa-pause-circle"></i></span>

            </div>

            <div class="player_radio">
              <div id="jquery_jplayer_1" class="jp-jplayer"></div>        
            </div>

            <span class='radio_texto'>Ao Vivo</span>

            <div style="clear: both;"></div>

          </div>

          <div class="col-xs-10 col-sm-4 col-md-3" >

            <div class="radio_titulo" style="background-color: <?=$radio_cores->cor_titulo_atual_fundo?>; color: <?=$radio_cores->cor_titulo_atual_texto?>; ">Agora</div>
            <div class="radio_atual" >
              <div class='radio_programa' ><?=$programacao_atual['programa']?></div>
              <div class='radio_apresentador' >Apresentador: <?=$programacao_atual['apresentador']?></div>
            </div>

          </div>

          <div class="col-xs-12 col-sm-4 col-md-4" id="divradiodepois" >

            <div class="radio_titulo" style="background-color: <?=$radio_cores->cor_titulo_prox_fundo?>; color: <?=$radio_cores->cor_titulo_prox_texto?>; ">Depois</div>
            <div class="radio_proximo">
              <div class='radio_programa' ><?=$programacao_proximo['programa']?></div>
              <div class='radio_apresentador' >Apresentador: <?=$programacao_proximo['apresentador']?></div>
            </div>

          </div>

          <div class="col-xs-12 col-sm-1 col-md-1" ></div>

        </div>
      </div>      
    </div>

  <?php } ?>



  <script type="text/javascript" src="<?=LAYOUT?>js/jquery-2.2.4.min.js" ></script>
  <script type="text/javascript" src="<?=LAYOUT?>api/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/bootstrap.min.js" ></script>    
  <script type="text/javascript" src="<?=LAYOUT?>api/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
  <script type="text/javascript" >function dominio(){ return '<?=DOMINIO?>'; }</script>
  <script type="text/javascript" src="<?=LAYOUT?>js/funcoes.js"></script>
  <script src='https://www.google.com/recaptcha/api.js'></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/animation.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>js/responsiveslides.min.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>api/select2/select2.full.min.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>api/bxslider/jquery.bxslider.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>api/photobox-master/photobox/jquery.photobox.js"></script>
  <script type="text/javascript" src="<?=LAYOUT?>api/jPlayer-2.9.2/dist/jplayer/jquery.jplayer.min.js"></script>

  <?php
  if($status_radio == 1){
    ?>


    <script type="text/javascript">

      var stream = {
        title: "Radio Online",
        mp3: "<?=$radio_link?>"
      },
      ready = false;

      $(document).ready(function(){

        create_radio();         
        $(".icon_pause_radio").hide(); 

      });

      function create_radio(){
        $("#jquery_jplayer_1").jPlayer({
          ready: function (event) {
            ready = true;
            $(this).jPlayer("setMedia", stream);
          },
          error: function(event) {
            if(ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
              $(this).jPlayer("setMedia", stream).jPlayer("play");
            }
          },
          supplied: "mp3",
          preload: "true",
          wmode: "window",
          useStateClassSkin: true,
          autoBlur: false,
          keyEnabled: true
        });
      }

      function play_radio(){
        stream = {
          title: "Radio Online",
          mp3: "<?=$radio_link?>"
        },
        ready = false;
        $("#jquery_jplayer_1").jPlayer("setMedia", stream);
        $("#jquery_jplayer_1").jPlayer("play");
        $(".icon_play_radio").hide();
        $(".icon_pause_radio").show(); 
      }

      function pause_radio(){
        $("#jquery_jplayer_1").jPlayer("stop");
        $("#jquery_jplayer_1").jPlayer("clearMedia");
        $(".icon_play_radio").show();
        $(".icon_pause_radio").hide(); 
      }

    </script>

  <?php } ?>

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

    if($value_layout['tipo'] == 'banner'){      
      $conteudo_id = $value_layout['id'];
      $id_script = '#slider_'.$conteudo_id;
      ?>
      <script>

        $("<?=$id_script?>").responsiveSlides({
          auto: true,
          pager: true,
          nav: true,
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


    if($value_layout['tipo'] == 'cadastro_email'){ 
      $conteudo_id = $value_layout['id'];
      ?>
      <script type="text/javascript">
        function cadastro_news_<?=$conteudo_id?>(){
          var nome = $('#news_nome_<?=$conteudo_id?>').val();
          var email = $('#news_email_<?=$conteudo_id?>').val();
          modal('<?=DOMINIO?><?=$controller?>/cadastro_email/email/'+email+'/nome/'+nome+'/grupo/<?=$value_layout['codigo']?>');
        }
      </script>
      <?php
    }


    if($value_layout['tipo'] == 'rastreamento'){ 
      $conteudo_id = $value_layout['id'];
      ?>
      <script type="text/javascript">
        function enviar_rastr_<?=$conteudo_id?>(){

          $('#modal_conteudo').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");
          $('#modal_janela').modal('show');

          var rastreio_codigo = $('#rastreio_codigo_<?=$conteudo_id?>').val();

          $.post('<?=DOMINIO?><?=$controller?>/rastreamento_detalhes', { rastreio_codigo: rastreio_codigo },function(data){
            if(data){
              $('#modal_conteudo').html(data);
            }
          });

        }
      </script>
      <?php
    }     


    if($value_layout['tipo'] == 'cadastro_fone'){ 
      $conteudo_id = $value_layout['id'];
      ?>
      <script type="text/javascript">
        function cadastro_fone_<?=$conteudo_id?>(){
          var nome = $('#news_fone_nome_<?=$conteudo_id?>').val();
          var fone = $('#news_fone_numero_<?=$conteudo_id?>').val();
          modal('<?=DOMINIO?><?=$controller?>/cadastro_fone/fone/'+fone+'/nome/'+nome+'/grupo/<?=$value_layout['codigo']?>');
        }
      </script>
      <?php
    }



    if($value_layout['tipo'] == 'contador'){ 
      $conteudo_id = $value_layout['id'];
      $contadores_lista = $value_layout['conteudo']['lista'];
      ?>

      <script type="text/javascript">

        (function ($){
          $.fn.counter = function() {
            const $this = $(this),
            numberFrom = parseInt($this.attr('data-from')),
            numberTo = parseInt($this.attr('data-to')),
            delta = numberTo - numberFrom,
            deltaPositive = delta > 0 ? 1 : 0,
            time = parseInt($this.attr('data-time')),
            changeTime = 10;

            let currentNumber = numberFrom,
            value = delta*changeTime/time;
            var interval1;
            const changeNumber = () => {
              currentNumber += value;

              (deltaPositive && currentNumber >= numberTo) || (!deltaPositive &&currentNumber<= numberTo) ? currentNumber=numberTo : currentNumber;
              this.text(parseInt(currentNumber));
              currentNumber == numberTo ? clearInterval(interval1) : currentNumber;  
            }

            interval1 = setInterval(changeNumber,changeTime);
          }
        }(jQuery));

        var iniciocont_<?=$conteudo_id?> = 0;

        $(document).ready(function(){
          $(window).on('scroll', function() {
            var pos1_<?=$conteudo_id?> = $(window).scrollTop();
            var pos2_<?=$conteudo_id?> = $('#section-contador-<?=$conteudo_id?>').offset().top;
            var pos3_<?=$conteudo_id?> = $(window).height() / 1.15;
            if( pos1_<?=$conteudo_id?> > (pos2_<?=$conteudo_id?> - pos3_<?=$conteudo_id?>) ){
              iniciacontagem_<?=$conteudo_id?>(iniciocont_<?=$conteudo_id?>);
              iniciocont_<?=$conteudo_id?> = 1;
            }
            if( pos1_<?=$conteudo_id?> < (pos2_<?=$conteudo_id?> - pos3_<?=$conteudo_id?>) ){
              iniciocont_<?=$conteudo_id?> = 0;
            }      
          });
        });

        function iniciacontagem_<?=$conteudo_id?>(inicio){
          if(inicio == 0){
            <?php
            foreach ($contadores_lista as $key => $value) {
              ?>

              $('.count_<?=$value['codigo']?>').counter();

            <?php } ?>
          }
        }

      </script>

      <?php
    }

    if($value_layout['tipo'] == 'contato'){ 
      $conteudo_id = $value_layout['id'];
      $contato_lista = $value_layout['conteudo']['lista'];

      ?>

      <script>
        function envia_contato_<?=$conteudo_id?>(){

          $('#modal_conteudo').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");
          $('#modal_janela').modal('show');

          var dados = $("#form-contato-<?=$conteudo_id?>").serialize();

          $.post('<?=DOMINIO?><?=$controller?>/contato_enviar', dados,function(data){
            if(data){
              $('#modal_conteudo').html(data);
            }
          });

        }
      </script>

      <?php
    }    
    ?>


    <?php
    if($value_layout['tipo'] == 'cadastro'){ 
      $conteudo_id = $value_layout['id'];
      ?>

      <script>
        function tipo_cadastro(tipo){
          if(tipo == 'J'){
            $('#fisica').hide();
            $('#juridica').show();                
          } else {
            $('#juridica').hide();
            $('#fisica').show();
          }
        }

        function cadastro_cidades(estado, cidade = null){

          $('#cadastro_cidade_div').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='border:0px; width:30px;' ></div>");

          $.post('<?=DOMINIO?><?=$controller?>/cidades', {estado: estado, cidade: cidade},function(data){
            if(data){
              $('#cadastro_cidade_div').html(data);
            }
          });

        }
        cadastro_cidades('AC');        

        function buscar_endereco(){

          var cep = $('#cadastro_cep').val();

          $.post('<?=DOMINIO?><?=$controller?>/busca_endereco_cep', {cep: cep},function(data){
            if(data){

              var filtro = data.replace(/^\s+|\s+$/g, "");
              var retorno = JSON.parse(filtro); 

              $('#cadastro_endereco').val(retorno.endereco);
              $('#cadastro_bairro').val(retorno.bairro);
              $('#cadastro_endereco').val(retorno.endereco);
              $('#cadastro_estado').val(retorno.estado).trigger('change');

              cadastro_cidades(retorno.estado, retorno.cidade);

            }
          });

        }

        function finalizar_cadastro(){

          $('#modal_janela').modal('show');
          $('#modal_conteudo').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");

          var dados = $("#cadastro_form").serialize();

          $.post('<?=DOMINIO?><?=$controller?>/finalizar_cadastro', dados,function(data){
            if(data){
              $('#modal_conteudo').html(data);
            }
          });

        }

      </script>

      <?php
    }    
    ?> 


    <?php

    if($value_layout['tipo'] == 'duvidas'){ 
      $conteudo_id = $value_layout['id'];

      ?>

      <script>
        function duvidas_respostas_<?=$conteudo_id?>(codigo){

          $('#duvidas_div-<?=$conteudo_id?>').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");

          $.post('<?=DOMINIO?><?=$controller?>/duvidas_respostas', {codigo: codigo} ,function(data){
            if(data){
              $('#duvidas_div-<?=$conteudo_id?>').html(data);
            }
          });

        }
        duvidas_respostas_<?=$conteudo_id?>('<?=$primeira_duvida?>');
      </script>

      <?php
    }    
    ?>


    <?php

    if($value_layout['tipo'] == 'parceiros'){ 
      $conteudo_id = $value_layout['id'];
      $conteudo_config = $value_layout['conteudo']['data_grupo'];       
      ?>

      <script type="text/javascript">
        $('#parceiros-<?=$conteudo_id?>').bxSlider({
          controls : true,
          pager : true,
          minSlides : <?=$conteudo_config->itens_por_linha?>,
          maxSlides : <?=$conteudo_config->itens_por_linha?>,
          slideWidth :300,
          slideMargin :15
        });

      </script>

      <?php 

    }

    ?>


    <?php

    if($value_layout['tipo'] == 'fotos'){ 
      $conteudo_id = $value_layout['id']; 
      $fotos_config = $value_layout['conteudo']['data_grupo'];

      if($fotos_config->mostrar_categorias == 1){
        ?>

        <script>
          function fotos_categoria_<?=$conteudo_id?>(categoria){

            $('#fotos_div-<?=$conteudo_id?>').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");

            $.post('<?=DOMINIO?><?=$controller?>/fotos_categoria', {categoria: categoria, itens_por_linha: '<?=$fotos_config->itens_por_linha?>', formato:'<?=$fotos_config->formato?>', max_itens:'<?=$fotos_config->max_itens?>' } ,function(data){
              if(data){
                $('#fotos_div-<?=$conteudo_id?>').html(data);
              }
            });

          }
          fotos_categoria_<?=$conteudo_id?>('<?=$primeiras_fotos?>');
        </script>

        <?php
      }
    }

    ?>

    <?php

    if($value_layout['tipo'] == 'enquete'){ 
      $conteudo_id = $value_layout['id'];  
      ?>

      <script type="text/javascript">

        function votar_<?=$conteudo_id?>(){

          $('#modal_janela').modal('show');
          $('#modal_conteudo').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");

          var dados = $("#enquete_<?=$conteudo_id?>").serialize();

          $.post('<?=DOMINIO?><?=$controller?>/enquete_votar', dados,function(data){
            if(data){
              $('#modal_conteudo').html(data);
            }
          });

        }

      </script>

      <?php

    }

    ?>

    <?php

    if($value_layout['tipo'] == 'videos'){ 
      $conteudo_id = $value_layout['id']; 
      $videos_config = $value_layout['conteudo']['data_grupo'];

      if($videos_config->mostrar_categorias == 1){
        ?>

        <script>
          function videos_categoria_<?=$conteudo_id?>(categoria){

            $('#videos_div-<?=$conteudo_id?>').html("<div style='text-align:center;'><img src='<?=LAYOUT?>img/loading.gif' style='width:25px;'></div>");

            $.post('<?=DOMINIO?><?=$controller?>/videos_categoria', {categoria: categoria, itens_por_linha: '<?=$videos_config->itens_por_linha?>', mostrar_titulo_video: '<?=$videos_config->mostrar_titulo_video?>' } ,function(data){
              if(data){
                $('#videos_div-<?=$conteudo_id?>').html(data);
              }
            });

          }
          videos_categoria_<?=$conteudo_id?>('<?=$primeiro_video?>');
        </script>

        <?php
      }
    }

    ?>


    <?php

    // termina lista
  }

  ?>


  <?php


  if(count($banner_popup) != 0){

    $popup = false;
    foreach ($banner_popup as $key => $value) {
      if(!$popup){

        if($value['link']){
          $endereco = " href='".$value['link']."' target='_blank' ";
        } else {
          $endereco = "";
        }

        $popup = "<a $endereco ><img src='".$value['imagem']."' style='width:100%;' ></a>";

      }
    }


    ?>

    <script>
      $(document).ready(function() {
        $('#modal_conteudo').html("<div style='text-align:center;' ><?=$popup?></div>");
        $('#modal_janela').modal('show');
      });
    </script>

    <?php

  }

  ?>

  <script>
    $(function () {

      $(".select2").select2();

      $('.ampliar_imagem').photobox('a',{ time:0 });

      $('#ico_whats').click( function() {

        $('#whats_janela').toggle();

      });

    });
  </script>

  <script type="text/javascript">
    function recusar_cokies(){
     window.location='https://www.google.com.br';
    }
    function aceitar_cokies(){
      $.post('<?=DOMINIO?>index/cookies_aceitar', {token: '<?=time()?>'},function(data){
        if(data){
          $('.politica_cookies').hide();
        }
      });
    }
  </script>

</body>
</html>