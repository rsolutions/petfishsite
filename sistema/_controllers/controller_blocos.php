<?php

class blocos extends controller {
	
	protected $_modulo_nome = "Blocos";

	public function init(){
		$this->autenticacao();
		$this->nivel_acesso(121);
	}
	
	public function inicial(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		// Instancia
		$blocos = new model_blocos();
		$dados['lista'] = $blocos->lista();	
		
		$this->view('blocos', $dados);
	}	

	public function novo(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Novo";
		
		$dados['aba_selecionada'] = "dados";
		
		$this->view('blocos.novo', $dados);
	}
	
	public function novo_grv(){
		
		$titulo = $this->post('titulo');
		$this->valida($titulo);

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir("blocos", array(
			"codigo"=>"$codigo",
			"titulo"=>"$titulo",
			"posicao"=>1
		));

		// layout
		$layout = new model_layout();
		$tipo = "blocos";
		$titulo_pagina = "Bloco Informativo - $titulo";
		$layout->adicionar_pagina($codigo, $titulo_pagina, $tipo);
		$layout->adiciona_cores($tipo, $codigo);

		$this->irpara(DOMINIO.$this->_controller.'/alterar/aba/imagem/codigo/'.$codigo);
	}

	public function alterar(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Alterar";

		$codigo = $this->get('codigo');

		$aba = $this->get('aba');
		if($aba){
			$dados['aba_selecionada'] = $aba;
		} else {
			$dados['aba_selecionada'] = 'dados';
		}

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM blocos WHERE codigo='$codigo' ");
		$dados['data'] = $exec->fetch_object();
		
		$layout = new model_layout();
		$dados['cores'] = $layout->lista_cores($codigo);


		$destinos = array();
		$n = 0;

		$db = new mysql();
		$exec_des = $db->executar("SELECT * FROM layout_paginas order by titulo asc");
		while($data_des = $exec_des->fetch_object()){

			$destinos[$n]['titulo'] = $data_des->titulo;
			$destinos[$n]['chave'] = $data_des->chave;

			$n++;
		}
		$dados['destinos'] = $destinos;


		$this->view('blocos.alterar', $dados);
	}

