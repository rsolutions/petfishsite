<?php

class controller extends system {
	
	protected $_acesso = false;
	protected $_cod_usuario = false;
	protected $_dados_usuario = false;
	protected $_nome_usuario = 'Visitante';
	protected $_carrinho_itens = 0;
	protected $_sessao = false;
	
	protected function inicializacao(){ //inicialização
		
		if( isset($_SESSION['loja_acesso']) AND isset($_SESSION['loja_cod_usuario']) AND isset($_SESSION['loja_cod_sessao']) ) {
			
			// segurança
			// confere se é a mesma pessoa
			if($_SESSION['loja_acesso'] != TOKEN2){
				session_destroy();
				$this->irpara( DOMINIO );
			}
			
			$this->_acesso = $_SESSION['loja_acesso'];			
			$this->_cod_usuario = $_SESSION['loja_cod_usuario'];
			$this->_sessao = $_SESSION['loja_cod_sessao']; 
			
			// model_cadastro
			$cadastro = new model_cadastro();
			if(	$data = $cadastro->carrega($_SESSION['loja_cod_usuario']) ){
				
				if($data->tipo == 'F'){
					$nome_usuario = $data->fisica_nome;
				} else {
					$nome_usuario = $data->juridica_nome;
				}
				$this->_nome_usuario = $nome_usuario;

			} else {
				
				session_destroy();
				$this->msg('A sessão expirou!');
				$this->irpara(DOMINIO);
				exit;
				
			}
			
		} else {
			
			if(isset($_SESSION['loja_cod_sessao'])){

				$this->_sessao = $_SESSION['loja_cod_sessao'];

			} else {
				
				$_SESSION['loja_cod_sessao'] = $this->gera_codigo(); 
				$this->_sessao = $_SESSION['loja_cod_sessao'];
				
			}
			
		}

		// carrinho
		$carrinho = new model_carrinho();
		$this->_carrinho_itens = $carrinho->itens_carrinho($this->_sessao);

	}

	protected function autenticado(){ // caso a pagina tenha que estar logado

		if( isset($_SESSION['loja_acesso']) AND isset($_SESSION['loja_cod_usuario']) AND isset($_SESSION['loja_cod_sessao']) ) {
			
		} else {

			//pega ultima pagina acionada para login
			$url_endereco1 = $_SERVER['SERVER_NAME'];
			$url_endereco2 = $_SERVER['REQUEST_URI'];
			$pagina_acionada = $url_endereco1.$url_endereco2;	
			$_SESSION['ultima_pagina_acessada'] = $pagina_acionada;

			$this->irpara(DOMINIO.'autenticacao');
			exit;
		}

	}
	
	protected function _base(){
		
		$dados = array();
		$dados['libera_views'] = true;
		
		//detecta navegador 
		$navegador = new model_navegador();
		$dados['navegador'] = $navegador->nome();
		
		$dados['nome_usuario'] = $this->_nome_usuario;
		$dados['_acesso'] = $this->_acesso;
		
		//informações basicas de metan
		$db = new mysql();
		$config = $db->executar("select * from meta where id='1' ")->fetch_object();
		
		if($config->forcar_ssl == 1){
			if( isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ) { } else {
				$new_url = "https://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
				echo "<script>window.location='$new_url';</script>";
				exit;
			}
		}

		if($config->analytics){
			$dados['analytics'] = "
			<script async src='https://www.googletagmanager.com/gtag/js?id=".$config->analytics."'></script>
			<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', '".$config->analytics."');
			</script>
			";
		} else {
			$dados['analytics'] = "";
		}
		
		//imagens fixas
		$imagem = new model_imagem();
		$dados['favicon'] = $imagem->codigo('147193111415927');
		$dados['logo'] = $imagem->codigo('147796771992551');
		
		//carrega imagens do setadas no painel de controle
		$db = new mysql();
		$exec = $db->executar("select codigo, imagem from imagem ");
		while($data = $exec->fetch_object()){
			if($data->imagem){
				$dados['imagem'][$data->codigo] = PASTA_CLIENTE.'imagens/'.$data->imagem;
			} else {
				$dados['imagem'][$data->codigo] = '';
			}
		}

		//carrega textos do setadas no painel de controle
		$db = new mysql();
		$exec = $db->executar("select codigo, conteudo from textos ");
		while($data = $exec->fetch_object()){
			if($data->conteudo){
				$dados['texto'][$data->codigo] = $data->conteudo;
			} else {
				$dados['texto'][$data->codigo] = '';
			}
		}
		
		// redes sociais
		$dados['facebook'] = ""; 
		$redessociais = new model_redes_sociais(); 
		$dados['redessociais'] = $redessociais->lista();
		foreach ($dados['redessociais'] as $key => $value) {
			if( ($value['titulo'] == 'facebook') OR ($value['titulo'] == 'Facebook') ){
				$dados['facebook'] = $value['endereco'];
			}
		}
		
		// carrinho
		if($this->_carrinho_itens == 1){
			$dados['itens_carrinho'] = $this->_carrinho_itens.' Item';
		} else{
			$dados['itens_carrinho'] = $this->_carrinho_itens.' Itens';
		}
		
		//retorna para a pagina a array com todos as informações
		return $dados;
	}
	
	//carrega o html 
	protected function view( $arquivo, $vars = null ){
		
		if( is_array($vars) && count($vars) > 0){
			//transforma array em variavel
			//com prefixo
			//extract($vars, EXTR_PREFIX_ALL, 'htm_');
			//se ouver variaveis iguais adiciona prefixo
			extract($vars, EXTR_PREFIX_SAME, 'htm_');
		}
		
		$url_view = VIEWS."htm_".$arquivo.".php";
		
		if(!file_exists($url_view)){
			echo "Arquivo inválido (".$url_view.")";
			exit;
		} else {
			return require_once($url_view);
		}
		
	}
	
	//gera codigo que nunca se repete
	protected function gera_codigo(){
		return substr(time().rand(10000,99999),-15);
	}
	
	//confere se foi preenchido um campo post ou get
	protected function valida($var, $msg = null){
		if(!$var){
			if($msg){
				$this->msg($msg);
				$this->volta(1);
			} else {
				$this->msg('Preencha todos os campos e tente novamente!');
				$this->volta(1);
			}
		}
	}
	
}