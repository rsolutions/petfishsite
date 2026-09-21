<?php
Class model_banners extends model{

    public function lista($grupo){
		
    	$lista = array();
    	$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM banners_ordem WHERE codigo='$grupo' ORDER BY id desc limit 1");		
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);
						 
			foreach($order as $key => $value){
				
				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM banners WHERE id='$value' ");
				$data = $coisas->fetch_object();
				
				if(isset($data->imagem)){
					
					$lista[$n]['titulo'] = $data->titulo;
					$lista[$n]['imagem'] = PASTA_CLIENTE.'img_banners/'.$data->imagem;
					
					if($data->endereco){
						$lista[$n]['link'] = $data->endereco;
					} else {
						$lista[$n]['link'] = false;
					}

				$n++;
				}
				
			}
		}		
		$retorno['lista'] = $lista;
		
		// cores
		$layout = new model_layout();
		$retorno['cores'] = $layout->lista_cores($grupo);
  		
		return $retorno;
	}

	public function lista_simples($grupo){
		
    	$lista = array();
    	$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM banners_ordem WHERE codigo='$grupo' ORDER BY id desc limit 1");		
		$data_ordem = $exec->fetch_object();

		if(isset($data_ordem->data)){

			$order = explode(',', $data_ordem->data);
						 
			foreach($order as $key => $value){
				
				$conexao = new mysql();
				$coisas = $conexao->Executar("SELECT * FROM banners WHERE id='$value' ");
				$data = $coisas->fetch_object();
				
				if(isset($data->imagem)){
					
					$lista[$n]['titulo'] = $data->titulo;
					$lista[$n]['imagem'] = PASTA_CLIENTE.'img_banners/'.$data->imagem;
					
					if($data->endereco){
						$lista[$n]['link'] = $data->endereco;
					} else {
						$lista[$n]['link'] = false;
					}

				$n++;
				}
				
			}
		}
		
		return $lista;
	}


}