	public function alterar_grv(){
		
		$id = $this->post('id');
		$codigo = $this->post('codigo');
		$titulo = $this->post('titulo');
		$mostrar_titulo = $this->post('mostrar_titulo');
		$tipo = $this->post('tipo');
		$posicao = $this->post('posicao');
		$descricao = $this->post_htm('descricao');
		$botao_titulo = $this->post('botao_titulo');
		$endereco = $this->post_htm('endereco'); 
		$imagem_fundo_tipo = $this->post('imagem_fundo_tipo');
		$endereco_padrao = $this->post('endereco_padrao');
		
		$this->valida($codigo);
		$this->valida($id);
		$this->valida($titulo);
		
		$db = new mysql();
		$db->alterar("blocos", array(
			"titulo"=>$titulo,
			"mostrar_titulo"=>$mostrar_titulo,
			"tipo"=>$tipo,
			"conteudo"=>$descricao,
			"posicao"=>$posicao,
			"endereco_padrao"=>$endereco_padrao,
			"endereco"=>$endereco,
			"botao_titulo"=>$botao_titulo,
			"imagem_fundo_tipo"=>$imagem_fundo_tipo
		), " codigo='".$codigo."' ");
		
		// layout
		$layout = new model_layout();
		$titulo_pagina = "Bloco Informativo - $titulo";
		$tipo = "blocos";
		$layout->altera_paginas($codigo, $titulo_pagina);
		$layout->adiciona_cores($tipo, $codigo);

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo);		
	}

	public function cores_grv(){

		$id = $this->post('id');
		$codigo = $this->post('codigo');

		$this->valida($codigo);
		$this->valida($id);

		$layout = new model_layout();
		$cores = $layout->lista_cores($codigo);
		foreach ($cores as $key => $value) {
			$cor_nova = $this->post('cor_'.$value['id']);
			if($cor_nova){
				$db = new mysql();
				$db->alterar("layout_itens_cores_sel", array(
					'cor'=>$cor_nova
				), " id='".$value['id']."' ");
			}
		}

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/cores');		
	}

	public function imagem(){

		$arquivo_original = $_FILES['arquivo'];
		$tmp_name = $_FILES['arquivo']['tmp_name'];

		//carrega model de gestao de imagens
		$arquivo = new model_arquivos_imagens();
		// Instancia
		$blocos = new model_blocos();		

		$codigo = $this->get('codigo');

		$diretorio = "../arquivos/img_blocos/";

		if(!$arquivo->filtro($arquivo_original)){ $this->msg('Arquivo com formato inválido ou inexistente!'); $this->volta(1); } else {

			//pega a exteção
			$nome_original = $arquivo_original['name'];
			$extensao = $arquivo->extensao($nome_original);
			$nome_arquivo  = $arquivo->trata_nome($nome_original);

			if(copy($tmp_name, $diretorio.$nome_arquivo)){

				if( ($extensao == "jpg") OR ($extensao == "jpeg") OR ($extensao == "JPG") OR ($extensao == "JPEG") ){

					$largura_g = 1200;
					$altura_g = $arquivo->calcula_altura_jpg($diretorio.$nome_arquivo, $largura_g);

					$arquivo->jpg($diretorio.$nome_arquivo, $largura_g , $altura_g , $diretorio.$nome_arquivo);
				}

				$db = new mysql();
				$db->alterar("blocos", array(
					"imagem"=>"$nome_arquivo"
				), " codigo='$codigo' ");

				$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/imagem');

			} else {

				$this->msg('Erro ao gravar imagem!');
				$this->irpara(DOMINIO.$this->_controller."/alterar/codigo/".$codigo."/aba/imagem");

			}

		}

	}

	public function apagar_imagem(){

		// Instancia
		$blocos = new model_blocos();

		$codigo = $this->get('codigo');

		if($codigo){

			$db = new mysql();
			$exec = $db->executar("SELECT * FROM blocos WHERE codigo='$codigo' ");
			$data = $exec->fetch_object();

			if($data->imagem){
				unlink('../arquivos/img_blocos/'.$data->imagem);
			}

			$db = new mysql();
			$db->alterar("blocos", array(
				"imagem"=>""
			), " codigo='$codigo' ");

		}

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/imagem');
	}

	public function imagem_fundo(){

		$arquivo_original = $_FILES['arquivo'];
		$tmp_name = $_FILES['arquivo']['tmp_name'];

		//carrega model de gestao de imagens
		$arquivo = new model_arquivos_imagens();
		// Instancia
		$blocos = new model_blocos();		

		$codigo = $this->get('codigo');

		$diretorio = "../arquivos/img_blocos/";

		if(!$arquivo->filtro($arquivo_original)){ $this->msg('Arquivo com formato inválido ou inexistente!'); $this->volta(1); } else {

			//pega a exteção
			$nome_original = $arquivo_original['name'];
			$extensao = $arquivo->extensao($nome_original);
			$nome_arquivo  = $arquivo->trata_nome($nome_original);

			if(copy($tmp_name, $diretorio.$nome_arquivo)){

				if( ($extensao == "jpg") OR ($extensao == "jpeg") OR ($extensao == "JPG") OR ($extensao == "JPEG") ){

					$largura_g = 1600;
					$altura_g = $arquivo->calcula_altura_jpg($diretorio.$nome_arquivo, $largura_g);

					$arquivo->jpg($diretorio.$nome_arquivo, $largura_g , $altura_g , $diretorio.$nome_arquivo);
				}

				$db = new mysql();
				$db->alterar("blocos", array(
					"imagem_fundo"=>"$nome_arquivo"
				), " codigo='$codigo' ");

				$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/imagem_fundo');

			} else {

				$this->msg('Erro ao gravar imagem!');
				$this->irpara(DOMINIO.$this->_controller."/alterar/codigo/".$codigo."/aba/imagem_fundo");

			}

		}

	}

	public function apagar_imagem_fundo(){

		// Instancia
		$blocos = new model_blocos();

		$codigo = $this->get('codigo');

		if($codigo){

			$db = new mysql();
			$exec = $db->executar("SELECT * FROM blocos WHERE codigo='$codigo' ");
			$data = $exec->fetch_object();

			if($data->imagem_fundo){
				unlink('../arquivos/img_blocos/'.$data->imagem_fundo);
			}

			$db = new mysql();
			$db->alterar("blocos", array(
				"imagem_fundo"=>""
			), " codigo='$codigo' ");

		}

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/imagem');
	}

	public function apagar_varios(){

		$blocos = new model_blocos();

		foreach ($blocos->lista() as $key => $value) {			 

			if($this->post('apagar_'.$value['id']) == 1){

				if($value['imagem']){
					unlink('../arquivos/img_blocos/'.$value['imagem']);
				}

				if($value['imagem_fundo']){
					unlink('../arquivos/img_blocos/'.$value['imagem_fundo']);
				}

				$db = new mysql();
				$db->apagar("blocos", " id='".$value['id']."' ");

				
				// layout
				$layout = new model_layout(); 
				$layout->apagar_pagina($value['codigo']);
				$layout->apagar_cores($value['codigo']);
			}

		}

		$this->irpara(DOMINIO.$this->_controller.'/inicial');
	}
}