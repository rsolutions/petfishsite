<?php if(!isset($_base['libera_views'])){ header("HTTP/1.0 404 Not Found"); exit; }



//echo "<pre>"; print_r($conteudo_sessao['cores']['detalhes']); echo "</pre>";

$cores = $conteudo_sessao['cores']['lista'];

$conteudo_config = $conteudo_sessao['data_grupo'];



?>

<div id="contato"></div>

<section id="section-contato-<?=$conteudo_id?>" class="" style="padding-top:40px; padding-bottom:-20px; background-color: <?=$cores[26]?>; ">

	<div class="container">



		<?php if($conteudo_config->mostrar_titulo == 1){ ?>



			<div class='row' >

				<div class='col-xs-12 col-sm-1 col-md-1' ></div>

				<div class='col-xs-12 col-sm-10 col-md-10' >

					<div>

						<h2 class="titulo_padrao" style="color:<?=$cores[27]?> !important; border-color:<?=$cores[27]?> !important; " ><?=$conteudo_config->titulo?></h2>

						<div class="titulo_padrao_linha" style="color:<?=$cores[27]?>; " ><i class="fas fa-caret-down"></i></div> 

					</div>

				</div>

				<div class='col-xs-12 col-sm-1 col-md-1' ></div>

			</div>



		<?php } ?>



		<?php if($conteudo_config->descricao){ ?>



			<div class='row' >

				<div class='col-xs-12 col-sm-1 col-md-1' ></div>

				<div class='col-xs-12 col-sm-10 col-md-10' >

					<div style="margin-top:30px; padding-bottom:40px; font-size: 16px; color:<?=$cores[27]?>; text-align: center;">

						<?=$conteudo_config->descricao?>

					</div>

				</div>

				<div class='col-xs-12 col-sm-1 col-md-1' ></div>

			</div>



		<?php } ?>



		

		<div class='row' >

			<div class='col-xs-12 col-sm-1 col-md-1' ></div>

			<div class='col-xs-12 col-sm-10 col-md-10' >

				<div class="contact-form">

					<form id="form-contato-<?=$conteudo_id?>" name="form-contato-<?=$conteudo_id?>" class="contact-form row" method="post" >

						

						<?php if($conteudo_config->tipo_envio != 'todos'){ ?>

							

							<div class="form-group col-md-12">   

								<select name="email_destino" class="form-control contato_form" required="required"  >

									<option value="" selected="">DEPARTAMENTO</option>

									<?php



									foreach ($conteudo_sessao['lista'] as $key => $value) {

										echo "<option value='".$value['email']."' >".$value['titulo']."</option>";

									}

									

									?>

								</select>

							</div>

							

						<?php } ?>

						

						<div class="form-group col-md-6">   

							<input type="text" name="nome" class="form-control contato_form" required="required" placeholder="Nome">

						</div>

						

						<div class="form-group col-md-6">   

							<input type="text" name="cidade" class="form-control contato_form" placeholder="Cidade">

						</div>

						

						<div class="form-group col-md-6">

							<input type="email" name="email" class="form-control contato_form" required="required" placeholder="E-mail">

						</div>



						<div class="form-group col-md-6">

							<input type="text" name="fone" class="form-control contato_form" placeholder="Telefone">

						</div>



						<div class="form-group col-md-12">

							<textarea name="msg" id="msg" class="form-control contato_form" style="height:100px" placeholder="Escreva sua mensagem"></textarea>

						</div>



						<div class="form-group col-md-9">

							<div class="g-recaptcha" data-sitekey="<?=recaptcha_key?>"></div>

						</div>



						<div class="form-group col-md-3">

							<div class="botao_contato" >

								<div class="btn btn-default add-to-cart hvr-float-shadow" style="height: 40px; padding-top:10px; background-color:<?=$cores[28]?> !important; color:<?=$cores[29]?> !important; " onClick="envia_contato_<?=$conteudo_id?>();" ><span style="font-size: 13px;"> <i class="fa fa-check" aria-hidden="true"></i></span>Enviar</div>

								<input type="hidden" name="grupo" value="<?=$conteudo_config->codigo?>">

							</div>

						</div>



					</form>



				</div>



			</div>

			<div class='col-xs-12 col-sm-1 col-md-1' ></div>

		</div>



	</div>

</section>