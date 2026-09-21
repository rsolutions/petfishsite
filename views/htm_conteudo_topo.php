<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }



//echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";

$cores = $conteudo_sessao['cores']['lista'];

$banners_topo = $conteudo_sessao['banners_topo'];



include('htm_css_topo_'.$conteudo_sessao['data_topo']->modelo.'.php');



?>



<?php if($conteudo_sessao['data_topo']->modelo == 1){ ?>



	<header id="header" ></header>



<?php } ?>





<?php if($conteudo_sessao['data_topo']->modelo == 2){ ?>



	<header id="header" class="topo2">



		<div id="topo" class="header-top topo2_superior" >

			<div class="container" >

				<div class="row" >

					<div class="col-xs-12 col-sm-6 col-md-6">

						<div class="topo2_superior_esq" >

							<span><i class="fas fa-phone"></i> <?=$_base['texto']['154472085623402']?></span>

							<span>|</span>

							<span><i class="fab fa-whatsapp"></i> <?=$_base['texto']['156630113722300']?></span>

						</div>

					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">

						<div class="topo2_superior_dir" >

							<?php



							foreach ($_base['redessociais'] as $key => $value) {



								echo "

								<a href='".$value['endereco']."' target='_blank' ><img src='".$value['imagem']."' ></a>

								";



							}



							?>

						</div>

					</div>

				</div>

			</div>				

		</div>



		</header>



<?php } ?>







<?php if($conteudo_sessao['data_topo']->modelo == 3){ ?>



	<header id="header" >

	  </div>		

</header>





<script type="text/javascript">

	function abremenu(){

		$('.navbar-collapse').toggle();

	}	

</script>





<?php } ?>







<?php if($conteudo_sessao['data_topo']->modelo == 4){ ?>



	<header id="header" class="topo4" ></header>



	<script type="text/javascript">

		function abremenu(){

			$('.navbar-collapse').toggle();

		}	

	</script>



<?php } ?>







<?php if($conteudo_sessao['data_topo']->modelo == 5){ ?>



	<header class="topo5" ></header>



	<script type="text/javascript">

		function abremenu(){

			$('.navbar-collapse').toggle();

		}	

	</script>

	

<?php } ?>







