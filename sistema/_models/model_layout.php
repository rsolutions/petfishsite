<?php

Class model_layout extends model{

	public function lista_itens($codigo){
		
		$lista = array();
		$n = 0;
		
		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_itens_ordem WHERE codigo='$codigo' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();
		
		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);

			foreach($order as $key => $value){

				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE id='$value' AND pagina='$codigo' ");
				$data = $coisas->fetch_object();
				
				if(isset($data->titulo)){
					
					$lista[$n]['id'] = $data->id;
					$lista[$n]['codigo'] = $data->codigo;
					$lista[$n]['titulo'] = $data->titulo;
					$lista[$n]['ativo'] = $data->ativo;
					$lista[$n]['fixo'] = $data->fixo;
					$lista[$n]['tipo'] = $data->tipo;

					$n++;
				}
			}
		}

		return $lista;
	}

	////////////////////////////////////////////////////////////
	// para alteração dentro dos modulos

	public function adicionar_pagina($codigo, $titulo, $tipo){

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_paginas order by id desc ");
		while($data = $exec->fetch_object()){

			$db = new mysql();
			$db->inserir("layout_itens", array(
				"codigo"=>$codigo,
				"pagina"=>$data->codigo,
				"tipo"=>$tipo,
				"titulo"=>$titulo,
				"ativo"=>"0"
			));
			$ultid = $db->ultimo_id();

	 		//ordem
			$db = new mysql();
			$exec2 = $db->executar("SELECT * FROM layout_itens_ordem WHERE codigo='$data->codigo' order by id desc limit 1");
			$data2 = $exec2->fetch_object();

			if(isset($data2->data)){
				$novaordem = $data2->data.",".$ultid;
			} else {
				$novaordem = $ultid;
			}

			$db = new mysql();
			$db->apagar("layout_itens_ordem", " codigo='$data->codigo' ");

			$db = new mysql();
			$db->inserir("layout_itens_ordem", array(
				"codigo"=>$data->codigo,
				"data"=>$novaordem
			));

		}
	}

	public function altera_paginas($codigo, $titulo){

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_paginas order by id desc ");
		while($data = $exec->fetch_object()){
			
			$db = new mysql();
			$db->alterar("layout_itens", array(
				"titulo"=>$titulo
			), " codigo='".$codigo."' AND pagina='$data->codigo' ");
			
		}		
	}

	public function apagar_pagina($codigo){
		
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM layout_itens WHERE codigo='".$codigo."' order by id desc");
		while($data = $exec->fetch_object()){
			
			$db = new mysql();
			$exec_ordem = $db->executar("SELECT * FROM layout_itens_ordem WHERE codigo='$data->pagina' order by id desc");
			$data_ordem = $exec_ordem->fetch_object();
			
			$explode = explode(',',$data_ordem->data);
			$novaordem = "";
			foreach ($explode as $key_ordem => $value_ordem) {
				if($value_ordem != $data->id){
					$novaordem .= $value_ordem.",";
				}
			}
			$novaordem = substr($novaordem, 0, strlen($novaordem)-1);
			
			$db = new mysql();
			$db->apagar("layout_itens_ordem", " codigo='$data->pagina' ");

			$db = new mysql();
			$db->inserir("layout_itens_ordem", array(
				"codigo"=>$data->pagina,
				"data"=>"$novaordem"
			));
			
			$db = new mysql();
			$db->apagar("layout_itens", " id='$data->id' ");
			
		}
	}


	// cores


	public function adiciona_cores($tipo, $pagina){

		$conexao = new mysql();
		$coisas_cores = $conexao->Executar("SELECT * FROM layout_itens_cores WHERE tipo='$tipo' order by titulo asc ");
		while($data_cores = $coisas_cores->fetch_object()){

			$conexao = new mysql();
			$coisas = $conexao->Executar("SELECT * FROM layout_itens_cores_sel WHERE tipo='$tipo' AND item_codigo='$pagina' AND cor_id='$data_cores->id' ");
			if($coisas->num_rows == 0){

				$db = new mysql();
				$db->inserir("layout_itens_cores_sel", array(
					"item_codigo"=>$pagina,
					"tipo"=>$tipo,
					"cor_id"=>$data_cores->id,
					"titulo"=>$data_cores->titulo,
					"cor"=>$data_cores->cor
				));

			}		
		}
	}

	public function lista_cores($pagina){
		
		$lista = array();
		$n = 0;
		
		$conexao = new mysql();
		$coisas_cores = $conexao->Executar("SELECT * FROM layout_itens_cores_sel WHERE item_codigo='$pagina' ");
		while($data_cores = $coisas_cores->fetch_object()){
			
			$lista[$n]['id'] = $data_cores->id;
			$lista[$n]['titulo'] = $data_cores->titulo;
			$lista[$n]['cor'] = $data_cores->cor;

			$n++;
		}
		
		return $lista;
	}
	
	public function apagar_cores($item){
		$db = new mysql();
		$db->apagar("layout_itens_cores_sel", " item_codigo='$item' ");
	}
	
}