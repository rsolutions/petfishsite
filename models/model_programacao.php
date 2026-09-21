<?php

Class model_programacao extends model{
	
	public function lista($grupo){

		$retorno = array();		 

		$conexao = new mysql();
		$exec = $conexao->Executar("SELECT * FROM programacao_grupos WHERE codigo='$grupo' ");
		$data_grupo = $exec->fetch_object();
		
		$retorno['data_grupo'] = $data_grupo;

		// cores
		$layout = new model_layout();
		$retorno['cores'] = $layout->lista_cores($grupo);


		$lista = array();
		$n = 0;

		$lista_semana = $this->lista_semana();

		foreach ($lista_semana as $key => $value) {

			$lista[$n]['semana_id'] = $value['dia'];
			$lista[$n]['semana_codigo'] = $value['codigo'];
			$lista[$n]['semana_titulo'] = $value['titulo'];

			$lista_prog = array();
			$n2 = 0;

			$conexao = new mysql();
			$coisas = $conexao->Executar("SELECT * FROM programacao WHERE dia='".$value['codigo']."' ORDER BY inicio asc ");
			while($data = $coisas->fetch_object()){

				$lista_prog[$n2]['id'] = $data->id;
				$lista_prog[$n2]['codigo'] = $data->codigo;
				$lista_prog[$n2]['inicio'] = date('H:i', $data->inicio);
				$lista_prog[$n2]['programa'] = $data->programa;
				$lista_prog[$n2]['apresentador'] = $data->apresentador;

				$n2++;
			}

			$lista[$n]['semana_lista'] = $lista_prog;

			$n++;
		}

		$retorno['lista'] = $lista;


		return $retorno;
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


	public function atual(){

		$time = date('H:i');
		$hora_montada = "1984-08-22 ".$time.":00";
		//$hora_montada = "1984-08-22 23:16"; // simulacao

		$data_final = strtotime($hora_montada);

		$dia = date('w')+1;

		$db = new mysql();
		$exec = $db->executar("select * from programacao WHERE dia='$dia' AND inicio<='$data_final' order by inicio desc limit 1");

		$retorno = array();

		if($exec->num_rows == 1){

			$data = $exec->fetch_object();

			$retorno['programa'] = $data->programa;
			$retorno['apresentador'] = $data->apresentador;

		} else {

			if($dia == 1){
				$dia = 7;
			} else {
				$dia = $dia-1;
			}
			
			$db = new mysql();
			$exec = $db->executar("select * from programacao WHERE dia='$dia' order by inicio desc limit 1");
			if($exec->num_rows == 1){
				
				$data = $exec->fetch_object();
				
				$retorno['programa'] = $data->programa;
				$retorno['apresentador'] = $data->apresentador;

			} else {
				
				$retorno['programa'] = "";
				$retorno['apresentador'] = "";

			}
		}
		
		return $retorno;
	}

	public function proximo(){
		
		$time = date('H:i');
		$hora_montada = "1984-08-22 ".$time.":00";
		$data_final = strtotime($hora_montada);
		
		$retorno = array();
		$retorno['programa'] = '';
		$retorno['apresentador'] = '';

		$dia = date('w')+1;
		
		$db = new mysql();
		$exec = $db->executar("select * from programacao WHERE dia='$dia' AND inicio>='$data_final' order by inicio asc limit 2");
		$n = 0; 
		while($data = $exec->fetch_object()){
			if($n == 0){
				$retorno['programa'] = $data->programa;
				$retorno['apresentador'] = $data->apresentador;
			}
			$n++;
		}


		if(!$retorno['programa']){

			$dia = $dia+1;

			if($dia > 7){
				$dia = 1;
			}
			
			$db = new mysql();
			$exec = $db->executar("select * from programacao WHERE dia='$dia' order by inicio asc limit 2");
			$n = 0; 
			while($data = $exec->fetch_object()){
				if($n == 0){
					$retorno['programa'] = $data->programa;
					$retorno['apresentador'] = $data->apresentador;
				}
				$n++;
			}
		}
		
		return $retorno;
	}

}