<?php if($conteudo_sessao['data_topo']->modelo == 6){ ?>



	<header id="header" class="topo6" >



		<div id="topo" class="header-middle" >

			<div class="container" >

				<div class="row" >



					<div class="col-xs-12 col-sm-4 col-md-4">

						<div class="logo_div">

							<a href="<?=DOMINIO?>" class="img-responsive" ><img src="<?=$_base['logo']?>"></a>

						    

						</div>

				  </div>


					<div class="col-xs-12 col-sm-4 col-md-4">
						

							<?php /*<!--form action="<?=DOMINIO?><?=$controller?>/buscar" method="post" > 

								<div class="input-group">

									<input name='busca' type="text" class="form-control busca_input" placeholder="O que você está procurando?" />

									<span class="input-group-btn">

										<button class="btn busca_botao" type="submit" ><i class="fa fa-search" aria-hidden="true"></i></button>

									</span>

								</div> 

							</form-->*/ ?>



							

								
<style type="text/css">
		h4.baixo{
		padding-top: 25px;
		text-align: center;
		color: #333;
		font-weight: bold;
	}
</style>

									
 
  <script language="JavaScript" type="text/JavaScript">
 
  <!--
var dataHora, xHora, xDia, dia, mes, ano, saudacao;
dataHora = new Date();
xHora = dataHora.getHours();
 
if (xHora >= 0 && xHora <12) {saudacao = "Bom Dia, "}
if (xHora >= 12 && xHora < 18) {saudacao = "Boa Tarde, "}
if (xHora >= 18 && xHora <= 23) {saudacao = "Boa Noite, "}
 
xDia = dataHora.getDay();
 
diaSem = new Array(7);
 
diaSem[0] = "Domingo";
diaSem[1] = "Segunda";
diaSem[2] = "Terça";
diaSem[3] = "Quarta";
diaSem[4] = "Quinta";
diaSem[5] = "Sexta";
diaSem[6] = "Sábado";
 
dia = dataHora.getDate();
mes = dataHora.getMonth();
 
mesAno = new Array(12);
 
mesAno[0] = "Janeiro";
mesAno[1] = "Fevereiro";
mesAno[2] = "Março";
mesAno[3] = "Abril";
mesAno[4] = "Maio";
mesAno[5] = "Junho";
mesAno[6] = "Julho";
mesAno[7] = "Agosto";
mesAno[8] = "Setembro";
mesAno[9] = "Outubro";
mesAno[10] = "Novembro";
mesAno[11] = "Dezembro";
 
ano = dataHora.getFullYear();
 
document.write("<h4 class='baixo'>" + "  " + saudacao + " " + diaSem[xDia] + ", " + dia + " / " + mesAno[mes] + " / " + ano + "</h4>");
//-->
</script>

									

						

							

						</div>
					

					

					<div class="col-xs-12 col-sm-4 col-md-4">

						<div class="topo2_superior_dir" >

							<?php



							foreach ($_base['redessociais'] as $key => $value) {



								echo "

								<a href='".$value['endereco']."' target='_blank' ><img src='".$value['imagem']."' ></a>

								";



							}



							?>

						</div>

						

					</div>



				</div>

			</div>

		</div>





		<div class="header-bottom" >

			<div class="container">

				<div class="row">

					<div class="col-xs-12 col-sm-'12' col-md-12">



						<!--a class="botao_carrinho2" href="<?=DOMINIO?>carrinho"  > 

							<i class="fas fa-cart-arrow-down"></i> 

						</a-->



						<!--a class="topo_botao_user2" href="<?=DOMINIO?>meuspedidos" >

							<i class="fas fa-user-circle"></i>

						</a-->



						<div class="navbar-header" >

							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" >

								<i class="fa fa-bars" aria-hidden="true"></i>

							</button>

						</div>



						<div class="mainmenu">

							<ul class="nav navbar-nav collapse navbar-collapse">



								<?php



								function menu($array, $controller, $url_pagina = null){



									foreach ($array as $key => $value) {



										if($value['controller'] == $controller){

											if($value['controller'] == 'conteudo'){

												if($value['url'] == $url_pagina){

													$active = " class='active' ";

												} else {

													$active = "";

												}

											} else {

												$active = " class='active' ";

											}

										} else {

											$active = "";

										}



										echo "<li><a href='".$value['destino']."' ".$active." >";



										echo "<span class='mainmenu_txt' >".$value['titulo']."</span></a>";



										if(count($value['submenu']) != 0){



											echo "<ul>";

											echo "

											<span class='setasub'><i class='fas fa-sort-up'></i></span>

											<div class='submenu_esq' >

											";



											menu($value['submenu'], $controller, $url_pagina);								 



											echo "</div>";											 



											echo "<div style='clear:both' ></div>";

											echo "</ul>";

										}



										echo "</li>";

									}

								}



								if($controller == 'conteudo'){

									menu($conteudo_sessao['menu'], $controller, 'conteudo/pag/id/'.$pagina['url']);

								} else {

									menu($conteudo_sessao['menu'], $controller, '');

								}



								?>

							</ul>

						</div>



					</div>



				</div>

			</div>

		</div>

	</header>



	<section class="margemtopo"></section>



<?php } ?>







<?php if($conteudo_sessao['data_topo']->modelo == 7){ ?>



	<header id="header" class="topo7" ></header>



	<section class="margemtopo"></section>



<?php } ?>





<?php if($conteudo_sessao['data_topo']->modelo == 8){ ?>



	<header id="header" class="topo8" ></header>



	<section class="margemtopo"></section>



<?php } ?>



<?php if($conteudo_sessao['data_topo']->modelo == 9){ ?>



	<header id="header" class="topo9" ></header>



	<section class="margemtopo"></section>



<?php } ?>



<?php if($conteudo_sessao['data_topo']->modelo == 10){ ?>



	<header id="header" class="topo10" ></header>



	<section class="margemtopo"></section>



<?php } ?>





<?php if($conteudo_sessao['data_topo']->modelo == 11){ ?>



	<header id="header" >

	  </div>		

</header>





<script type="text/javascript">

	function abremenu(){

		$('.navbar-collapse').toggle();

	}	

</script>





<?php } ?>