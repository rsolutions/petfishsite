<?php

class programacao extends controller {
	
	protected $_modulo_nome = "Programação";

	public function init(){
		$this->autenticacao();
		$this->nivel_acesso(130);
	}
	
	public function inicial(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		$programacao = new model_programacao();
		$dados['lista_semana'] = $programacao->lista_semana();

		$dia = $this->get('dia');
		if(!$dia){
			$dia = date('w')+1;
		}

		$dados['dia_selecionado'] = $dia;
		$dados['lista'] = $programacao->lista($dia);

		$this->view('programacao', $dados);
	}


	public function novo(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Novo";
		
		$dados['aba_selecionada'] = "dados";
		
		$programacao = new model_programacao();
		$dados['lista_semana'] = $programacao->lista_semana();

		$this->view('programacao.novo', $dados);
	}

	public function novo_grv(){
		
		$programa = $this->post('programa');
		$apresentador = $this->post('apresentador');

		$dia = $this->post('dia');
		$inicio = $this->post('inicio');

		$this->valida($dia);
		$this->valida($inicio);
		$this->valida($programa);

		$hora_montada = "1984-08-22 ".$inicio.":00";
		$data_final = strtotime($hora_montada);

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir("programacao", array(
			"codigo"=>"$codigo",
			"dia"=>"$dia",
			"inicio"=>"$data_final",
			"programa"=>"$programa",
			"apresentador"=>"$apresentador"
		));

		$this->irpara(DOMINIO.$this->_controller.'/inicial/dia/'.$dia);	
	}
	
	public function alterar(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Alterar";
		
		$codigo = $this->get('codigo');

		$this->valida($codigo);

		$programacao = new model_programacao();
		$dados['lista_semana'] = $programacao->lista_semana();

		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM programacao where codigo='$codigo' ");
		$dados['data'] = $exec->fetch_object();


		$this->view('programacao.alterar', $dados);
	}
	
	public function alterar_grv(){
		
		$codigo = $this->post('codigo');
		
		$programa = $this->post('programa');
		$apresentador = $this->post('apresentador');
		
		$dia = $this->post('dia');
		$inicio = $this->post('inicio');
		
		$this->valida($codigo); 
		$this->valida($inicio);
		$this->valida($programa);
		
		$hora_montada = "1984-08-22 ".$inicio.":00";
		$data_final = strtotime($hora_montada);
		
		$db = new mysql();
		$db->alterar("programacao", array(
			"dia"=>"$dia",
			"inicio"=>"$data_final",
			"programa"=>"$programa",
			"apresentador"=>"$apresentador"
		), " codigo='$codigo' ");

		$this->irpara(DOMINIO.$this->_controller.'/inicial/dia/'.$dia);		
	}
	
	public function apagar_varios(){
		
		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM programacao ");
		while($data = $exec->fetch_object()){
			
			if($this->post('apagar_'.$data->id) == 1){ 
				
				$conexao = new mysql();
				$conexao->apagar("programacao", " codigo='$data->codigo' ");
				
			}
		}
		
		$this->irpara(DOMINIO.$this->_controller.'/inicial');		
	}

	public function player(){
		
		$dados['_base'] = $this->base(); 
 		
		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM programacao_player where id='1' ");
		$dados['data'] = $exec->fetch_object();
		

		$this->view('programacao.player', $dados);
	}

