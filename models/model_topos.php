<?php

Class model_topos extends model{

	public function lista($codigo){

		$retorno = array();		 

		$conexao = new mysql();
		$exec_topo = $conexao->Executar("SELECT * FROM layout_topos WHERE codigo='$codigo' ");
		$retorno['data_topo'] = $exec_topo->fetch_object();
		

		// cores 
		$cores = array();

		$db = new mysql();
		$exec_cores = $db->executar("select * FROM layout_topos_cores_sel WHERE topo_codigo='$codigo' AND topo_modelo='".$retorno['data_topo']->modelo."' order by id asc");
		while($data_cores = $exec_cores->fetch_object()){
			$cores[ $data_cores->cor_id ] = $data_cores->cor;
		}
		$retorno['cores']['lista'] = $cores;


		// cores detalhes
		$cores = array();
		$n = 0;

		$db = new mysql();
		$exec_cores = $db->executar("select * FROM layout_topos_cores_sel WHERE topo_codigo='$codigo' AND topo_modelo='".$retorno['data_topo']->modelo."' order by id asc");
		while($data_cores = $exec_cores->fetch_object()){
			$cores[$n]['tipo'] = "topo ". $retorno['data_topo']->modelo;
			$cores[$n]['id'] = $data_cores->cor_id;
			$cores[$n]['titulo'] = $data_cores->titulo;
			$cores[$n]['cor'] = $data_cores->cor;
			$n++;	
		}
		$retorno['cores']['detalhes'] = $cores;
		

		// menu
		$lista = $this->menu_pega_lista($codigo, 0);
		$retorno['menu'] = $this->menu_gerar($codigo, $lista);

		return $retorno;
	}

	public function menu_pega_lista($topo, $id){

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM layout_menu_ordem WHERE topo_codigo='$topo' AND id_pai='$id' ORDER BY id desc limit 1");
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){
			$retorno = explode(',', $data_ordem->data);
		} else {
			$retorno = array();
		}

		return $retorno;
	}

	public function menu_gerar($topo, $order){
		
		$lista = array();

		$n = 0;
		foreach($order as $key => $value){
			
			$conexao = new mysql();
			$coisas = $conexao->Executar("SELECT * FROM layout_menu WHERE id='$value' AND topo_codigo='$topo' ");
			$data = $coisas->fetch_object();

			if(isset($data->titulo)){
				if($data->visivel == 0){
					
					$array = explode('http', $data->endereco);
					$numero = count($array);
					
					$lista[$n]['codigo'] = $data->codigo;
					$lista[$n]['titulo'] = $data->titulo;
					$array_control = explode('/', $data->endereco);
					$lista[$n]['controller'] = $array_control[0];
					$lista[$n]['url'] = $data->endereco;
					$lista[$n]['categoria'] = $data->categoria;
					
					if($data->categoria){
						$titulo_link = str_replace(" ", "-", $data->titulo);
						$lista[$n]['destino'] = DOMINIO.'produtos/lista/cat_id/'.$data->categoria.'/categoria/'.$titulo_link;
					} else {
						
						$array = explode('http', $data->endereco);
						$numero = count($array);

						if($numero > 1){
							$lista[$n]['destino'] = $data->endereco;
						} else {
							$lista[$n]['destino'] = DOMINIO.$data->endereco;
						}

					}
					
					$lista[$n]['imagem'] = $data->imagem;
					$lista[$n]['banner'] = $data->banner;
					
					$array_sub = $this->menu_pega_lista($topo, $value);
					$lista[$n]['submenu'] = $this->menu_gerar($topo, $array_sub);
					
					$n++;
				}
			}
		}
		
		return $lista;
	}

}