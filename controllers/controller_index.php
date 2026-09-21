<?php
class index extends controller {
	
	public function init(){
		$this->inicializacao();
	}
	
	public function inicial(){
		
		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;

		// itens da inciial

		$chave = $this->_layout;

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($coisas->num_rows != 1){
			$this->_layout = "index";
			$this->irpara(DOMINIO);
		}
		$dados['data_pagina'] = $coisas->fetch_object();
		$codigo_pagina = $dados['data_pagina']->codigo;

		////////////////////////////////////////////////////////////////////////

		$cores = array();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo_pagina' ");
		while($data = $coisas->fetch_object()){
			$cores[$data->codigo] = $data->cor;
		}
		$dados['pagina_cores'] = $cores;

		////////////////////////////////////////////////////////////////////////

		$dados['banner_popup'] = array();
		if($codigo_pagina == 1){
			// banner por cima da tela
			$banners = new model_banners();
			$dados['banner_popup'] = $banners->lista_simples('148713351986017'); 
		}

		$dados['status_radio'] = 0;
		$dados['radio_link'] = '';

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM programacao_player WHERE id='1' ");
		$data = $coisas->fetch_object();
		$dados['radio_cores'] = $data;
		if($data->endereco AND ($data->status == 1) ){
			$dados['status_radio'] = 1;
			$dados['radio_link'] = $data->endereco;
		}
		
		$programacaoooo = new model_programacao();
		$tocandoatual = $programacaoooo->atual();
		$tocandoproximo = $programacaoooo->proximo();
		
		$dados['programacao_atual'] = $tocandoatual;
		$dados['programacao_proximo'] = $tocandoproximo;
		
		////////////////////////////////////////////////////////////////////////

		$lista_layout = array();
		$n = 0;
		
		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo_pagina' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();
		
		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);
			
			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo_pagina' ");
				$data = $coisas->fetch_object();

