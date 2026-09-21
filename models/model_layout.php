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
				$coisas = $conexao->Executar("SELECT * FROM layout_itens WHERE codigo='$value' AND pagina='$codigo' ");
				$data = $coisas->fetch_object();
				
				if(isset($data->titulo)){
					if($data->ativo == 1){
						$lista[$data->codigo]['codigo'] = $data->codigo;
						$lista[$data->codigo]['titulo'] = $data->titulo;
						$lista[$data->codigo]['tipo'] = $data->tipo;
					}
				}
			}
		}

		return $lista;
	}

	public function lista_cores($pagina){
		
		$cores = array();
		
		$conexao = new mysql();
		$coisas_cores = $conexao->Executar("SELECT * FROM layout_itens_cores_sel WHERE item_codigo='$pagina' ");
		while($data_cores = $coisas_cores->fetch_object()){
			$cores[$data_cores->cor_id] = $data_cores->cor;
		}

		$retorno['lista'] = $cores;
		$retorno['detalhes'] = $this->lista_cores_nome($pagina);
		
		return $retorno;
	}

	public function lista_cores_nome($pagina){
		
		$cores = array();
		$n = 0;
		
		$conexao = new mysql();
		$coisas_cores = $conexao->Executar("SELECT * FROM layout_itens_cores_sel WHERE item_codigo='$pagina' ");
		while($data_cores = $coisas_cores->fetch_object()){
			$cores[$n]['tipo'] = $data_cores->tipo;
			$cores[$n]['id'] = $data_cores->cor_id;
			$cores[$n]['titulo'] = $data_cores->titulo;
			$cores[$n]['cor'] = $data_cores->cor;
 			$n++;
		}
		
		return $cores;
	}
	
}