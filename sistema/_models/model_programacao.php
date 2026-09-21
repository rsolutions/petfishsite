<?php

Class model_programacao extends model{

	public function lista($grupo){

		$lista = array();
		$n = 0;

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM programacao WHERE dia='$grupo' ORDER BY inicio asc ");
		while($data = $exec->fetch_object()){

			$lista[$n]['id'] = $data->id;
			$lista[$n]['codigo'] = $data->codigo;
			$lista[$n]['inicio'] = date('H:i', $data->inicio);
			$lista[$n]['programa'] = $data->programa;
			$lista[$n]['apresentador'] = $data->apresentador;

			$n++;
		}

		return $lista;
	}

	///////////////////////////////////////////////////////////////////////////
	//

	public function carrega($codigo){
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM programacao where codigo='$codigo' ");
		return $exec->fetch_object();
	}


	public function lista_semana(){

		$categorias = array();

		$categorias[0]['dia'] = 0;
		$categorias[0]['codigo'] = 1;
		$categorias[0]['titulo'] = 'Domingo';

		$categorias[1]['dia'] = 1;
		$categorias[1]['codigo'] = 2;
		$categorias[1]['titulo'] = 'Segunda';

		$categorias[2]['dia'] = 2;
		$categorias[2]['codigo'] = 3;
		$categorias[2]['titulo'] = 'Terça';

		$categorias[3]['dia'] = 3;
		$categorias[3]['codigo'] = 4;
		$categorias[3]['titulo'] = 'Quarta';

		$categorias[4]['dia'] = 4;
		$categorias[4]['codigo'] = 5;
		$categorias[4]['titulo'] = 'Quinta';

		$categorias[5]['dia'] = 5;
		$categorias[5]['codigo'] = 6;
		$categorias[5]['titulo'] = 'Sexta';

		$categorias[6]['dia'] = 6;
		$categorias[6]['codigo'] = 7;
		$categorias[6]['titulo'] = 'Sábado';

		return $categorias;
	}

	///////////////////////////////////////////////////////////////////////////
	// GRUPOS

	public function lista_grupos(){

		$categorias = array();
		$i = 0;

		$db = new mysql();
		$exec = $db->executar("SELECT * FROM programacao_grupos order by titulo asc");		
		while($data = $exec->fetch_object()) {
			
			$categorias[$i]['id'] = $data->id;
			$categorias[$i]['codigo'] = $data->codigo;
			$categorias[$i]['titulo'] = $data->titulo;		 
			
			$i++;
		}
		return $categorias;
	}

	///////////////////////////////////////////////////////////////////////////
	//

	public function carrega_grupo($codigo){
		$db = new mysql();
		$exec = $db->executar("SELECT * FROM programacao_grupos where codigo='$codigo' ");
		return $exec->fetch_object();
	}

}