<?php

Class model_cadastro_fone extends model{
	
	public function carregar($codigo){
		
		$retorno = array();
		
		$conexao = new mysql();
		$coisas = $conexao->Executar("SELECT * FROM cadastro_fone_grupos WHERE codigo='$codigo' ");
		$data = $coisas->fetch_object();
		
		$retorno['id'] = $data->id;
		$retorno['codigo'] = $data->codigo;
		$retorno['titulo'] = $data->titulo;
		$retorno['descricao'] = $data->descricao;
		
		$layout = new model_layout();
		$retorno['cores'] = $layout->lista_cores($codigo);
		
		return $retorno;
	}
}