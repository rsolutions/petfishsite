<?php

Class model_cadastro extends model{
    
    public function carrega($codigo){
    	
		$db = new mysql();
		$exec = $db->executar("select * from cadastro WHERE codigo='$codigo' ");
		$linhas = $exec->num_rows;
		
		if($linhas == 1){
			return $exec->fetch_object();
		} else {
			return false;
		}

	}
 
	
	
}