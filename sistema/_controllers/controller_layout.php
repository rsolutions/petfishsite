<?php

class layout extends controller {
	
	protected $_modulo_nome = "Layout";

	public function init(){
		$this->autenticacao();
		$this->nivel_acesso(80);
	}

	public function inicial(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		$lista = array();
		$n = 0;
		
		$site = str_replace("/sistema", "", DOMINIO);
		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_paginas ORDER BY id asc");
		while($data = $exec->fetch_object()){
			
			$lista[$n]['id'] = $data->id;
			$lista[$n]['codigo'] = $data->codigo;
			$lista[$n]['titulo'] = $data->titulo;
			$lista[$n]['url'] = $site.$data->chave;

			if($data->bloqueio == 1){
				$lista[$n]['status'] = 'Inativa';
			} else {
				$lista[$n]['status'] = 'OK';
			}

			$n++;
		}
		$dados['lista'] = $lista;
		
		$this->view('layout', $dados);
	}
	
	public function novo(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";

		$this->view('layout.paginas.nova', $dados);
	}	

	public function novo_grv(){

		$titulo = $this->post('titulo');
		$chave = $this->post('chave');
		
		$this->valida($titulo);
		$this->valida($chave);

		$chave = str_replace(" ", "", $chave);
		$chave = str_replace("/", "", $chave);
		$chave = str_replace("$", "", $chave);
		$chave = str_replace("&", "", $chave);

		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' ");
		if($exec->num_rows != 0){
			$this->msg('Este endereço já foi utilizado!');
			$this->volta(1);
		}

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir("layout_paginas", array(
			"codigo"=>"$codigo",
			"titulo"=>"$titulo",
			"chave"=>"$chave",
			"bloqueio"=>"0"
		));


		$layout = new model_layout();
		$lista_itens = $layout->lista_itens(1);

		$ordem_nova = "";
		
		foreach ($lista_itens as $key => $value) {	 
			
			$db = new mysql();
			$db->inserir("layout_itens", array(
				"codigo"=>$value['codigo'],
				"pagina"=>$codigo,
				"tipo"=>$value['tipo'],
				"titulo"=>$value['titulo'],
				"ativo"=>"0"
			));
			
			$ultid = $db->ultimo_id();
			$ordem_nova .= $ultid.',';
		}
		
		$db = new mysql();
		$db->inserir("layout_itens_ordem", array(
			"codigo"=>$codigo,
			"data"=>$ordem_nova
		));

		// cores
		
		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM layout_cores WHERE pagina='1' order by id asc ");
		while($data = $exec->fetch_object()){
			
			$db = new mysql();
			$db->inserir("layout_cores", array(
				"codigo"=>$data->id,
				"titulo"=>$data->titulo,
				"pagina"=>$codigo,
				"cor"=>$data->cor
			));
			
		}
		
		$this->irpara(DOMINIO.$this->_controller.'/inicial');
	}
	
	public function alterar(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		$codigo = $this->get('codigo');
		
		if(!$codigo){
			$this->msg('Página ínválida');
			$this->volta(1);
			exit;
		}
		
		if($this->get('aba')){
			$dados['aba_selecionada'] = $this->get('aba');
		} else {
			$dados['aba_selecionada'] = 'dados';
		}
		
		$layout = new model_layout();
		$dados['itens'] = $layout->lista_itens($codigo);
		
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_paginas WHERE codigo='$codigo' ");
		$dados['data'] = $exec->fetch_object();
		
		
		$listacores = array();
		$n_cores = 0;
		
		$db = new mysql();
		$exec_cores = $db->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo' order by id asc ");
		while($data_cores = $exec_cores->fetch_object()){
			
			$listacores[$n_cores]['id'] = $data_cores->id;
			$listacores[$n_cores]['codigo'] = $data_cores->codigo;
			$listacores[$n_cores]['titulo'] = $data_cores->titulo;
			$listacores[$n_cores]['cor'] = $data_cores->cor;

			$n_cores++;
		}

		$dados['listacores'] = $listacores;


		$this->view('layout.paginas.alterar', $dados);
	}

