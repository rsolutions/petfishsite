<?php

class topos extends controller {
	
	protected $_modulo_nome = "Layout - Topos";

	public function init(){
		$this->autenticacao();
		$this->nivel_acesso(124);
	}

	public function inicial(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		// Instancia
		$topos = new model_topos();
		$dados['lista'] = $topos->lista();	
		
		$this->view('layout_topos', $dados);
	}

	public function novo(){
		
		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Novo";

		$dados['aba_selecionada'] = "dados";

		$this->view('layout_topos.novo', $dados);
	}

	public function novo_grv(){
		
		$titulo = $this->post('titulo');
		$this->valida($titulo);

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir("layout_topos", array(
			"codigo"=>"$codigo",
			"titulo"=>"$titulo",
			"modelo"=>1
		));

		// adiciona cores
		$topos = new model_topos();
		$topos->adiciona_cores(1, $codigo);			

		// layout
		$layout = new model_layout();
		$tipo = "topo";
		$titulo_pagina = "Topo - $titulo";
		$layout->adicionar_pagina($codigo, $titulo_pagina, $tipo);
		
		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo);
	}

	public function alterar(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "Alterar";

		$codigo = $this->get('codigo');

		if(!$codigo){
			$this->msg('Erro!');
			$this->volta(1);
			exit;
		}

		$aba = $this->get('aba');
		if($aba){
			$dados['aba_selecionada'] = $aba;
		} else {
			$dados['aba_selecionada'] = 'dados';
		}

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_topos WHERE codigo='$codigo' ");
		$dados['data'] = $exec->fetch_object();

		$modelos = new model_topos();
		$dados['modelos'] = $modelos->modelos();
		
		$objeto_end = DOMINIO.$this->_controller.'/';
		
		function montaCategorias($id_pai, $topo_cod, $objeto_end){

			$lista = '';

			$conexao = new mysql();
			$exec = $conexao->Executar("SELECT * FROM layout_menu_ordem WHERE topo_codigo='$topo_cod' AND id_pai='$id_pai' ORDER BY id desc limit 1");
			$data_ordem = $exec->fetch_object();

			if(isset($data_ordem->data)){

				$order = explode(',', $data_ordem->data);

				$lista .= '<ol class="dd-list">';

				foreach($order as $key => $value){

					$conexao = new mysql();
					$coisas = $conexao->Executar("SELECT * FROM layout_menu WHERE id='$value' AND topo_codigo='$topo_cod' ");
					$data = $coisas->fetch_object();

					if(isset($data->titulo)){

						$lista .= '<li class="dd-item dd3-item" data-id="'.$value.'" >';

						$lista .= '
						<div class="dd-handle dd3-handle" ><i class="far fa-hand-rock"></i></div>
						<div class="dd3-content-editar" onClick="modal(\''.$objeto_end.'menu_alterar/codigo/'.$data->codigo.'/topo/'.$topo_cod.'\', \'Alterar Menu\');" ><i class="far fa-edit"></i></div>
						<div class="dd3-content-editar-imagem" onClick="modal(\''.$objeto_end.'menu_imagem/codigo/'.$data->codigo.'/topo/'.$topo_cod.'\', \'Alterar Imagem\');" ><i class="fa fa-image"></i></div>
						<div class="dd3-content">'.$data->titulo.'</div>';

						$lista .= montaCategorias($value, $topo_cod, $objeto_end);

						$lista .= '</li>';

					}
				}

				$lista .= '</ol>';
			}
			return $lista;
		}
		$lista = montaCategorias(0, $codigo, $objeto_end);		
		$dados['listamenu'] = $lista;


		// cores
		$cores = array();
		$n = 0;
		$db = new mysql();
		$exec_cores = $db->executar("SELECT * FROM layout_topos_cores_sel WHERE topo_codigo='$codigo' AND topo_modelo='".$dados['data']->modelo."' ");
		while($data_cores = $exec_cores->fetch_object()){

			$cores[$n]['id'] = $data_cores->id;
			$cores[$n]['titulo'] = $data_cores->titulo;
			$cores[$n]['cor'] = $data_cores->cor;

			$n++;
		}	
		$dados['cores'] = $cores;


		$this->view('layout_topos.alterar', $dados);
	}

	public function alterar_grv(){

		$codigo = $this->post('codigo');
		$titulo = $this->post('titulo');
		$modelo = $this->post('modelo'); 

		$this->valida($codigo);
		$this->valida($modelo);
		$this->valida($titulo);

		$db = new mysql();
		$db->alterar("layout_topos", array(
			"titulo"=>$titulo,
			"modelo"=>$modelo
		), " codigo='$codigo' ");
		
		// adiciona cores
		$topos = new model_topos();
		$topos->adiciona_cores($modelo, $codigo);	

		// layout
		$layout = new model_layout();
		$titulo_pagina = "Topo - $titulo";
		$layout->altera_paginas($codigo, $titulo_pagina);


		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo);		
	}

	public function alterar_cores_grv(){

		$codigo = $this->post('codigo');
		$modelo = $this->post('modelo');

		$this->valida($codigo);
		$this->valida($modelo);



		$db = new mysql();
		$exec_cores = $db->executar("SELECT * FROM layout_topos_cores WHERE topo_modelo='$modelo' ");
		while($data_cores = $exec_cores->fetch_object()){

			$db = new mysql();
			$exec_cores_sel = $db->executar("SELECT * FROM layout_topos_cores_sel WHERE topo_codigo='$codigo' AND topo_modelo='".$modelo."' AND cor_id='".$data_cores->id."' ");
			if($exec_cores_sel->num_rows == 0){
				$db = new mysql();
				$db->inserir("layout_topos_cores_sel", array(
					"topo_codigo"=>$codigo,
					"topo_modelo"=>$modelo,
					"cor_id"=>$data_cores->id,
					"titulo"=>$data_cores->titulo,
					"cor"=>$data_cores->cor
				));
			}
		}
		
		$db = new mysql();
		$exec_cores = $db->executar("SELECT * FROM layout_topos_cores_sel WHERE topo_codigo='$codigo' AND topo_modelo='".$modelo."' ");
		while($data_cores = $exec_cores->fetch_object()){

			$cor = $this->post_htm('cor_'.$data_cores->id);
			if($cor){
				$db = new mysql();
				$db->alterar("layout_topos_cores_sel", array(
					"cor"=>$cor
				), " id='$data_cores->id' ");
			}
		}
		
		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$codigo.'/aba/cores');		
	}

	public function apagar_topo(){

		$codigo = $this->get('codigo');

		if(!$codigo){
			$this->msg('Item inválido');
			$this->volta(1);
			exit;
		}

		$conexao = new mysql();
		$conexao->apagar("layout_topos", " codigo='$codigo' ");

		$conexao = new mysql();
		$conexao->apagar("layout_menu", " topo_codigo='$codigo' ");

		$conexao = new mysql();
		$conexao->apagar("layout_menu_ordem", " topo_codigo='$codigo' ");

		$conexao = new mysql();
		$conexao->apagar("layout_topos_cores_sel", " topo_codigo='$codigo' "); 

 		// layout
		$layout = new model_layout(); 
		$layout->apagar_pagina($codigo);

		$this->irpara(DOMINIO.$this->_controller.'/inicial');
	}
		
	public function menu_novo(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";
		
		$codigo = $this->get('codigo');
		if(!$codigo){
			echo "erro!";
			exit;
		}
		$dados['codigo_topo'] = $codigo;
		
		
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

		$this->view('layout_topos.menu.novo', $dados);
	}

	public function menu_novo_grv(){

		$topo_codigo = $this->post('topo_codigo');
		$titulo = $this->post('titulo');
		$categoria = $this->post('categoria');
		$destino = $this->post_htm('destino');

		$this->valida($titulo);
		$this->valida($topo_codigo);

		$codigo = $this->gera_codigo();

		$db = new mysql();
		$db->inserir("layout_menu", array(
			"codigo"=>"$codigo",
			"topo_codigo"=>"$topo_codigo",
			"titulo"=>"$titulo",
			"categoria"=>"$categoria",
			"endereco"=>"$destino"
		));

		$ultid = $db->ultimo_id();

		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM layout_menu_ordem where id_pai='0' AND topo_codigo='$topo_codigo' order by id desc limit 1");
		$data = $coisas->fetch_object();

		if(isset($data->data)){
			$novaordem = $data->data.",".$ultid;
		} else {
			$novaordem = $ultid;
		}

		$db = new mysql();
		$db->apagar("layout_menu_ordem", " topo_codigo='$topo_codigo' AND id_pai='0' ");

		$db = new mysql();
		$db->inserir("layout_menu_ordem", array(
			"topo_codigo"=>"$topo_codigo",
			"id_pai"=>"0",
			"data"=>"$novaordem"
		));

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');
	}

	public function menu_alterar(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";

		$codigo_topo = $this->get('topo');
		$codigo = $this->get('codigo');

		if(!$codigo_topo){
			echo "Erro!";
			exit;
		}
		if(!$codigo){
			echo "Erro!";
			exit;
		}

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_menu WHERE codigo='$codigo' ");
		$dados['data'] = $exec->fetch_object();

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

		$this->view('layout_topos.menu.alterar', $dados);
	}

	public function menu_alterar_grv(){

		$dados['_base'] = $this->base();

		$topo_codigo = $this->post('topo_codigo');
		$codigo = $this->post('codigo');
		$titulo = $this->post('titulo');
		$categoria = $this->post('categoria');
		$destino = $this->post_htm('destino');
		$visivel = $this->post('visivel');

		$this->valida($topo_codigo);
		$this->valida($codigo);
		$this->valida($titulo);

		$db = new mysql();
		$db->alterar("layout_menu", array(
			"titulo"=>"$titulo",
			"categoria"=>"$categoria",
			"endereco"=>"$destino",
			"visivel"=>"$visivel"
		), " codigo='$codigo' ");

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');
	}

	public function menu_apagar(){

		$topo_codigo = $this->get('topo_codigo');
		$codigo = $this->get('codigo');

		$this->valida($topo_codigo);
		$this->valida($codigo);

		function remove_menu_e_filhos($topo_codigo, $codigo){

			$db = new mysql();
			$exec = $db->executar("SELECT * FROM layout_menu WHERE codigo='$codigo' ");
			$data = $exec->fetch_object();

			// descobre o idpai

			$processo = 0;
			$db = new mysql();
			$exec_ordem = $db->executar("SELECT * FROM layout_menu_ordem WHERE topo_codigo='$topo_codigo' ");
			while($data_ordem = $exec_ordem->fetch_object()){
				if($processo == 0){
					$achou = 0;
					$explode = explode(',', $data_ordem->data);
					foreach ($explode as $key => $value) {
						if($data->id == $value){
							$achou = 1;
						}
					}
					if($achou == 1){
						$novaordem = "";
						$id_pai = $data_ordem->id_pai;
						foreach ($explode as $key_ordem => $value_ordem) {
							if($value_ordem != $data->id){
								$novaordem .= $value_ordem.",";
							}
						}
						$novaordem = substr($novaordem, 0, strlen($novaordem)-1);
						$processo = 1;
					}
				}
			}

			// verifica se tem filhos

			$db = new mysql();
			$exec_filhos = $db->executar("SELECT * FROM layout_menu_ordem WHERE id_pai='$data->id' ");
			if($exec_filhos->num_rows != 0){

				$data_filhos = $exec_filhos->fetch_object();

				$explode_filhos = explode(',', $data_filhos->data);
				foreach ($explode_filhos as $key_filhos => $value_filhos) {

					$db = new mysql();
					$exec_filho2 = $db->executar("SELECT codigo FROM layout_menu WHERE id='$value_filhos' ");
					$data_filho2 = $exec_filho2->fetch_object();

					if($data_filho2->codigo){
						remove_menu_e_filhos($topo_codigo, $data_filho2->codigo);
					}
				}
			}

			// altera ordem
			$db = new mysql();
			$db->apagar("layout_menu_ordem", " topo_codigo='$topo_codigo' AND id_pai='$id_pai' ");

			if($novaordem){
				$db = new mysql();
				$db->inserir("layout_menu_ordem", array(
					"topo_codigo"=>"$topo_codigo",
					"id_pai"=>"$id_pai",
					"data"=>"$novaordem"
				));
			}

			// remove 
			$db = new mysql();
			$db->apagar("layout_menu", " codigo='$codigo' ");

		}
		remove_menu_e_filhos($topo_codigo, $codigo);

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');
	}

	public function menu_salvar_ordem(){

		$topo_codigo = $this->post('topo_codigo');	
		$ordem = stripcslashes($_POST['ordem']);

		if($ordem AND $topo_codigo){

			$json = json_decode($ordem, true);

			function converte_array_para_banco($jsonArray, $topo, $id_pai = 0) {

				$lista = "";

				foreach ($jsonArray as $subArray) {

					$lista .= $subArray['id'].",";

					if (isset($subArray['children'])) {
						converte_array_para_banco($subArray['children'], $topo, $subArray['id']);
					} else {
						$pai_remover = $subArray['id'];
						$db = new mysql();
						$db->apagar("layout_menu_ordem", "  topo_codigo='$topo' AND id_pai='$pai_remover' ");
					}

				}

				$novaordem = substr($lista,0,-1);

				$db = new mysql();
				$db->apagar("layout_menu_ordem", "  topo_codigo='$topo' AND id_pai='$id_pai' ");

				$db = new mysql();
				$db->inserir("layout_menu_ordem", array(
					"topo_codigo"=>"$topo",
					"id_pai"=>"$id_pai",
					"data"=>"$novaordem"
				));

			}
			converte_array_para_banco($json, $topo_codigo, 0);

			$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');

		} else {
			$this->msg('Ocorreu um erro ao carregar ordem!');
			$this->volta(1);
		}

	}

	public function menu_imagem(){

		$dados['_base'] = $this->base();
		$dados['_titulo'] = $this->_modulo_nome;
		$dados['_subtitulo'] = "";

		$codigo = $this->get('codigo');
		$topo_codigo = $this->get('topo');

		if(!$codigo){
			echo "Iten inválido!";
			exit;
		}
		if(!$topo_codigo){
			echo "Iten inválido!";
			exit;
		}

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_menu WHERE codigo='$codigo' AND topo_codigo='$topo_codigo' ");
		$dados['data'] = $exec->fetch_object();

		$this->view('layout_topos.menu.imagem', $dados);
	}

	public function menu_imagem_grv(){

		$codigo = $this->post('codigo');
		$topo_codigo = $this->post('topo_codigo');

		$this->valida($codigo);
		$this->valida($topo_codigo);

		// carrega model
		$arquivos_imagens = new model_arquivos_imagens();

		if(!$arquivos_imagens->filtro($_FILES['arquivo'])){

			$this->msg('Arquivo com formato inválido ou inexistente!');
			$this->volta(1);

		} else {

			$arquivo_original = $_FILES['arquivo'];
			$tmp_name = $_FILES['arquivo']['tmp_name'];

			//// Definicao de Diretorios / 
			$diretorio = "../arquivos/imagens/";

			//pega a exteção
			$nome_original = $arquivo_original['name'];
			$extensao = $arquivos_imagens->extensao($nome_original);
			$nome_arquivo = $arquivos_imagens->trata_nome($nome_original);

			if(copy($tmp_name, $diretorio.$nome_arquivo)){

				$db = new mysql();
				$db->alterar("layout_menu", array(
					"imagem"=>$nome_arquivo
				), " codigo='$codigo' AND topo_codigo='$topo_codigo' ");

				$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');

			} else {

				$this->msg('Não foi possível copiar o arquivo!');
				$this->volta(1);

			}
		}
	}

	public function menu_imagem_apagar(){

		$codigo = $this->get('codigo');
		$topo_codigo = $this->get('topo_codigo');

		$this->valida($codigo);
		$this->valida($topo_codigo);

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_menu WHERE codigo='$codigo' AND topo_codigo='$topo_codigo' ");
		$data = $exec->fetch_object();

		if($data->imagem){
			unlink('../arquivos/imagens/'.$data->imagem);
		}

		$db = new mysql();
		$db->alterar("layout_menu", array(
			"imagem"=>""
		), " codigo='$codigo' AND topo_codigo='$topo_codigo' ");

		$this->irpara(DOMINIO.$this->_controller.'/alterar/codigo/'.$topo_codigo.'/aba/menu');
	}

}