				if(isset($data->id)){
					if($data->ativo == 1){
						
						$lista_layout[$n]['id'] = $data->id;
						$lista_layout[$n]['codigo'] = $data->codigo;
						$lista_layout[$n]['titulo'] = $data->titulo;
						$lista_layout[$n]['tipo'] = $data->tipo;
						
						if($data->tipo == 'topo'){
							$topos = new model_topos();
							$lista_layout[$n]['conteudo'] = $topos->lista($data->codigo);
							$banners = new model_banners();
							$lista_layout[$n]['conteudo']['banners_topo'] = $banners->lista_simples('148713350186606');
						}
						
						if($data->tipo == 'acordeon'){
							$acordeon = new model_acordeon();
							$lista_layout[$n]['conteudo'] = $acordeon->lista($data->codigo);
						}

						if($data->tipo == 'banner'){
							$banners = new model_banners();
							$lista_layout[$n]['conteudo'] = $banners->lista($data->codigo);
						}

						if($data->tipo == 'blocos'){							
							$blocos = new model_blocos();
							$lista_layout[$n]['conteudo'] = $blocos->carregar($data->codigo);
						}

						if($data->tipo == 'rastreamento'){							
							$rastreamento = new model_rastreamento();
							$lista_layout[$n]['conteudo'] = $rastreamento->carregar($data->codigo);
						}

						if($data->tipo == 'cadastro_email'){
							$cadastro_email = new model_cadastro_email();
							$lista_layout[$n]['conteudo'] = $cadastro_email->carregar($data->codigo);
						}
						
						if($data->tipo == 'cadastro_fone'){							
							$cadastro_fone = new model_cadastro_fone();
							$lista_layout[$n]['conteudo'] = $cadastro_fone->carregar($data->codigo);
						}

						if($data->tipo == 'caracteristicas'){							
							$caracteristicas = new model_caracteristicas();
							$lista_layout[$n]['conteudo'] = $caracteristicas->lista($data->codigo);
						}

						if($data->tipo == 'contador'){
							$contador = new model_contador();
							$lista_layout[$n]['conteudo'] = $contador->lista($data->codigo);
						}

						if($data->tipo == 'destaques'){
							$destaques = new model_destaques();
							$lista_layout[$n]['conteudo'] = $destaques->lista($data->codigo);
						}

						if($data->tipo == 'contato'){							
							$contato = new model_contato();
							$lista_layout[$n]['conteudo'] = $contato->carregar($data->codigo);
						}

						if($data->tipo == 'equipe'){
							$equipe = new model_equipe();
							$lista_layout[$n]['conteudo'] = $equipe->lista($data->codigo);
						}
						
						if($data->tipo == 'revistajornal'){							
							$revistas = new model_revistas();
							$lista_layout[$n]['conteudo'] = $revistas->lista($data->codigo);
						}
						
						if($data->tipo == 'postagens'){
							
							$postagens = new model_postagens();
							$id_var = $lista_layout[$n]['id'];
							$postagens->controller_name = $this->_controller;
							$postagens->id_var = $id_var;
							if($this->get('busca_'.$id_var)){ $postagens->busca = $this->get('busca_'.$id_var); }
							if($this->get('categoria_'.$id_var)){ $postagens->categoria = $this->get('categoria_'.$id_var); }
							if($this->get('startitem_'.$id_var)){ $postagens->startitem = $this->get('startitem_'.$id_var); }
							if($this->get('startpage_'.$id_var)){ $postagens->startpage = $this->get('startpage_'.$id_var); }
							if($this->get('endpage_'.$id_var)){ $postagens->endpage = $this->get('endpage_'.$id_var); }
							if($this->get('reven_'.$id_var)){ $postagens->reven = $this->get('reven_'.$id_var); }
							$lista_layout[$n]['conteudo'] = $postagens->lista($data->codigo);
							
							$banners = new model_banners();
							$lista_layout[$n]['banners_esquerda'] = $banners->lista_simples('148713350186607');
							$lista_layout[$n]['banners_direita'] = $banners->lista_simples('148841831030374');

						}
						
						if($data->tipo == 'planos'){							
							$planos = new model_planos();
							$lista_layout[$n]['conteudo'] = $planos->lista($data->codigo);
						}

						if($data->tipo == 'duvidas'){							
							$duvidas = new model_duvidas();
							$lista_layout[$n]['conteudo'] = $duvidas->lista($data->codigo);
						}

						if($data->tipo == 'parceiros'){
							$parceiros = new model_parceiros();
							$lista_layout[$n]['conteudo'] = $parceiros->lista($data->codigo);
						}

						if($data->tipo == 'videos'){							
							$videos = new model_videos();
							$lista_layout[$n]['conteudo'] = $videos->lista($data->codigo);
						}

						if($data->tipo == 'fotos'){							
							$fotos = new model_fotos();
							$lista_layout[$n]['conteudo'] = $fotos->lista($data->codigo);
						}

						if($data->tipo == 'depoimentos'){
							$depoimentos = new model_depoimentos();
							$lista_layout[$n]['conteudo'] = $depoimentos->lista($data->codigo);
						}

						if($data->tipo == 'programacao'){
							$programacao = new model_programacao();
							$lista_layout[$n]['conteudo'] = $programacao->lista($data->codigo);
						}

						if($data->tipo == 'widgets'){							
							$widgets = new model_widgets();
							$lista_layout[$n]['conteudo'] = $widgets->carregar($data->codigo);
						}
						
						if($data->tipo == 'rodape'){
							$rodapes = new model_rodapes();
							$lista_layout[$n]['conteudo'] = $rodapes->lista($data->codigo);
						}
						
						if($data->tipo == 'enquete'){							
							$enquete = new model_enquetes();
							$lista_layout[$n]['conteudo'] = $enquete->carregar($data->codigo);
						}

						$n++;
					}
				}
			}
		}
		
		//echo "<pre>"; print_r($lista_layout); echo "</pre>"; exit;
		$dados['layout_lista'] = $lista_layout;
		
		//carrega view e envia dados para a tela
		$this->view('index', $dados);
	}

	public function cadastro_email(){
		
		$dados = array();
		$dados['_base'] = $this->_base();

		$nome = $this->get('nome');
		$email = $this->get('email');
		$grupo = $this->get('grupo');
		
		if(!$nome){
			$retorno = "erro";
		} else {
			if(!$email){
				$retorno = "erro";
			} else {
				if(!$grupo){
					$retorno = "erro";
				} else {
					$valida = new model_valida();

					if(!$valida->email($email)){
						$retorno = "erro";
					} else {

						$db = new mysql();
						$exec = $db->executar("select * from cadastro_email WHERE email='$email' AND grupo_codigo='$grupo' ");
						$linhas = $exec->num_rows;

						if($linhas == 0){
							
							$conexao = new mysql();
							$coisas_grupo = $conexao->Executar("select titulo from cadastro_email_grupos where codigo='$grupo' ");
							$data_grupo = $coisas_grupo->fetch_object();

							$grupo_titulo = $data_grupo->titulo;

							$db = new mysql();
							$db->inserir("cadastro_email", array(
								"nome"=>"$nome",
								"email"=>"$email",
								"grupo_codigo"=>"$grupo",
								"grupo_titulo"=>"$grupo_titulo"
							));

						}

						$retorno = "ok";
					}		
				}		
			}
		}

		$dados['retorno'] = $retorno;
		
		$this->view('conteudo_cadastro_email.retorno', $dados);
	}

	public function cadastro_fone(){
		
		$dados = array();
		$dados['_base'] = $this->_base();
		
		$nome = $this->get('nome');
		$fone = $this->get('fone');
		$grupo = $this->get('grupo');

		if(!$nome){
			$retorno = "erro";
		} else {
			if(!$fone){
				$retorno = "erro";
			} else {
				if(!$grupo){
					$retorno = "erro";
				} else {
					
					$db = new mysql();
					$exec = $db->executar("select * from cadastro_fone WHERE fone='$fone' AND grupo_codigo='$grupo' ");
					$linhas = $exec->num_rows;

					if($linhas == 0){

						$conexao = new mysql();
						$coisas_grupo = $conexao->Executar("select titulo from cadastro_fone_grupos where codigo='$grupo' ");
						$data_grupo = $coisas_grupo->fetch_object();

						$grupo_titulo = $data_grupo->titulo;

						$db = new mysql();
						$db->inserir("cadastro_fone", array(
							"nome"=>"$nome",
							"fone"=>"$fone",
							"grupo_codigo"=>"$grupo",
							"grupo_titulo"=>"$grupo_titulo"
						));

					}

					$retorno = "ok";
				}		
			}
		}

		$dados['retorno'] = $retorno;
		
		$this->view('conteudo_cadastro_fone.retorno', $dados);
	}

	public function contato_enviar(){
		
		$dados = array();
		$dados['_base'] = $this->_base();
		
		$nome = $this->post('nome');
		$cidade = $this->post('cidade');
		$email = $this->post('email');
		$fone = $this->post('fone');
		$mensagem = $this->post('msg');
		$captcha = $this->post('g-recaptcha-response');
		$grupo = $this->post('grupo');
		$email_destino = $this->post('email_destino');

		if($nome AND $email AND $grupo){
			
			$ip = $_SERVER['REMOTE_ADDR'];
			$key = recaptcha_secret;
			$url = 'https://www.google.com/recaptcha/api/siteverify';

			// RECAPTCH RESPONSE
			$recaptcha_response = file_get_contents($url.'?secret='.$key.'&response='.$captcha.'&remoteip='.$ip);
			$data = json_decode($recaptcha_response);
			if(isset($data->success) &&  $data->success === true) {

				/* mensagem */
				$msg =  "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>Contato enviado pelo Website</strong></p>";	
				$msg .= "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>Nome:</strong> ".$nome."</p>";
				$msg .= "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>Cidade:</strong> ".$cidade."</p>";
				$msg .= "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>E-mail:</strong> ".$email."</p>";
				$msg .= "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>Telefone:</strong> ".$fone."</p>";
				$msg .= "<p style='font-family:Arial,sans-serif; font-size:12px;'><strong>Mensagem:</strong> ".$mensagem."</p>";


				$db = new mysql();
				$exec = $db->executar("select * from contato_grupos WHERE codigo='$grupo' ");
				$data_grupo = $exec->fetch_object();

				$lista_envio = array();
				$n = 0;

				if($data_grupo->tipo_envio == 'todos'){ 

					$db = new mysql();
					$exec = $db->executar("select * from contato WHERE grupo='$grupo' ");
					while($data = $exec->fetch_object()){
						$lista_envio[$n] = $data->email;
						$n++;
					}

				} else {
					if(!$email_destino){
						echo "O destino selecionado é inválido!";
						exit;
					}
					$lista_envio[0] = $email_destino;
				}

				$envio = new model_envio();
				$retorno = $envio->enviar("Contato", $msg, $lista_envio, $email);
				if($retorno['status'] == 1){
					echo $retorno['msg'];
				} else {
					echo 'Erro no envio - '.$retorno['msg'];
				}

			} else {
				echo "Erro na validação do captcha, tente novamente!";
				exit;
			}

		} else {
			echo "Preencha todos os campos para continuar";
			exit;
		}

	}



	public function leitura(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;

		// itens da inciial

		$chave = $this->_layout;

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($coisas->num_rows != 1){
			$this->_layout = "index";
			$this->irpara(DOMINIO);
		}
		$dados['data_pagina'] = $coisas->fetch_object();
		$codigo_pagina = $dados['data_pagina']->codigo;

		////////////////////////////////////////////////////////////////////////

		$cores = array();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo_pagina' ");
		while($data = $coisas->fetch_object()){
			$cores[$data->codigo] = $data->cor;
		}
		$dados['pagina_cores'] = $cores;

		////////////////////////////////////////////////////////////////////////

		$lista_layout = array();
		$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo_pagina' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);

			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo_pagina' ");
				$data = $coisas->fetch_object();

				if(isset($data->id)){
					if($data->ativo == 1){

						$lista_layout[$n]['id'] = $data->id;
						$lista_layout[$n]['codigo'] = $data->codigo;
						$lista_layout[$n]['titulo'] = $data->titulo;
						$lista_layout[$n]['tipo'] = $data->tipo;

						if($data->tipo == 'topo'){
							$topos = new model_topos();
							$lista_layout[$n]['conteudo'] = $topos->lista($data->codigo);
							$banners = new model_banners();
							$lista_layout[$n]['conteudo']['banners_topo'] = $banners->lista_simples('148713350186606');
						}

						if($data->tipo == 'rodape'){							
							$rodapes = new model_rodapes();
							$lista_layout[$n]['conteudo'] = $rodapes->lista($data->codigo);
						}

						$n++;
					}
				}
			}
		}

		//echo "<pre>"; print_r($lista_layout); echo "</pre>"; exit;
		$dados['layout_lista'] = $lista_layout;


		$id = $this->get('id');

		if(!$id){
			$this->irpara(DOMINIO);
			exit;
		}


		// noticia

		$postagens = new model_postagens();
		$dados['data'] = $postagens->carrega_postagem($id);
		if(!$dados['data']->id){
			$this->irpara(DOMINIO);
			exit;
		}

		// grupos
		$dados['categorias'] = $postagens->lista_categorias();
		$dados['categoria_codigo'] = $dados['data']->categoria;
		$dados['categoria'] = $postagens->titulo_categoria($dados['data']->categoria);
		
		//codigo da noticia
		$codigo = $dados['data']->codigo;
		
		//endereco da noticia		 
		$dados['endereco_noticia'] = DOMINIO.$this->_controller."/leitura/id/".$dados['data']->amigavel;
		$dados['endereco_noticia_sem_ssl'] = $string = str_replace("https://", "http://", $dados['endereco_noticia']);
		
		//autor se tiver
		if($dados['data']->autor){			
			$dados['autor'] = $postagens->autor_postagem($dados['data']->autor);			
		} else {
			$dados['autor'] = "";
		}

		//dia
		//$mes = new data();
		//$dados['dia'] = date('d', $dados['data']->data)." ".$mes->mes($dados['data']->data, 2)." ".date('Y', $dados['data']->data);
		$dados['dia'] = date('d/m', $dados['data']->data);

		//pega imagens
		$dados['imagens'] = $postagens->imagens($codigo);

		$dados['imagem_principal_largura'] = "";
		$dados['imagem_principal_altura'] = "";
		$dados['imagem_principal'] = "";
		if(isset($dados['imagens'][0]['imagem_g'])){

			$dados['imagem_principal'] = $dados['imagens'][0]['imagem_g'];
			$dados['imagem_principal_sem_ssl'] = $string = str_replace("https://", "http://", $dados['imagens'][0]['imagem_g']);

			$imagem_principal = "arquivos/img_postagens_g/".$dados['data']->codigo."/".$dados['imagens'][0]['imagem'];
			list($largura, $altura) = getimagesize($imagem_principal);
			if($largura){
				$dados['imagem_principal_largura'] = $largura;
			}
			if($altura){
				$dados['imagem_principal_altura'] = $altura;
			}

		}


		$banners = new model_banners();
		$dados['banners_esquerda'] = $banners->lista_simples('148713350186607');
		$dados['banners_direita'] = $banners->lista_simples('148841831030374');

		//carrega view e envia dados para a tela
		$this->view('leitura', $dados);

	}


	public function buscar(){

		$dados = array();
		$dados['_base'] = $this->_base();
		
		$buscatag = $this->post('busca');

		if(!$buscatag){
			$this->irpara(DOMINIO);
			exit;
		} else {

			$buscatag_filtrado = str_replace(array('/',' '), "", $buscatag);

			$this->irpara(DOMINIO.$this->_controller.'/busca/tag/'.$buscatag_filtrado);
			exit;
		}
	}

	public function busca(){
		
		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;


		// itens da inciial

		$chave = $this->_layout;

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($coisas->num_rows != 1){
			$this->_layout = "index";
			$this->irpara(DOMINIO);
		}
		$dados['data_pagina'] = $coisas->fetch_object();
		$codigo_pagina = $dados['data_pagina']->codigo;

		////////////////////////////////////////////////////////////////////////

		$cores = array();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo_pagina' ");
		while($data = $coisas->fetch_object()){
			$cores[$data->codigo] = $data->cor;
		}
		$dados['pagina_cores'] = $cores;

		////////////////////////////////////////////////////////////////////////

		$lista_layout = array();
		$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo_pagina' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);

			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo_pagina' ");
				$data = $coisas->fetch_object();

				if(isset($data->id)){
					if($data->ativo == 1){

						$lista_layout[$n]['id'] = $data->id;
						$lista_layout[$n]['codigo'] = $data->codigo;
						$lista_layout[$n]['titulo'] = $data->titulo;
						$lista_layout[$n]['tipo'] = $data->tipo;

						if($data->tipo == 'topo'){
							$topos = new model_topos();
							$lista_layout[$n]['conteudo'] = $topos->lista($data->codigo);
							$banners = new model_banners();
							$lista_layout[$n]['conteudo']['banners_topo'] = $banners->lista_simples('148713350186606');
						}

						if($data->tipo == 'rodape'){							
							$rodapes = new model_rodapes();
							$lista_layout[$n]['conteudo'] = $rodapes->lista($data->codigo);
						}

						$n++;
					}
				}
			}
		}

		//echo "<pre>"; print_r($lista_layout); echo "</pre>"; exit;
		$dados['layout_lista'] = $lista_layout;


		$buscatag = $this->get('tag');
		if(!$buscatag){
			$this->irpara(DOMINIO);
			exit;
		}
		$dados['buscatag'] = $buscatag;

		$lista = array();
		$n = 0;

		// busca noticias

		$conexao = new mysql();
		$coisas_noticias = $conexao->Executar("SELECT * FROM noticia WHERE titulo LIKE '%$buscatag%' OR previa LIKE '%$buscatag%' ORDER BY data desc");
		if($coisas_noticias->num_rows != 0){
			while($data_noticias = $coisas_noticias->fetch_object()){

				$lista[$n]['tipo'] = 'noticias';
				$lista[$n]['titulo'] = "Postagens - ".$data_noticias->titulo;
				$lista[$n]['previa'] = $data_noticias->previa;
				$lista[$n]['endereco'] = DOMINIO.$this->_controller."/leitura/id/".$data_noticias->amigavel;

				$n++;
			}
		}





		$dados['lista'] = $lista;

		//carrega view e envia dados para a tela
		$this->view('busca', $dados);
	}
	

	public function duvidas_respostas(){

		$codigo = $this->post('codigo');
		if($codigo){
			
			$db = new mysql();
			$exec = $db->Executar("SELECT * FROM duvidas WHERE codigo='$codigo' ");
			$data = $exec->fetch_object();

			echo "
			<div class='duvidas_pergunta'>".$data->titulo."</div>
			<div class='duvidas_resposta' >".nl2br($data->resposta)."</div>
			";

		}
	}


	public function criar_depoimento(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;


		$this->view('conteudo_depoimentos_adicionar', $dados);
	}

	public function enviar_depoimento(){

		$dados = array();
		$dados['_base'] = $this->_base();
		
		$nome = $this->post('nome');
		$email = $this->post('email');
		$cidade = $this->post('cidade');
		$msg = $this->post('msg');

		// validacoes
		if($nome AND $email AND $msg){
			
			$time = time();
			
			$db = new mysql();
			$db->inserir("depoimentos", array(
				'data'=>$time,
				'nome'=>$nome,
				'email'=>$email,
				'cidade'=>$cidade,
				'conteudo'=>$msg,
				'bloqueio'=>"1"
			));
			
			$this->msg('Seu depoimento foi enviado com sucesso!');
			$this->volta(1);

		} else {
			$this->msg('Informe seus dados corretamente e tente novamente.');
			$this->volta(1);
		}
	}


	public function videos_categoria(){

		$categoria = $this->post('categoria');
		$itens_por_linha = $this->post('itens_por_linha');
		$mostrar_titulo_video = $this->post('mostrar_titulo_video');

		if($categoria){

			$n_row = 1;

			$db = new mysql();
			$exec = $db->Executar("SELECT * FROM videos WHERE categoria='$categoria' ");
			while($data = $exec->fetch_object()){

				if($n_row == 1){ echo "<div class='row' >"; }


				if($itens_por_linha == 1){
					echo "<div class='col-xs-12 col-sm-12 col-md-12' >";
				}
				if($itens_por_linha == 2){
					echo "<div class='col-xs-12 col-sm-6 col-md-6' >";
				}
				if($itens_por_linha == 3){
					echo "<div class='col-xs-12 col-sm-4 col-md-4' >";
				}
				if($itens_por_linha == 4){
					echo "<div class='col-xs-12 col-sm-3 col-md-3' >";
				}

				echo " 
				<div class='videos_div' >
				";

				if($mostrar_titulo_video == 1){

					echo "<div class='videos_titulo'  >".$data->titulo."</div>";

				}

				echo "
				<div class='videos_descricao' >".$data->previa."</div>
				<div class='videos_conteudo' >".$data->conteudo."</div>

				</div>
				</div>
				";

				if($n_row == $itens_por_linha){ echo "</div>"; $n_row = 1; } else { $n_row++; }

			}

			if($n_row != 1){ echo "</div>"; }

		}
	}

	public function fotos_categoria(){

		$fotos = new model_fotos();

		$categoria = $this->post('categoria');
		$itens_por_linha = $this->post('itens_por_linha'); 
		$formato = $this->post('formato');
		$max_itens = $this->post('max_itens');

		if($categoria)	{

			$n_row = 1;
			$total_n = 1;
			$lista = array();
			$n = 0;

			if($formato == 'imagens'){



				// imagens aleatorias clicar e ampliar

				echo "<div style='width:100%; padding-bottom:30px; margin-top:30px;' class='ampliar_imagem' >";

				$db = new mysql();
				$exec = $db->Executar("SELECT * FROM fotos WHERE categoria='$categoria' ");
				while($data = $exec->fetch_object()){
					$imagens = $fotos->imagens($data->codigo);
					foreach ($imagens['lista'] as $key2 => $value2) {							
						$lista[$n] = $value2['imagem_g'];
						$n++;
					}
				}

				shuffle($lista);

				foreach ($lista as $key => $value) {

					if($total_n <= $max_itens){

						if($n_row == 1){ echo "<div class='row' style='padding-left:15px; padding-right:15px;' >"; }

						if($itens_por_linha == 1){
							echo "<div class='col-xs-12 col-sm-12 col-md-12' style='padding-left:0px; padding-right:0px;' >";
						}
						if($itens_por_linha == 2){
							echo "<div class='col-xs-12 col-sm-6 col-md-6' style='padding-left:0px; padding-right:0px;' >";
						}
						if($itens_por_linha == 3){
							echo "<div class='col-xs-12 col-sm-4 col-md-4' style='padding-left:0px; padding-right:0px;' >";
						}
						if($itens_por_linha == 4){
							echo "<div class='col-xs-12 col-sm-3 col-md-3' style='padding-left:0px; padding-right:0px;' >";
						}

						echo " 
						<a class='fotos1_div' style='background-image:url(".$value.");' href='".$value."' ></a>
						</div>
						";

						$total_n++;

						if($n_row == $itens_por_linha){ echo "</div>"; $n_row = 1; } else { $n_row++; }

					}
				}
				if($n_row != 1){ echo "</div>"; }

				echo "</div>

				<script> $(function () { $('.ampliar_imagem').photobox('a',{ time:0 }); }); </script>

				";

			} else {


				// albuns clicar e abrir nova pagina 

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM fotos WHERE categoria='".$categoria."' ");
				while($data = $coisas->fetch_object()){
					
					$lista[$n]['id'] = $data->id;
					$lista[$n]['codigo'] = $data->codigo;
					$lista[$n]['titulo'] = $data->titulo;
					$lista[$n]['previa'] = $data->previa;
					$imagens = $fotos->imagens($data->codigo);
					$lista[$n]['imagem'] = $imagens['principal'];

					$n++;
				}

				$n_row = 1;
				$total_n = 1;
				foreach ($lista as $key => $value) {
					if($total_n <= $max_itens){

						if($n_row == 1){ echo "<div class='row' >"; }

						if($itens_por_linha == 1){
							echo "<div class='col-xs-12 col-sm-12 col-md-12' >";
						}
						if($itens_por_linha == 2){
							echo "<div class='col-xs-12 col-sm-6 col-md-6' >";
						}
						if($itens_por_linha == 3){
							echo "<div class='col-xs-12 col-sm-4 col-md-4' >";
						}
						if($itens_por_linha == 4){
							echo "<div class='col-xs-12 col-sm-3 col-md-3' >";
						}

						echo " 
						<a class='fotos2_div' style='background-image:url(".$value['imagem'].");' href='".DOMINIO.$this->_controller."/fotos_detalhes/codigo/".$value['codigo']."' ></a>
						<a class='fotos2_titulo' href='".DOMINIO.$this->_controller."/fotos_detalhes/codigo/".$value['codigo']."' >".$value['titulo']."</a>

						</div>
						";

						$total_n++;

						if($n_row == $itens_por_linha){ echo "</div>"; $n_row = 1; } else { $n_row++; }

					}
				}
				if($n_row != 1){ echo "</div>"; }

			}

		}
	}

	public function fotos_detalhes(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;


		// itens da inciial

		$chave = $this->_layout;

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($coisas->num_rows != 1){
			$this->_layout = "index";
			$this->irpara(DOMINIO);
		}
		$dados['data_pagina'] = $coisas->fetch_object();
		$codigo_pagina = $dados['data_pagina']->codigo;

		////////////////////////////////////////////////////////////////////////

		$cores = array();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo_pagina' ");
		while($data = $coisas->fetch_object()){
			$cores[$data->codigo] = $data->cor;
		}
		$dados['pagina_cores'] = $cores;

		////////////////////////////////////////////////////////////////////////

		$lista_layout = array();
		$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo_pagina' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);

			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo_pagina' ");
				$data = $coisas->fetch_object();

				if(isset($data->id)){
					if($data->ativo == 1){

						$lista_layout[$n]['id'] = $data->id;
						$lista_layout[$n]['codigo'] = $data->codigo;
						$lista_layout[$n]['titulo'] = $data->titulo;
						$lista_layout[$n]['tipo'] = $data->tipo;

						if($data->tipo == 'topo'){
							$topos = new model_topos();
							$lista_layout[$n]['conteudo'] = $topos->lista($data->codigo);
							$banners = new model_banners();
							$lista_layout[$n]['conteudo']['banners_topo'] = $banners->lista_simples('148713350186606');
						}

						if($data->tipo == 'rodape'){							
							$rodapes = new model_rodapes();
							$lista_layout[$n]['conteudo'] = $rodapes->lista($data->codigo);
						}

						$n++;
					}
				}
			}
		}

		//echo "<pre>"; print_r($lista_layout); echo "</pre>"; exit;
		$dados['layout_lista'] = $lista_layout;


		$codigo = $this->get('codigo');

		if(!$codigo){
			$this->irpara(DOMINIO);
		}

		$fotos = new model_fotos();
		$dados['data'] = $fotos->carregar($codigo);
		$dados['imagens'] = $fotos->imagens($codigo);

		//carrega view e envia dados para a tela
		$this->view('fotos.detalhes', $dados);
	}

	public function resultado_enquete(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;


		$codigo = $this->get('codigo');

		if(!$codigo){

			echo "Ocorreu um erro!";
			exit;

		}


		$trata = new model_valores();

		//lista ultima enquete
		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM enquete WHERE codigo='$codigo' ");
		$data = $coisas->fetch_object();

		$dados['enquete']['codigo'] = $data->codigo;
		$dados['enquete']['pergunta'] = $data->enquete;

		//calcula total de votos
		$conexao = new mysql();
		$coisas_vot_total = $conexao->Executar("SELECT id FROM enquete_voto WHERE codigo_enquete='".$dados['enquete']['codigo']."' ");
		$linhas_vot_total = $coisas_vot_total->num_rows;

		//lisa respostas
		$respostas = array();
		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM enquete_resposta WHERE enquete_codigo='".$dados['enquete']['codigo']."' ");
		$n = 0;
		while($data = $coisas->fetch_object()){

			$respostas[$n]['texto'] = $data->resposta;
			$respostas[$n]['codigo'] = $data->codigo;

			//calula numero de votos
			$conexao = new mysql();
			$coisas_vot = $conexao->Executar("SELECT id FROM enquete_voto WHERE codigo_enquete='".$dados['enquete']['codigo']."' AND codigo_resposta='$data->codigo' ");
			$linhas_vot = $coisas_vot->num_rows;

			$respostas[$n]['votos'] = $linhas_vot;

			//calula porcentagem de votos
			if($linhas_vot != 0){
				$porcento = ($linhas_vot / $linhas_vot_total) * 100;
				$porcento = $trata->trata_valor_calculo($porcento);
			} else {
				$porcento = 0;
			}
			$respostas[$n]['votos_porc'] = $porcento;

			$n++;
		}
		$dados['enquete_respostas'] = $respostas;


		//carrega view e envia dados para a tela
		$this->view('conteudo_enquete_resultado', $dados);
	}

	public function enquete_votar(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;


		$codigo_enquete = $this->post('codigo');
		$voto = $this->post('enquete');

		if($codigo_enquete AND $voto){

			$ip = $_SERVER["REMOTE_ADDR"];
			$time = time();

			//confere se o ip já votou nesta enquete
			$conexao = new mysql();
			$coisas = $conexao->Executar("SELECT data FROM enquete_voto WHERE codigo_enquete='$codigo_enquete' AND ip='$ip' order by id desc limit 1 ");

			//caso já exista um voto confere se foi no mesmo dia
			if($coisas->num_rows != 0){
				$data = $coisas->fetch_object();
				if(date('d/m/Y') == date('d/m/Y', $data->data)){
					echo "Desculpe, é permitido apenas 1 voto por pessoa/ip";
					exit;
				}
			}

			// se passou nas validações grava o voto no banco
			$db = new mysql();
			$coisas = $db->inserir("enquete_voto", array(
				"data"=>"$time",
				"codigo_enquete"=>"$codigo_enquete",
				"codigo_resposta"=>"$voto",
				"ip"=>"$ip"
			));

			echo "Obrigao por votar!";
			exit;
		} else {
			echo "Preencha o campo de resposta!";
			exit;
		}

	}


	public function edicao_leitura(){

		$dados = array();
		$dados['_base'] = $this->_base();
		$dados['objeto'] = DOMINIO.$this->_controller.'/';
		$dados['controller'] = $this->_controller;
		$dados['_cod_usuario'] = $this->_cod_usuario;
		$dados['_sessao'] = $this->_sessao;
		$dados['_acesso'] = $this->_acesso;
		$dados['_nome_usuario'] = $this->_nome_usuario;


		// itens da inciial

		$chave = $this->_layout;

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($coisas->num_rows != 1){
			$this->_layout = "index";
			$this->irpara(DOMINIO);
		}
		$dados['data_pagina'] = $coisas->fetch_object();
		$codigo_pagina = $dados['data_pagina']->codigo;

		////////////////////////////////////////////////////////////////////////

		$cores = array();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo_pagina' ");
		while($data = $coisas->fetch_object()){
			$cores[$data->codigo] = $data->cor;
		}
		$dados['pagina_cores'] = $cores;

		////////////////////////////////////////////////////////////////////////

		$lista_layout = array();
		$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo_pagina' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);

			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo_pagina' ");
				$data = $coisas->fetch_object();

				if(isset($data->id)){
					if($data->ativo == 1){

						$lista_layout[$n]['id'] = $data->id;
						$lista_layout[$n]['codigo'] = $data->codigo;
						$lista_layout[$n]['titulo'] = $data->titulo;
						$lista_layout[$n]['tipo'] = $data->tipo;

						if($data->tipo == 'topo'){
							$topos = new model_topos();
							$lista_layout[$n]['conteudo'] = $topos->lista($data->codigo);
							$banners = new model_banners();
							$lista_layout[$n]['conteudo']['banners_topo'] = $banners->lista_simples('148713350186606');
						}

						if($data->tipo == 'rodape'){							
							$rodapes = new model_rodapes();
							$lista_layout[$n]['conteudo'] = $rodapes->lista($data->codigo);
						}

						$n++;
					}
				}
			}
		}

		//echo "<pre>"; print_r($lista_layout); echo "</pre>"; exit;
		$dados['layout_lista'] = $lista_layout;


		$codigo = $this->get('codigo');

		if(!$codigo){
			$this->irpara(DOMINIO);
		}


		$conexao = new mysql();
		$coisas_edicao = $conexao->Executar("SELECT * FROM revistajornal WHERE codigo='$codigo' ");
		$dados['data'] = $coisas_edicao->fetch_object();

		$revista_paginas = array();
		$n = 0;

		$conexao = new mysql();
		$coisas_edicao = $conexao->Executar("SELECT * FROM revistajornal_imagem WHERE codigo='$codigo' ORDER by pagina asc ");
		while($data_edicao = $coisas_edicao->fetch_object()){

			$revista_paginas[$n]['pagina'] = $data_edicao->pagina;
			$revista_paginas[$n]['imagem'] = PASTA_CLIENTE.'img_revistajornal_g/'.$data_edicao->imagem;

			$n++;
		}
		$dados['revista_paginas'] = $revista_paginas;

		//carrega view e envia dados para a tela
		$this->view('revista.detalhes', $dados);
	}


	public function iniciar_conversa(){

		$nome = $this->post('nome');
		$msg = $this->post('msg');

		if($msg AND $nome){

			$msg = "Nome: ".$nome.", ".$msg;
			$msg = str_replace("\n", " ", $msg);
			$msg = str_replace(PHP_EOL, "", $msg);

			$base = $this->_base();
			$fone = $base['texto']['156630113722300'];
			
			echo "
			<form id='enviaform' action='https://api.whatsapp.com/send' method='get' >
			<input type='hidden' name='phone' value='".$fone."' >
			<input type='hidden' name='text' value='".$msg."' >
			</form>
			<script type='text/javascript' src='".LAYOUT."js/jquery-2.2.4.min.js' ></script>
			<script>
			$(document).ready(function(){ $('#enviaform').submit(); });
			</script>
			";
			exit;

		} else {
			$this->msg('Preencha os dados para continuar');
			$this->irpara(DOMINIO);
		}

	}


	public function rastreamento_detalhes(){

		$refe = $this->post('rastreio_codigo');

		if($refe){

			$conexao = new mysql();
			$coisas = $conexao->Executar("SELECT * FROM rastreamento_objetos WHERE ref='$refe' ");

			if($coisas->num_rows == 0){

				echo "<div style='text-align:center; padding:10px;'>Nenhum item encontrado para essa consulta!</div>";
				exit;

			} else {

				$dados['data'] = $coisas->fetch_object();

				$statusob = "";

				if($dados['data']->status == 0){ $statusob = "Enviado"; }
				if($dados['data']->status == 1){ $statusob = "Em Trânsito"; }
				if($dados['data']->status == 2){ $statusob = "Extraviado"; }
				if($dados['data']->status == 3){ $statusob = "Recusado"; }
				if($dados['data']->status == 4){ $statusob = "Endereço não localizado"; }
				if($dados['data']->status == 5){ $statusob = "Entregue"; }

				$dados['status'] = $statusob;


				$itens = array();
				$n = 0;

				$atualizacao = date('d/m/Y', $dados['data']->data);

				$conexao = new mysql();
				$coisas_itens = $conexao->Executar("SELECT * FROM rastreamento_objetos_itens WHERE codigo='".$dados['data']->codigo."' ORDER by id asc ");
				while($data_itens = $coisas_itens->fetch_object()){

					$atualizacao = date('d/m/Y', $data_itens->data);						
					$itens[$n]['dia'] = date('d/m/Y', $data_itens->data);
					$itens[$n]['descricao'] = nl2br($data_itens->descricao);

					$n++;
				}

				$dados['atualizacao'] = $atualizacao;
				$dados['itens'] = $itens;

				$this->view('conteudo_rastreamento.detalhes', $dados);
			}

		} else {			

			echo "<div style='text-align:center; padding:10px;'>Informe o codigo para continuar!</div>";
			exit;

		}

	}


	public function cookies_aceitar(){
		$_SESSION['cookies'] = 'sim';
		echo "ok";
	}
	
}