	public function alterar_grv(){

		$codigo = $this->post('codigo');
		$titulo = $this->post('titulo');
		$chave = $this->post('chave');
		$bloqueio = $this->post('bloqueio');

		$meta_titulo = $this->post('meta_titulo');
		$meta_descricao = $this->post('meta_descricao');

		$this->valida($codigo);
		$this->valida($chave);
		$this->valida($titulo);
		
		$chave = str_replace(" ", "", $chave);
		
		if($codigo == 1){
			$titulo = 'Principal';
			$chave = 'index';
			$bloqueio = 0;
		}
		
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_paginas WHERE codigo='$codigo' ");
		$data = $exec->fetch_object();

		if($data->fixa == 1){
			$chave = $data->chave;
		}

		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM layout_paginas WHERE chave='$chave' AND codigo!='$codigo' ");
		if($exec->num_rows != 0){
			$this->msg('Este endereço já foi utilizado!');
			$this->volta(1);
			exit();
		}

		$db = new mysql();
		$db->alterar("layout_paginas", array(
			"titulo"=>"$titulo",
			"chave"=>"$chave",
			"bloqueio"=>"$bloqueio",
			"meta_titulo"=>"$meta_titulo",
			"meta_descricao"=>"$meta_descricao"
		), " codigo='$codigo' ");
		
		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo);
	}

	public function alterar_itens_grv(){

		$codigo = $this->post('codigo');

		$this->valida($codigo);

		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM layout_itens WHERE pagina='$codigo' ");
		while($data = $exec->fetch_object()){
			
			$status = $this->post('ativo_'.$data->codigo);
			
			$conexao = new mysql();
			$conexao->alterar("layout_itens", array(
				"ativo"=>"$status"
			), " id='".$data->id."' ");
			
		}
		
		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/itens');
	}

	public function apagar_pagina(){

		$codigo = $this->get('codigo');
		
		if(!$codigo){
			$this->msg('Página inválida');
			$this->volta();
			exit;
		}
		
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_paginas WHERE codigo='$codigo' ");
		$data = $exec->fetch_object();
		
		if($data->fixa == 0){
			
			$conexao = new mysql();
			$conexao->apagar("layout_itens", " pagina='$codigo' AND pagina!='1' ");

			$conexao = new mysql();
			$conexao->apagar("layout_cores", " pagina='$codigo' AND pagina!='1' ");

			$conexao = new mysql();
			$conexao->apagar("layout_paginas", " codigo!='1' AND codigo='$codigo' ");

			$conexao = new mysql();
			$conexao->apagar("layout_itens_ordem", " codigo='$codigo' AND codigo!='1' ");
		}
		
		$this->irpara(DOMINIO.$this->_controller.'/inicial');
	}

	public function salvar_ordem(){

		$list = $_POST['list'];
		$codigo = $this->post('codigo');

		if($codigo AND $list){

			$output = array();
			parse_str($list, $output);
			$ordem = implode(',', $output['item']);

			$db = new mysql();
			$db->apagar("layout_itens_ordem", " codigo='$codigo' ");

			$db = new mysql();
			$db->inserir('layout_itens_ordem', array(
				"codigo"=>$codigo,
				"data"=>"$ordem"
			));
		}		
	}

	public function cores_grv(){

		$codigo = $this->post('pagina');

		if(!$codigo){
			$this->msg('Página inválida!');
			$this->volta(1);
		}

		$db = new mysql();
		$exec = $db->Executar("SELECT * FROM layout_cores WHERE pagina='$codigo' ");
		while($data = $exec->fetch_object()){

			$cor = $_POST['cor_'.$data->id];			 

			$conexao = new mysql();
			$conexao->alterar("layout_cores", array(
				"cor"=>"$cor"
			), " id='$data->id' ");

		}

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/cores');
	}

}