	public function player_grv(){
		 
		$status = $this->post('status'); 
		$endereco = $this->post_htm('endereco'); 
		
		$cor_fundo = $this->post_htm('cor_fundo');
		$cor_botao_fundo = $this->post_htm('cor_botao_fundo');
		$cor_botao_ico = $this->post_htm('cor_botao_ico');
		$cor_texto1 = $this->post_htm('cor_texto1');
		$cor_texto2 = $this->post_htm('cor_texto2');

		$cor_titulo_atual_fundo = $this->post_htm('cor_titulo_atual_fundo');
		$cor_titulo_atual_texto = $this->post_htm('cor_titulo_atual_texto');

		$cor_titulo_prox_fundo = $this->post_htm('cor_titulo_prox_fundo');
		$cor_titulo_prox_texto = $this->post_htm('cor_titulo_prox_texto');

		$this->valida($endereco);  
		
		$db = new mysql();
		$db->alterar("programacao_player", array(
			"endereco"=>"$endereco",
			"status"=>"$status",
			"cor_fundo"=>"$cor_fundo", 
			"cor_botao_ico"=>"$cor_botao_ico",
			"cor_texto1"=>"$cor_texto1",
			"cor_texto2"=>"$cor_texto2",
			"cor_titulo_atual_fundo"=>"$cor_titulo_atual_fundo",
			"cor_titulo_atual_texto"=>"$cor_titulo_atual_texto",
			"cor_titulo_prox_fundo"=>"$cor_titulo_prox_fundo",
			"cor_titulo_prox_texto"=>"$cor_titulo_prox_texto"
		), " id='1' ");

		
		$this->irpara(DOMINIO.$this->_controller);		
	}

	 

	// grupos


	public function grupos(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Grupos";

		// Instancia
		$programacao = new model_programacao();
		
		$dados['grupos'] = $programacao->lista_grupos();
		
		$this->view('programacao.grupos', $dados);
	}

	public function grupos_novo(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Novo Grupo";

		$this->view('programacao.grupos.novo', $dados);
	}

	public function grupos_novo_grv(){

		$titulo = $this->post('titulo'); 

		$this->valida($titulo);
		
		// Instancia
		$programacao = new model_programacao();

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir('programacao_grupos', array(
			'codigo'=>$codigo,
			'titulo'=>$titulo
		));
		
		// layout
		$layout = new model_layout();
		$tipo = "programacao";
		$titulo_pagina = "Programação - $titulo";
		$layout->adicionar_pagina($codigo, $titulo_pagina, $tipo);
		$layout->adiciona_cores($tipo, $codigo);


		$this->irpara(DOMINIO.$this->_controller.'/grupos');		
	}

	public function grupos_alterar(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Alterar Grupo";

 		// Instancia
		$programacao = new model_programacao();

		$codigo = $this->get('codigo');

		$dados['data'] = $programacao->carrega_grupo($codigo);

		$layout = new model_layout();
		$dados['cores'] = $layout->lista_cores($codigo);

		$this->view('programacao.grupos.alterar', $dados);
	}

	public function grupos_alterar_grv(){
		
		$codigo = $this->post('codigo');
		$titulo = $this->post('titulo');
		$mostrar_titulo = $this->post('mostrar_titulo');

		$itens_por_linha = $this->post('itens_por_linha');
		$descricao = $this->post_htm('descricao'); 

		$this->valida($codigo);
		$this->valida($titulo);

		$db = new mysql();
		$db->alterar("programacao_grupos", array(
			'titulo'=>$titulo,
			'mostrar_titulo'=>$mostrar_titulo,
			'descricao'=>$descricao
		), " codigo='$codigo' ");
		

		// layout

		$layout = new model_layout();
		$titulo_pgaina = "Programação - $titulo";
		$tipo = "programacao";
		$layout->altera_paginas($codigo, $titulo_pgaina);
		$layout->adiciona_cores($tipo, $codigo);

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

		$this->irpara(DOMINIO.$this->_controller.'/grupos');		
	}

	public function grupos_apagar(){
		
		// Instancia
		$programacao = new model_programacao();

		foreach ($programacao->lista_grupos() as $key => $value) {
			
			if($this->post('apagar_'.$value['id']) == $value['codigo']){
				
				$db = new mysql();
				$db->apagar('programacao_grupos', " codigo='".$value['codigo']."' ");
				
				// layout
				$layout = new model_layout(); 
				$layout->apagar_pagina($value['codigo']);
				$layout->apagar_cores($value['codigo']);
			}
		}

		$this->irpara(DOMINIO.$this->_controller.'/grupos');		
	}

//termina classe
}