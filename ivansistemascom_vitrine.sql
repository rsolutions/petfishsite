-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 07/05/2024 às 01:38
-- Versão do servidor: 8.0.36
-- Versão do PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ivansistemascom_vitrine`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acordeon`
--

CREATE TABLE `acordeon` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `acordeon_grupos`
--

CREATE TABLE `acordeon_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `acordeon_ordem`
--

CREATE TABLE `acordeon_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_config`
--

CREATE TABLE `adm_config` (
  `id` int NOT NULL,
  `email_nome` varchar(255) NOT NULL,
  `email_origem` varchar(255) NOT NULL,
  `email_retorno` varchar(255) NOT NULL,
  `email_porta` int NOT NULL,
  `email_host` varchar(255) NOT NULL,
  `email_usuario` varchar(200) NOT NULL,
  `email_senha` varchar(200) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `atualizacoes` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_config`
--

INSERT INTO `adm_config` (`id`, `email_nome`, `email_origem`, `email_retorno`, `email_porta`, `email_host`, `email_usuario`, `email_senha`, `logo`, `atualizacoes`) VALUES
(1, 'Contato - HOST LOCAL site', 'contato@hostlocal.com.br', 'contato@hostlocal.com.br', 26, 'mail.hostlocal.com.br', 'contato@hostlocal.com.br', '', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_setores`
--

CREATE TABLE `adm_setores` (
  `id` int UNSIGNED NOT NULL,
  `id_pai` int DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL,
  `titulo_tecnico` varchar(200) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `ico` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_setores`
--

INSERT INTO `adm_setores` (`id`, `id_pai`, `titulo`, `titulo_tecnico`, `endereco`, `ico`) VALUES
(1, 0, 'Usuários', 'Usuários', 'usuarios', 'fas fa-users'),
(2, 0, 'Configurações', 'Configurações', 'config', 'fas fa-cogs'),
(126, 0, 'Contato', 'Contato', 'contato', 'far fa-comments'),
(37, 2, 'Smtp', 'Configurações - Smtp', '', ''),
(38, 2, 'Imagem Organização', 'Configurações - Imagem Organização', '', ''),
(28, 0, 'Imagens', 'Imagens', 'imagens', 'far fa-image'),
(46, 0, 'Redes Sociais', 'Redes Sociais', 'redes_sociais', 'fab fa-facebook'),
(80, 0, 'Layout - Páginas', 'Layout - Páginas', 'layout', 'fas fa-paint-brush'),
(88, 0, 'Textos', 'Textos', 'textos', 'fas fa-align-left'),
(93, 0, 'Dúvidas', 'Dúvidas', 'duvidas', 'fas fa-question-circle'),
(108, 0, 'Produtos', 'Produtos', 'planos', 'fas fa-dollar-sign'),
(124, 0, 'Layout - Topos', 'Layout - Topos', 'topos', 'fas fa-paint-brush'),
(125, 0, 'Layout - Rodapés', 'Layout - Rodapés', 'rodapes', 'fas fa-paint-brush'),
(118, 0, 'Widgets', 'Widgets', 'widgets', 'fas fa-code'),
(121, 0, 'Blocos', 'Blocos', 'blocos', 'fas fa-th-large');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_setores_ordem`
--

CREATE TABLE `adm_setores_ordem` (
  `id` int NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_setores_ordem`
--

INSERT INTO `adm_setores_ordem` (`id`, `usuario`, `data`) VALUES
(227, '1', '108,121,80,125,124,2,126,93,28,46,88,1,118');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_setores_perfil`
--

CREATE TABLE `adm_setores_perfil` (
  `id` int NOT NULL,
  `setor` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_setores_perfil`
--

INSERT INTO `adm_setores_perfil` (`id`, `setor`) VALUES
(110, '10056'),
(4, '85'),
(170, '52'),
(85, '10057'),
(8, '71'),
(111, '10072'),
(11, '10001'),
(12, '10000'),
(116, '1'),
(17, '10048'),
(55, '10063'),
(118, '2'),
(81, '10025'),
(88, '10065'),
(80, '10030'),
(113, '10081'),
(112, '10059'),
(104, '10039'),
(117, '3'),
(122, '7'),
(123, '6'),
(124, '9'),
(125, '10'),
(126, '18'),
(127, '14'),
(128, '12'),
(129, '16'),
(130, '15'),
(131, '11'),
(132, '17'),
(133, '20'),
(134, '21'),
(135, '22'),
(136, '23'),
(137, '24'),
(139, '28'),
(201, '58'),
(150, '29'),
(158, '30'),
(266, '44'),
(202, '35'),
(169, '46'),
(216, '36'),
(183, '61'),
(208, '69'),
(188, '48'),
(194, '42'),
(195, '54'),
(198, '25'),
(214, '4'),
(212, '68'),
(215, '5'),
(217, '32'),
(218, '33'),
(219, '55'),
(220, '40'),
(221, '39'),
(222, '57'),
(223, '34'),
(231, '37'),
(230, '38'),
(234, '88'),
(253, '100'),
(243, '80'),
(250, '98'),
(251, '97'),
(252, '99'),
(254, '90'),
(270, '27'),
(329, '121'),
(331, '91'),
(322, '126'),
(333, '109'),
(281, '101'),
(286, '112'),
(340, '108'),
(290, '114'),
(291, '115'),
(292, '116'),
(337, '111'),
(332, '107'),
(299, '117'),
(330, '70'),
(311, '125'),
(309, '123'),
(310, '124'),
(327, '120'),
(326, '128'),
(343, '93'),
(344, '127'),
(345, '82'),
(346, '83'),
(347, '119'),
(348, '118'),
(349, '113'),
(350, '105'),
(351, '129'),
(352, '130'),
(353, '131');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_setores_usuario`
--

CREATE TABLE `adm_setores_usuario` (
  `id` int UNSIGNED NOT NULL,
  `usuario` char(200) DEFAULT NULL,
  `setor` char(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_setores_usuario`
--

INSERT INTO `adm_setores_usuario` (`id`, `usuario`, `setor`) VALUES
(564, '151684786992902', '76'),
(563, '151684681732022', '82'),
(562, '151684681732022', '76'),
(565, '151684786992902', '80'),
(566, '151684786992902', '78'),
(567, '151684786992902', '27'),
(568, '155066921129611', '103'),
(569, '155066921129611', '83'),
(570, '155429487281823', '106'),
(571, '155429487281823', '70'),
(572, '155429487281823', '29'),
(573, '155429487281823', '27'),
(574, '155429487281823', '105'),
(575, '155429487281823', '88'),
(576, '158500225266470', '44'),
(577, '158500225266470', '70'),
(578, '158500225266470', '76'),
(579, '158500225266470', '91'),
(580, '158500225266470', '2'),
(581, '158500225266470', '77'),
(582, '158500225266470', '82'),
(583, '158500225266470', '52'),
(584, '158500225266470', '74'),
(585, '158500225266470', '75'),
(586, '158500225266470', '83'),
(587, '158500225266470', '38'),
(588, '158500225266470', '28'),
(589, '158500225266470', '110'),
(590, '158500225266470', '80'),
(591, '158500225266470', '36'),
(592, '158500225266470', '29'),
(593, '158500225266470', '78'),
(594, '158500225266470', '27'),
(595, '158500225266470', '73'),
(596, '158500225266470', '46'),
(597, '158500225266470', '105'),
(598, '158500225266470', '37'),
(599, '158500225266470', '88'),
(600, '158500225266470', '89'),
(601, '158500225266470', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm_usuario`
--

CREATE TABLE `adm_usuario` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `email_recuperacao` varchar(255) DEFAULT NULL,
  `usuario` char(255) DEFAULT NULL,
  `senha` char(255) DEFAULT NULL,
  `abre_fecha_menu` int DEFAULT NULL,
  `recuperacao` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `adm_usuario`
--

INSERT INTO `adm_usuario` (`id`, `codigo`, `nome`, `imagem`, `email_recuperacao`, `usuario`, `senha`, `abre_fecha_menu`, `recuperacao`) VALUES
(1, '1', 'Ivan Pedro', '', 'ivanpedro1997s@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', 0, '287abb19da8aadbd118443e92685853e');

-- --------------------------------------------------------

--
-- Estrutura para tabela `balcoes`
--

CREATE TABLE `balcoes` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text,
  `valor` double DEFAULT NULL,
  `uf` varchar(3) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `grupo_produtos` varchar(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `codigo`, `grupo`, `grupo_produtos`, `titulo`, `endereco`, `imagem`) VALUES
(111, '159421975529787', '159421971030200', NULL, 'teste 2', 'https://www.facebook.com', '6-[08-07-20][11-49-19].jpeg'),
(115, '159544396755082', '148713350186606', NULL, 'Banner teste', '', '8f7e5d45ad9574751428c45426393be-[22-07-20][15-52-53].png'),
(110, '159421971944030', '159421971030200', NULL, 'teste', '', '2-[08-07-20][11-48-47].jpg'),
(122, '161477982491575', '159421755016280', NULL, 'Banner1', '', 'baner1-fw-[18-05-21][11-34-51].png'),
(123, '161478084629319', '148841831030374', NULL, 'Anuncie', '', 'anuncie-[03-03-21][11-14-09].gif'),
(124, '161478086316986', '148713350186607', NULL, 'Anuncie', '', 'anuncie-[03-03-21][11-14-26].gif'),
(126, '161478124517800', '161478122985724', NULL, '24  Horas no Ar', '#', 'faixa-[03-03-21][11-20-48].png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners_grupos`
--

CREATE TABLE `banners_grupos` (
  `id` int UNSIGNED NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `bloqueio` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `banners_grupos`
--

INSERT INTO `banners_grupos` (`id`, `codigo`, `titulo`, `bloqueio`) VALUES
(17, '159421755016280', 'Banners Principais', NULL),
(11, '148713350186607', 'Banner Lateral Esquerda', 1),
(12, '148713351986017', 'PopUp', 1),
(13, '148841831030374', 'Banner Lateral Direita', 1),
(22, '148713350186606', 'Banners Topo', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners_ordem`
--

CREATE TABLE `banners_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `banners_ordem`
--

INSERT INTO `banners_ordem` (`id`, `codigo`, `data`) VALUES
(77, '148713350186606', '115,116'),
(85, '148841831030374', '112,113,123'),
(71, '159421971030200', '110,111'),
(83, '148713351986017', '117,121'),
(84, '159421755016280', '120,108,122'),
(87, '148713350186607', '114,124,125'),
(88, '161478122985724', '126');

-- --------------------------------------------------------

--
-- Estrutura para tabela `blocos`
--

CREATE TABLE `blocos` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT NULL,
  `tipo` int DEFAULT '0',
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL,
  `imagem_fundo` varchar(255) DEFAULT NULL,
  `posicao` int DEFAULT NULL,
  `endereco_padrao` varchar(255) DEFAULT NULL,
  `endereco` text,
  `botao_titulo` varchar(255) DEFAULT NULL,
  `imagem_fundo_tipo` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `blocos`
--

INSERT INTO `blocos` (`id`, `codigo`, `titulo`, `mostrar_titulo`, `tipo`, `conteudo`, `imagem`, `imagem_fundo`, `posicao`, `endereco_padrao`, `endereco`, `botao_titulo`, `imagem_fundo_tipo`) VALUES
(136, '162775444249736', 'Topo Inicial', 0, 0, '<p style=\"text-align:center\"><br />\r\n<br />\r\n<br />\r\n<br /><br />\r\n<span style=\"font-size:48px\">S&Atilde;O MAIS DE <strong>70 SITES PRONTOS</strong></span><br />\r\n<span style=\"font-size:24px\">Economize tempo em seus projetos com nossos <strong>Sites Prontos.<br />\r\nLojas Virtuais, Sites, Scripts Prontos e muito mais...</strong></span><br />\r\n<br /><br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n', NULL, 'programador-[31-07-21][15-45-15]-[25-11-21][08-21-32].jpg', 1, '', '', '', 0),
(137, '162775766818789', 'Topo Inicial 2', 0, 0, '<p style=\"text-align:center\"><span style=\"font-size:36px\">S&atilde;o dezenas de <strong>Sites Prontos </strong>feitos com <i class=\"fa fa-heart fa-1x\" aria-hidden=\"true\"></i> para voc&ecirc;.</span><br />\r\n<span style=\"font-size:26px\">Economize Tempo e Esfor&ccedil;o de Programa&ccedil;&atilde;o em seus projetos.</span></p>\r\n', NULL, NULL, 1, '', '', '', 0),
(138, '162775812958229', 'A Internet mudou o Mercado. E continua mudando.', 0, 0, '<p style=\"text-align:center\"><span style=\"font-size:36px\">A Internet mudou o mercado, e continua mudando.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\">Atualmente, ter um Site deixou de ser um privil&eacute;gio de poucos e tornou-se essencial para qualquer empresa e profissional<br />\r\nliberal destacar seus servi&ccedil;os e diferenciais.<br />\r\nP&aacute;gina Virtual Din&acirc;mica ou Sst&aacute;tica, que tem como principal objetivo fazer a divulga&ccedil;&atilde;o da empresa, sendo o cart&atilde;o de visitas<br />\r\nno mundo virtual e a porta de entrada para bons neg&oacute;cios.<br />\r\nPortanto fazer um Site Funcional e que atenda tantos as necessidades do cliente quanto do seu p&uacute;blico-alvo &eacute; primordial para<br />\r\nmanter o bom relacionamento e na conquista de novos clientes.</span></p>\r\n', '', NULL, 3, '', '', '', 0),
(142, '163743932087538', 'Instalação  via Cpanel', 1, 2, '<p>O cliente deve fornecer acesso ao cpanel para instala&ccedil;&atilde;o do script...</p>\r\n\r\n<div class=\"alert alert-danger\">Recomendado fortemente os servidores Linux com Cpanel.<br />\r\nSe voc&ecirc; n&atilde;o tiver hospedagem, entre em contato conosco.<br />\r\nNossos servidores s&atilde;o otimizados para nossos produtos, completo ioncube loader e SSL incluso.</div>\r\n\r\n<div class=\"alert alert-warning\">\r\n<p><strong>Garantia de Funcionamento somente para hospedagem com:</strong></p>\r\n\r\n<h4>REQUISITOS PARA INSTALA&Ccedil;&Atilde;O:</h4>\r\n\r\n<p>&ndash; Servidor Linux com cPanel da (<a class=\"alert-link\" href=\"https://cpanel.com/\" rel=\"noopener noreferrer\" target=\"_blank\">cpanel.com</a>)<br />\r\n<a class=\"alert-link\" href=\"https://www.php.net/releases/7_0_0.php\" rel=\"noopener noreferrer\" target=\"_blank\">&ndash; PHP 5.6</a> a <a class=\"alert-link\" href=\"https://www.php.net/releases/7_3_0.php\" rel=\"noopener noreferrer\" target=\"_blank\">&ndash; PHP 7.3</a><br />\r\n<a class=\"alert-link\" href=\"https://www.mysql.com/\" rel=\"noopener noreferrer\" target=\"_blank\">&ndash; MySQL</a><br />\r\n<a class=\"alert-link\" href=\"https://www.apache.org/\" rel=\"noopener noreferrer\" target=\"_blank\">&ndash; Apache</a><br />\r\n<a class=\"alert-link\" href=\"https://www.phpmyadmin.net/\" rel=\"noopener noreferrer\" target=\"_blank\">&ndash; phpMyAdmin</a></p>\r\n</div>\r\n\r\n<div class=\"alert alert-danger\">\r\n<h4>IMPORTANTE:</h4>\r\n\r\n<p>N&atilde;o tem como garantir o funcionamento fora desses requisitos acima.<br />\r\n(N&atilde;o tem garantia de funcionamento na <strong>Hostinger</strong> ou em hospedagem sem o <a class=\"alert-link\" href=\"https://cpanel.com/\" rel=\"noopener noreferrer\" target=\"_blank\">cpanel.com</a>).</p>\r\n</div>\r\n\r\n<div class=\"alert alert-info\">\r\n<h4>&gt;&gt; ENTREGA: ===========================</h4>\r\n\r\n<p>&ndash; Entrega imediata ap&oacute;s confirma&ccedil;&atilde;o do Pagamento!<br />\r\n&ndash; Download dispon&iacute;vel via link ou no pr&oacute;prio WhatsApp do cliente.</p>\r\n</div>\r\n', 'cPanel-logo-blue-[19-1-21][21-27-35]-[20-11-21][17-24-01].png', 'cPanel-logo-blue-[19-1-21][21-27-35]-[20-11-21][17-22-20].png', 1, '', 'https://api.whatsapp.com/send?phone=5562994524747&text=Olá Divino Silva, eu quero agenda a instalação do meu script.', 'Agenda Instalação', 0),
(139, '162776234739093', 'Topo Modelos de Sites', 0, 0, '<p style=\"text-align: center;\"><br />\r\n<span style=\"font-size:36px\">Modelos de <strong>Sites Prontos</strong></span></p>\r\n', NULL, NULL, 1, '', '', '', 0),
(140, '163736726328918', 'Instalação Grátis via Cpanel', 0, 1, '<p style=\"text-align:center\"><br />\r\n<span style=\"font-size:38px\">Como funciona a <strong>Instala&ccedil;&atilde;o via Cpanel</strong></span></p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"font-size:26px\">Com php 5.6 acima</span></h2>\r\n', '', 'baner-2-digital-para-empresas-[20-1-21][15-27-06]-[25-11-21][08-23-37].jpg', 4, '', '/instalacao-via-capnel', 'Mais Detalhes', 0),
(141, '163736854395321', 'Pagamento por PIX', 0, 2, '<p style=\"text-align:center\"><br />\r\n<span style=\"font-size:20px\"><span style=\"font-family:tahoma,geneva,sans-serif\">Agora voc&ecirc; pode pagar com <strong>PIX</strong>, S&oacute; copiar a chave tipo celular&nbsp;colar &eacute; realizar o pagamento, depois confirme clicando aqui para enviar o comprovante.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:20px\"><span style=\"font-family:tahoma,geneva,sans-serif\"><strong>PIX Celular</strong>: 11961817094</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'pix-[20-11-21][16-53-12].png', 'pix-digital-fw-fw-[2-1-21][16-0-35]-[25-11-21][08-22-28].png', 4, '', 'https://api.whatsapp.com/send?phone=5511961817094&text=Olá Script Livre, eu quero confirma meu Pagamento.', 'Confirmar Pagamento', 0),
(143, '164795573441018', 'info-Hospedagem', 0, 0, '<p style=\"text-align:center\"><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<span style=\"font-size:32px\">ATIVA&Ccedil;&Atilde;O AUTOMATIZADA, <strong>F&Aacute;CIL E R&Aacute;PIDA! PLATAFORMA CPANEL.</strong></span><br />\r\n<span style=\"font-size:18px\">Servi&ccedil;o essencial para quem deseja ter uma p&aacute;gina pessoal ou comercial na internet. <br />Com servidores de alta performance e pain&eacute;is de f&aacute;cil navega&ccedil;&atilde;o e com gerenciamento totalmente gratuito. <br />Utilizamos as mais modernas ferramentas de prote&ccedil;&atilde;o existente no mercado, entre elas, firewall f&iacute;sico dedicado, e v&aacute;rias aplica&ccedil;&otilde;es que protegem os centros de dados e os servidores, proporcionando seguran&ccedil;a a seus dados hospedados.</span><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n', '', '', 1, '', '', '', 0),
(145, '164797508296440', 'As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 0, 0, '<p style=\"text-align:center\"><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<span style=\"color:#530488\"><span style=\"font-size:48px\">As Principais formas de pagamento Cart&otilde;es, Pix, e Boleto Banc&aacute;rio</span></span><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n', NULL, 'Logo-PIX-[22-03-22][15-56-20].svg', 1, '', '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `tipo` varchar(2) DEFAULT NULL,
  `fisica_nome` varchar(255) DEFAULT NULL,
  `fisica_sexo` varchar(20) DEFAULT NULL,
  `fisica_nascimento` int DEFAULT NULL,
  `fisica_cpf` varchar(100) DEFAULT NULL,
  `fisica_rg` varchar(100) DEFAULT NULL,
  `fisica_celular` varchar(100) DEFAULT NULL,
  `juridica_nome` varchar(255) DEFAULT NULL,
  `juridica_razao` varchar(255) DEFAULT NULL,
  `juridica_responsavel` varchar(255) DEFAULT NULL,
  `juridica_cnpj` varchar(100) DEFAULT NULL,
  `juridica_ie` varchar(255) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_comentarios`
--

CREATE TABLE `cadastro_comentarios` (
  `id` int NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `cadastro` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `comentario` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cadastro_comentarios`
--

INSERT INTO `cadastro_comentarios` (`id`, `usuario`, `cadastro`, `data`, `comentario`) VALUES
(5, '1', '158352662414003', 1583526723, 'gfhfgh');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_email`
--

CREATE TABLE `cadastro_email` (
  `id` int UNSIGNED NOT NULL,
  `nome` char(200) DEFAULT NULL,
  `email` char(200) DEFAULT NULL,
  `grupo_codigo` varchar(255) DEFAULT NULL,
  `grupo_titulo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_email_grupos`
--

CREATE TABLE `cadastro_email_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_fone`
--

CREATE TABLE `cadastro_fone` (
  `id` int UNSIGNED NOT NULL,
  `nome` char(200) DEFAULT NULL,
  `fone` char(100) DEFAULT NULL,
  `grupo_codigo` varchar(255) DEFAULT NULL,
  `grupo_titulo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_fone_grupos`
--

CREATE TABLE `cadastro_fone_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_grupos`
--

CREATE TABLE `cadastro_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caracteristicas_grupos`
--

CREATE TABLE `caracteristicas_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caracteristicas_ordem`
--

CREATE TABLE `caracteristicas_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `uf` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `estado`, `uf`) VALUES
(1, 'Afonso Cláudio', 8, 'ES'),
(2, 'Água Doce do Norte', 8, 'ES'),
(3, 'Águia Branca', 8, 'ES'),
(4, 'Alegre', 8, 'ES'),
(5, 'Alfredo Chaves', 8, 'ES'),
(6, 'Alto Rio Novo', 8, 'ES'),
(7, 'Anchieta', 8, 'ES'),
(8, 'Apiacá', 8, 'ES'),
(9, 'Aracruz', 8, 'ES'),
(10, 'Atilio Vivacqua', 8, 'ES'),
(11, 'Baixo Guandu', 8, 'ES'),
(12, 'Barra de São Francisco', 8, 'ES'),
(13, 'Boa Esperança', 8, 'ES'),
(14, 'Bom Jesus do Norte', 8, 'ES'),
(15, 'Brejetuba', 8, 'ES'),
(16, 'Cachoeiro de Itapemirim', 8, 'ES'),
(17, 'Cariacica', 8, 'ES'),
(18, 'Castelo', 8, 'ES'),
(19, 'Colatina', 8, 'ES'),
(20, 'Conceição da Barra', 8, 'ES'),
(21, 'Conceição do Castelo', 8, 'ES'),
(22, 'Divino de São Lourenço', 8, 'ES'),
(23, 'Domingos Martins', 8, 'ES'),
(24, 'Dores do Rio Preto', 8, 'ES'),
(25, 'Ecoporanga', 8, 'ES'),
(26, 'Fundão', 8, 'ES'),
(27, 'Governador Lindenberg', 8, 'ES'),
(28, 'Guaçuí', 8, 'ES'),
(29, 'Guarapari', 8, 'ES'),
(30, 'Ibatiba', 8, 'ES'),
(31, 'Ibiraçu', 8, 'ES'),
(32, 'Ibitirama', 8, 'ES'),
(33, 'Iconha', 8, 'ES'),
(34, 'Irupi', 8, 'ES'),
(35, 'Itaguaçu', 8, 'ES'),
(36, 'Itapemirim', 8, 'ES'),
(37, 'Itarana', 8, 'ES'),
(38, 'Iúna', 8, 'ES'),
(39, 'Jaguaré', 8, 'ES'),
(40, 'Jerônimo Monteiro', 8, 'ES'),
(41, 'João Neiva', 8, 'ES'),
(42, 'Laranja da Terra', 8, 'ES'),
(43, 'Linhares', 8, 'ES'),
(44, 'Mantenópolis', 8, 'ES'),
(45, 'Marataízes', 8, 'ES'),
(46, 'Marechal Floriano', 8, 'ES'),
(47, 'Marilândia', 8, 'ES'),
(48, 'Mimoso do Sul', 8, 'ES'),
(49, 'Montanha', 8, 'ES'),
(50, 'Mucurici', 8, 'ES'),
(51, 'Muniz Freire', 8, 'ES'),
(52, 'Muqui', 8, 'ES'),
(53, 'Nova Venécia', 8, 'ES'),
(54, 'Pancas', 8, 'ES'),
(55, 'Pedro Canário', 8, 'ES'),
(56, 'Pinheiros', 8, 'ES'),
(57, 'Piúma', 8, 'ES'),
(58, 'Ponto Belo', 8, 'ES'),
(59, 'Presidente Kennedy', 8, 'ES'),
(60, 'Rio Bananal', 8, 'ES'),
(61, 'Rio Novo do Sul', 8, 'ES'),
(62, 'Santa Leopoldina', 8, 'ES'),
(63, 'Santa Maria de Jetibá', 8, 'ES'),
(64, 'Santa Teresa', 8, 'ES'),
(65, 'São Domingos do Norte', 8, 'ES'),
(66, 'São Gabriel da Palha', 8, 'ES'),
(67, 'São José do Calçado', 8, 'ES'),
(68, 'São Mateus', 8, 'ES'),
(69, 'São Roque do Canaã', 8, 'ES'),
(70, 'Serra', 8, 'ES'),
(71, 'Sooretama', 8, 'ES'),
(72, 'Vargem Alta', 8, 'ES'),
(73, 'Venda Nova do Imigrante', 8, 'ES'),
(74, 'Viana', 8, 'ES'),
(75, 'Vila Pavão', 8, 'ES'),
(76, 'Vila Valério', 8, 'ES'),
(77, 'Vila Velha', 8, 'ES'),
(78, 'Vitória', 8, 'ES'),
(79, 'Acrelândia', 1, 'AC'),
(80, 'Assis Brasil', 1, 'AC'),
(81, 'Brasiléia', 1, 'AC'),
(82, 'Bujari', 1, 'AC'),
(83, 'Capixaba', 1, 'AC'),
(84, 'Cruzeiro do Sul', 1, 'AC'),
(85, 'Epitaciolândia', 1, 'AC'),
(86, 'Feijó', 1, 'AC'),
(87, 'Jordão', 1, 'AC'),
(88, 'Mâncio Lima', 1, 'AC'),
(89, 'Manoel Urbano', 1, 'AC'),
(90, 'Marechal Thaumaturgo', 1, 'AC'),
(91, 'Plácido de Castro', 1, 'AC'),
(92, 'Porto Acre', 1, 'AC'),
(93, 'Porto Walter', 1, 'AC'),
(94, 'Rio Branco', 1, 'AC'),
(95, 'Rodrigues Alves', 1, 'AC'),
(96, 'Santa Rosa do Purus', 1, 'AC'),
(97, 'Sena Madureira', 1, 'AC'),
(98, 'Senador Guiomard', 1, 'AC'),
(99, 'Tarauacá', 1, 'AC'),
(100, 'Xapuri', 1, 'AC'),
(101, 'Água Branca', 2, 'AL'),
(102, 'Anadia', 2, 'AL'),
(103, 'Arapiraca', 2, 'AL'),
(104, 'Atalaia', 2, 'AL'),
(105, 'Barra de Santo Antônio', 2, 'AL'),
(106, 'Barra de São Miguel', 2, 'AL'),
(107, 'Batalha', 2, 'AL'),
(108, 'Belém', 2, 'AL'),
(109, 'Belo Monte', 2, 'AL'),
(110, 'Boca da Mata', 2, 'AL'),
(111, 'Branquinha', 2, 'AL'),
(112, 'Cacimbinhas', 2, 'AL'),
(113, 'Cajueiro', 2, 'AL'),
(114, 'Campestre', 2, 'AL'),
(115, 'Campo Alegre', 2, 'AL'),
(116, 'Campo Grande', 2, 'AL'),
(117, 'Canapi', 2, 'AL'),
(118, 'Capela', 2, 'AL'),
(119, 'Carneiros', 2, 'AL'),
(120, 'Chã Preta', 2, 'AL'),
(121, 'Coité do Nóia', 2, 'AL'),
(122, 'Colônia Leopoldina', 2, 'AL'),
(123, 'Coqueiro Seco', 2, 'AL'),
(124, 'Coruripe', 2, 'AL'),
(125, 'Craíbas', 2, 'AL'),
(126, 'Delmiro Gouveia', 2, 'AL'),
(127, 'Dois Riachos', 2, 'AL'),
(128, 'Estrela de Alagoas', 2, 'AL'),
(129, 'Feira Grande', 2, 'AL'),
(130, 'Feliz Deserto', 2, 'AL'),
(131, 'Flexeiras', 2, 'AL'),
(132, 'Girau do Ponciano', 2, 'AL'),
(133, 'Ibateguara', 2, 'AL'),
(134, 'Igaci', 2, 'AL'),
(135, 'Igreja Nova', 2, 'AL'),
(136, 'Inhapi', 2, 'AL'),
(137, 'Jacaré dos Homens', 2, 'AL'),
(138, 'Jacuípe', 2, 'AL'),
(139, 'Japaratinga', 2, 'AL'),
(140, 'Jaramataia', 2, 'AL'),
(141, 'Jequiá da Praia', 2, 'AL'),
(142, 'Joaquim Gomes', 2, 'AL'),
(143, 'Jundiá', 2, 'AL'),
(144, 'Junqueiro', 2, 'AL'),
(145, 'Lagoa da Canoa', 2, 'AL'),
(146, 'Limoeiro de Anadia', 2, 'AL'),
(147, 'Maceió', 2, 'AL'),
(148, 'Major Isidoro', 2, 'AL'),
(149, 'Mar Vermelho', 2, 'AL'),
(150, 'Maragogi', 2, 'AL'),
(151, 'Maravilha', 2, 'AL'),
(152, 'Marechal Deodoro', 2, 'AL'),
(153, 'Maribondo', 2, 'AL'),
(154, 'Mata Grande', 2, 'AL'),
(155, 'Matriz de Camaragibe', 2, 'AL'),
(156, 'Messias', 2, 'AL'),
(157, 'Minador do Negrão', 2, 'AL'),
(158, 'Monteirópolis', 2, 'AL'),
(159, 'Murici', 2, 'AL'),
(160, 'Novo Lino', 2, 'AL'),
(161, 'Olho d`Água das Flores', 2, 'AL'),
(162, 'Olho d`Água do Casado', 2, 'AL'),
(163, 'Olho d`Água Grande', 2, 'AL'),
(164, 'Olivença', 2, 'AL'),
(165, 'Ouro Branco', 2, 'AL'),
(166, 'Palestina', 2, 'AL'),
(167, 'Palmeira dos Índios', 2, 'AL'),
(168, 'Pão de Açúcar', 2, 'AL'),
(169, 'Pariconha', 2, 'AL'),
(170, 'Paripueira', 2, 'AL'),
(171, 'Passo de Camaragibe', 2, 'AL'),
(172, 'Paulo Jacinto', 2, 'AL'),
(173, 'Penedo', 2, 'AL'),
(174, 'Piaçabuçu', 2, 'AL'),
(175, 'Pilar', 2, 'AL'),
(176, 'Pindoba', 2, 'AL'),
(177, 'Piranhas', 2, 'AL'),
(178, 'Poço das Trincheiras', 2, 'AL'),
(179, 'Porto Calvo', 2, 'AL'),
(180, 'Porto de Pedras', 2, 'AL'),
(181, 'Porto Real do Colégio', 2, 'AL'),
(182, 'Quebrangulo', 2, 'AL'),
(183, 'Rio Largo', 2, 'AL'),
(184, 'Roteiro', 2, 'AL'),
(185, 'Santa Luzia do Norte', 2, 'AL'),
(186, 'Santana do Ipanema', 2, 'AL'),
(187, 'Santana do Mundaú', 2, 'AL'),
(188, 'São Brás', 2, 'AL'),
(189, 'São José da Laje', 2, 'AL'),
(190, 'São José da Tapera', 2, 'AL'),
(191, 'São Luís do Quitunde', 2, 'AL'),
(192, 'São Miguel dos Campos', 2, 'AL'),
(193, 'São Miguel dos Milagres', 2, 'AL'),
(194, 'São Sebastião', 2, 'AL'),
(195, 'Satuba', 2, 'AL'),
(196, 'Senador Rui Palmeira', 2, 'AL'),
(197, 'Tanque d`Arca', 2, 'AL'),
(198, 'Taquarana', 2, 'AL'),
(199, 'Teotônio Vilela', 2, 'AL'),
(200, 'Traipu', 2, 'AL'),
(201, 'União dos Palmares', 2, 'AL'),
(202, 'Viçosa', 2, 'AL'),
(203, 'Amapá', 4, 'AP'),
(204, 'Calçoene', 4, 'AP'),
(205, 'Cutias', 4, 'AP'),
(206, 'Ferreira Gomes', 4, 'AP'),
(207, 'Itaubal', 4, 'AP'),
(208, 'Laranjal do Jari', 4, 'AP'),
(209, 'Macapá', 4, 'AP'),
(210, 'Mazagão', 4, 'AP'),
(211, 'Oiapoque', 4, 'AP'),
(212, 'Pedra Branca do Amaparí', 4, 'AP'),
(213, 'Porto Grande', 4, 'AP'),
(214, 'Pracuúba', 4, 'AP'),
(215, 'Santana', 4, 'AP'),
(216, 'Serra do Navio', 4, 'AP'),
(217, 'Tartarugalzinho', 4, 'AP'),
(218, 'Vitória do Jari', 4, 'AP'),
(219, 'Alvarães', 3, 'AM'),
(220, 'Amaturá', 3, 'AM'),
(221, 'Anamã', 3, 'AM'),
(222, 'Anori', 3, 'AM'),
(223, 'Apuí', 3, 'AM'),
(224, 'Atalaia do Norte', 3, 'AM'),
(225, 'Autazes', 3, 'AM'),
(226, 'Barcelos', 3, 'AM'),
(227, 'Barreirinha', 3, 'AM'),
(228, 'Benjamin Constant', 3, 'AM'),
(229, 'Beruri', 3, 'AM'),
(230, 'Boa Vista do Ramos', 3, 'AM'),
(231, 'Boca do Acre', 3, 'AM'),
(232, 'Borba', 3, 'AM'),
(233, 'Caapiranga', 3, 'AM'),
(234, 'Canutama', 3, 'AM'),
(235, 'Carauari', 3, 'AM'),
(236, 'Careiro', 3, 'AM'),
(237, 'Careiro da Várzea', 3, 'AM'),
(238, 'Coari', 3, 'AM'),
(239, 'Codajás', 3, 'AM'),
(240, 'Eirunepé', 3, 'AM'),
(241, 'Envira', 3, 'AM'),
(242, 'Fonte Boa', 3, 'AM'),
(243, 'Guajará', 3, 'AM'),
(244, 'Humaitá', 3, 'AM'),
(245, 'Ipixuna', 3, 'AM'),
(246, 'Iranduba', 3, 'AM'),
(247, 'Itacoatiara', 3, 'AM'),
(248, 'Itamarati', 3, 'AM'),
(249, 'Itapiranga', 3, 'AM'),
(250, 'Japurá', 3, 'AM'),
(251, 'Juruá', 3, 'AM'),
(252, 'Jutaí', 3, 'AM'),
(253, 'Lábrea', 3, 'AM'),
(254, 'Manacapuru', 3, 'AM'),
(255, 'Manaquiri', 3, 'AM'),
(256, 'Manaus', 3, 'AM'),
(257, 'Manicoré', 3, 'AM'),
(258, 'Maraã', 3, 'AM'),
(259, 'Maués', 3, 'AM'),
(260, 'Nhamundá', 3, 'AM'),
(261, 'Nova Olinda do Norte', 3, 'AM'),
(262, 'Novo Airão', 3, 'AM'),
(263, 'Novo Aripuanã', 3, 'AM'),
(264, 'Parintins', 3, 'AM'),
(265, 'Pauini', 3, 'AM'),
(266, 'Presidente Figueiredo', 3, 'AM'),
(267, 'Rio Preto da Eva', 3, 'AM'),
(268, 'Santa Isabel do Rio Negro', 3, 'AM'),
(269, 'Santo Antônio do Içá', 3, 'AM'),
(270, 'São Gabriel da Cachoeira', 3, 'AM'),
(271, 'São Paulo de Olivença', 3, 'AM'),
(272, 'São Sebastião do Uatumã', 3, 'AM'),
(273, 'Silves', 3, 'AM'),
(274, 'Tabatinga', 3, 'AM'),
(275, 'Tapauá', 3, 'AM'),
(276, 'Tefé', 3, 'AM'),
(277, 'Tonantins', 3, 'AM'),
(278, 'Uarini', 3, 'AM'),
(279, 'Urucará', 3, 'AM'),
(280, 'Urucurituba', 3, 'AM'),
(281, 'Abaíra', 5, 'BA'),
(282, 'Abaré', 5, 'BA'),
(283, 'Acajutiba', 5, 'BA'),
(284, 'Adustina', 5, 'BA'),
(285, 'Água Fria', 5, 'BA'),
(286, 'Aiquara', 5, 'BA'),
(287, 'Alagoinhas', 5, 'BA'),
(288, 'Alcobaça', 5, 'BA'),
(289, 'Almadina', 5, 'BA'),
(290, 'Amargosa', 5, 'BA'),
(291, 'Amélia Rodrigues', 5, 'BA'),
(292, 'América Dourada', 5, 'BA'),
(293, 'Anagé', 5, 'BA'),
(294, 'Andaraí', 5, 'BA'),
(295, 'Andorinha', 5, 'BA'),
(296, 'Angical', 5, 'BA'),
(297, 'Anguera', 5, 'BA'),
(298, 'Antas', 5, 'BA'),
(299, 'Antônio Cardoso', 5, 'BA'),
(300, 'Antônio Gonçalves', 5, 'BA'),
(301, 'Aporá', 5, 'BA'),
(302, 'Apuarema', 5, 'BA'),
(303, 'Araças', 5, 'BA'),
(304, 'Aracatu', 5, 'BA'),
(305, 'Araci', 5, 'BA'),
(306, 'Aramari', 5, 'BA'),
(307, 'Arataca', 5, 'BA'),
(308, 'Aratuípe', 5, 'BA'),
(309, 'Aurelino Leal', 5, 'BA'),
(310, 'Baianópolis', 5, 'BA'),
(311, 'Baixa Grande', 5, 'BA'),
(312, 'Banzaê', 5, 'BA'),
(313, 'Barra', 5, 'BA'),
(314, 'Barra da Estiva', 5, 'BA'),
(315, 'Barra do Choça', 5, 'BA'),
(316, 'Barra do Mendes', 5, 'BA'),
(317, 'Barra do Rocha', 5, 'BA'),
(318, 'Barreiras', 5, 'BA'),
(319, 'Barro Alto', 5, 'BA'),
(320, 'Barro Preto (antigo Gov. Lomanto Jr.)', 5, 'BA'),
(321, 'Barrocas', 5, 'BA'),
(322, 'Belmonte', 5, 'BA'),
(323, 'Belo Campo', 5, 'BA'),
(324, 'Biritinga', 5, 'BA'),
(325, 'Boa Nova', 5, 'BA'),
(326, 'Boa Vista do Tupim', 5, 'BA'),
(327, 'Bom Jesus da Lapa', 5, 'BA'),
(328, 'Bom Jesus da Serra', 5, 'BA'),
(329, 'Boninal', 5, 'BA'),
(330, 'Bonito', 5, 'BA'),
(331, 'Boquira', 5, 'BA'),
(332, 'Botuporã', 5, 'BA'),
(333, 'Brejões', 5, 'BA'),
(334, 'Brejolândia', 5, 'BA'),
(335, 'Brotas de Macaúbas', 5, 'BA'),
(336, 'Brumado', 5, 'BA'),
(337, 'Buerarema', 5, 'BA'),
(338, 'Buritirama', 5, 'BA'),
(339, 'Caatiba', 5, 'BA'),
(340, 'Cabaceiras do Paraguaçu', 5, 'BA'),
(341, 'Cachoeira', 5, 'BA'),
(342, 'Caculé', 5, 'BA'),
(343, 'Caém', 5, 'BA'),
(344, 'Caetanos', 5, 'BA'),
(345, 'Caetité', 5, 'BA'),
(346, 'Cafarnaum', 5, 'BA'),
(347, 'Cairu', 5, 'BA'),
(348, 'Caldeirão Grande', 5, 'BA'),
(349, 'Camacan', 5, 'BA'),
(350, 'Camaçari', 5, 'BA'),
(351, 'Camamu', 5, 'BA'),
(352, 'Campo Alegre de Lourdes', 5, 'BA'),
(353, 'Campo Formoso', 5, 'BA'),
(354, 'Canápolis', 5, 'BA'),
(355, 'Canarana', 5, 'BA'),
(356, 'Canavieiras', 5, 'BA'),
(357, 'Candeal', 5, 'BA'),
(358, 'Candeias', 5, 'BA'),
(359, 'Candiba', 5, 'BA'),
(360, 'Cândido Sales', 5, 'BA'),
(361, 'Cansanção', 5, 'BA'),
(362, 'Canudos', 5, 'BA'),
(363, 'Capela do Alto Alegre', 5, 'BA'),
(364, 'Capim Grosso', 5, 'BA'),
(365, 'Caraíbas', 5, 'BA'),
(366, 'Caravelas', 5, 'BA'),
(367, 'Cardeal da Silva', 5, 'BA'),
(368, 'Carinhanha', 5, 'BA'),
(369, 'Casa Nova', 5, 'BA'),
(370, 'Castro Alves', 5, 'BA'),
(371, 'Catolândia', 5, 'BA'),
(372, 'Catu', 5, 'BA'),
(373, 'Caturama', 5, 'BA'),
(374, 'Central', 5, 'BA'),
(375, 'Chorrochó', 5, 'BA'),
(376, 'Cícero Dantas', 5, 'BA'),
(377, 'Cipó', 5, 'BA'),
(378, 'Coaraci', 5, 'BA'),
(379, 'Cocos', 5, 'BA'),
(380, 'Conceição da Feira', 5, 'BA'),
(381, 'Conceição do Almeida', 5, 'BA'),
(382, 'Conceição do Coité', 5, 'BA'),
(383, 'Conceição do Jacuípe', 5, 'BA'),
(384, 'Conde', 5, 'BA'),
(385, 'Condeúba', 5, 'BA'),
(386, 'Contendas do Sincorá', 5, 'BA'),
(387, 'Coração de Maria', 5, 'BA'),
(388, 'Cordeiros', 5, 'BA'),
(389, 'Coribe', 5, 'BA'),
(390, 'Coronel João Sá', 5, 'BA'),
(391, 'Correntina', 5, 'BA'),
(392, 'Cotegipe', 5, 'BA'),
(393, 'Cravolândia', 5, 'BA'),
(394, 'Crisópolis', 5, 'BA'),
(395, 'Cristópolis', 5, 'BA'),
(396, 'Cruz das Almas', 5, 'BA'),
(397, 'Curaçá', 5, 'BA'),
(398, 'Dário Meira', 5, 'BA'),
(399, 'Dias d`Ávila', 5, 'BA'),
(400, 'Dom Basílio', 5, 'BA'),
(401, 'Dom Macedo Costa', 5, 'BA'),
(402, 'Elísio Medrado', 5, 'BA'),
(403, 'Encruzilhada', 5, 'BA'),
(404, 'Entre Rios', 5, 'BA'),
(405, 'Érico Cardoso', 5, 'BA'),
(406, 'Esplanada', 5, 'BA'),
(407, 'Euclides da Cunha', 5, 'BA'),
(408, 'Eunápolis', 5, 'BA'),
(409, 'Fátima', 5, 'BA'),
(410, 'Feira da Mata', 5, 'BA'),
(411, 'Feira de Santana', 5, 'BA'),
(412, 'Filadélfia', 5, 'BA'),
(413, 'Firmino Alves', 5, 'BA'),
(414, 'Floresta Azul', 5, 'BA'),
(415, 'Formosa do Rio Preto', 5, 'BA'),
(416, 'Gandu', 5, 'BA'),
(417, 'Gavião', 5, 'BA'),
(418, 'Gentio do Ouro', 5, 'BA'),
(419, 'Glória', 5, 'BA'),
(420, 'Gongogi', 5, 'BA'),
(421, 'Governador Mangabeira', 5, 'BA'),
(422, 'Guajeru', 5, 'BA'),
(423, 'Guanambi', 5, 'BA'),
(424, 'Guaratinga', 5, 'BA'),
(425, 'Heliópolis', 5, 'BA'),
(426, 'Iaçu', 5, 'BA'),
(427, 'Ibiassucê', 5, 'BA'),
(428, 'Ibicaraí', 5, 'BA'),
(429, 'Ibicoara', 5, 'BA'),
(430, 'Ibicuí', 5, 'BA'),
(431, 'Ibipeba', 5, 'BA'),
(432, 'Ibipitanga', 5, 'BA'),
(433, 'Ibiquera', 5, 'BA'),
(434, 'Ibirapitanga', 5, 'BA'),
(435, 'Ibirapuã', 5, 'BA'),
(436, 'Ibirataia', 5, 'BA'),
(437, 'Ibitiara', 5, 'BA'),
(438, 'Ibititá', 5, 'BA'),
(439, 'Ibotirama', 5, 'BA'),
(440, 'Ichu', 5, 'BA'),
(441, 'Igaporã', 5, 'BA'),
(442, 'Igrapiúna', 5, 'BA'),
(443, 'Iguaí', 5, 'BA'),
(444, 'Ilhéus', 5, 'BA'),
(445, 'Inhambupe', 5, 'BA'),
(446, 'Ipecaetá', 5, 'BA'),
(447, 'Ipiaú', 5, 'BA'),
(448, 'Ipirá', 5, 'BA'),
(449, 'Ipupiara', 5, 'BA'),
(450, 'Irajuba', 5, 'BA'),
(451, 'Iramaia', 5, 'BA'),
(452, 'Iraquara', 5, 'BA'),
(453, 'Irará', 5, 'BA'),
(454, 'Irecê', 5, 'BA'),
(455, 'Itabela', 5, 'BA'),
(456, 'Itaberaba', 5, 'BA'),
(457, 'Itabuna', 5, 'BA'),
(458, 'Itacaré', 5, 'BA'),
(459, 'Itaeté', 5, 'BA'),
(460, 'Itagi', 5, 'BA'),
(461, 'Itagibá', 5, 'BA'),
(462, 'Itagimirim', 5, 'BA'),
(463, 'Itaguaçu da Bahia', 5, 'BA'),
(464, 'Itaju do Colônia', 5, 'BA'),
(465, 'Itajuípe', 5, 'BA'),
(466, 'Itamaraju', 5, 'BA'),
(467, 'Itamari', 5, 'BA'),
(468, 'Itambé', 5, 'BA'),
(469, 'Itanagra', 5, 'BA'),
(470, 'Itanhém', 5, 'BA'),
(471, 'Itaparica', 5, 'BA'),
(472, 'Itapé', 5, 'BA'),
(473, 'Itapebi', 5, 'BA'),
(474, 'Itapetinga', 5, 'BA'),
(475, 'Itapicuru', 5, 'BA'),
(476, 'Itapitanga', 5, 'BA'),
(477, 'Itaquara', 5, 'BA'),
(478, 'Itarantim', 5, 'BA'),
(479, 'Itatim', 5, 'BA'),
(480, 'Itiruçu', 5, 'BA'),
(481, 'Itiúba', 5, 'BA'),
(482, 'Itororó', 5, 'BA'),
(483, 'Ituaçu', 5, 'BA'),
(484, 'Ituberá', 5, 'BA'),
(485, 'Iuiú', 5, 'BA'),
(486, 'Jaborandi', 5, 'BA'),
(487, 'Jacaraci', 5, 'BA'),
(488, 'Jacobina', 5, 'BA'),
(489, 'Jaguaquara', 5, 'BA'),
(490, 'Jaguarari', 5, 'BA'),
(491, 'Jaguaripe', 5, 'BA'),
(492, 'Jandaíra', 5, 'BA'),
(493, 'Jequié', 5, 'BA'),
(494, 'Jeremoabo', 5, 'BA'),
(495, 'Jiquiriçá', 5, 'BA'),
(496, 'Jitaúna', 5, 'BA'),
(497, 'João Dourado', 5, 'BA'),
(498, 'Juazeiro', 5, 'BA'),
(499, 'Jucuruçu', 5, 'BA'),
(500, 'Jussara', 5, 'BA'),
(501, 'Jussari', 5, 'BA'),
(502, 'Jussiape', 5, 'BA'),
(503, 'Lafaiete Coutinho', 5, 'BA'),
(504, 'Lagoa Real', 5, 'BA'),
(505, 'Laje', 5, 'BA'),
(506, 'Lajedão', 5, 'BA'),
(507, 'Lajedinho', 5, 'BA'),
(508, 'Lajedo do Tabocal', 5, 'BA'),
(509, 'Lamarão', 5, 'BA'),
(510, 'Lapão', 5, 'BA'),
(511, 'Lauro de Freitas', 5, 'BA'),
(512, 'Lençóis', 5, 'BA'),
(513, 'Licínio de Almeida', 5, 'BA'),
(514, 'Livramento de Nossa Senhora', 5, 'BA'),
(515, 'Luís Eduardo Magalhães', 5, 'BA'),
(516, 'Macajuba', 5, 'BA'),
(517, 'Macarani', 5, 'BA'),
(518, 'Macaúbas', 5, 'BA'),
(519, 'Macururé', 5, 'BA'),
(520, 'Madre de Deus', 5, 'BA'),
(521, 'Maetinga', 5, 'BA'),
(522, 'Maiquinique', 5, 'BA'),
(523, 'Mairi', 5, 'BA'),
(524, 'Malhada', 5, 'BA'),
(525, 'Malhada de Pedras', 5, 'BA'),
(526, 'Manoel Vitorino', 5, 'BA'),
(527, 'Mansidão', 5, 'BA'),
(528, 'Maracás', 5, 'BA'),
(529, 'Maragogipe', 5, 'BA'),
(530, 'Maraú', 5, 'BA'),
(531, 'Marcionílio Souza', 5, 'BA'),
(532, 'Mascote', 5, 'BA'),
(533, 'Mata de São João', 5, 'BA'),
(534, 'Matina', 5, 'BA'),
(535, 'Medeiros Neto', 5, 'BA'),
(536, 'Miguel Calmon', 5, 'BA'),
(537, 'Milagres', 5, 'BA'),
(538, 'Mirangaba', 5, 'BA'),
(539, 'Mirante', 5, 'BA'),
(540, 'Monte Santo', 5, 'BA'),
(541, 'Morpará', 5, 'BA'),
(542, 'Morro do Chapéu', 5, 'BA'),
(543, 'Mortugaba', 5, 'BA'),
(544, 'Mucugê', 5, 'BA'),
(545, 'Mucuri', 5, 'BA'),
(546, 'Mulungu do Morro', 5, 'BA'),
(547, 'Mundo Novo', 5, 'BA'),
(548, 'Muniz Ferreira', 5, 'BA'),
(549, 'Muquém de São Francisco', 5, 'BA'),
(550, 'Muritiba', 5, 'BA'),
(551, 'Mutuípe', 5, 'BA'),
(552, 'Nazaré', 5, 'BA'),
(553, 'Nilo Peçanha', 5, 'BA'),
(554, 'Nordestina', 5, 'BA'),
(555, 'Nova Canaã', 5, 'BA'),
(556, 'Nova Fátima', 5, 'BA'),
(557, 'Nova Ibiá', 5, 'BA'),
(558, 'Nova Itarana', 5, 'BA'),
(559, 'Nova Redenção', 5, 'BA'),
(560, 'Nova Soure', 5, 'BA'),
(561, 'Nova Viçosa', 5, 'BA'),
(562, 'Novo Horizonte', 5, 'BA'),
(563, 'Novo Triunfo', 5, 'BA'),
(564, 'Olindina', 5, 'BA'),
(565, 'Oliveira dos Brejinhos', 5, 'BA'),
(566, 'Ouriçangas', 5, 'BA'),
(567, 'Ourolândia', 5, 'BA'),
(568, 'Palmas de Monte Alto', 5, 'BA'),
(569, 'Palmeiras', 5, 'BA'),
(570, 'Paramirim', 5, 'BA'),
(571, 'Paratinga', 5, 'BA'),
(572, 'Paripiranga', 5, 'BA'),
(573, 'Pau Brasil', 5, 'BA'),
(574, 'Paulo Afonso', 5, 'BA'),
(575, 'Pé de Serra', 5, 'BA'),
(576, 'Pedrão', 5, 'BA'),
(577, 'Pedro Alexandre', 5, 'BA'),
(578, 'Piatã', 5, 'BA'),
(579, 'Pilão Arcado', 5, 'BA'),
(580, 'Pindaí', 5, 'BA'),
(581, 'Pindobaçu', 5, 'BA'),
(582, 'Pintadas', 5, 'BA'),
(583, 'Piraí do Norte', 5, 'BA'),
(584, 'Piripá', 5, 'BA'),
(585, 'Piritiba', 5, 'BA'),
(586, 'Planaltino', 5, 'BA'),
(587, 'Planalto', 5, 'BA'),
(588, 'Poções', 5, 'BA'),
(589, 'Pojuca', 5, 'BA'),
(590, 'Ponto Novo', 5, 'BA'),
(591, 'Porto Seguro', 5, 'BA'),
(592, 'Potiraguá', 5, 'BA'),
(593, 'Prado', 5, 'BA'),
(594, 'Presidente Dutra', 5, 'BA'),
(595, 'Presidente Jânio Quadros', 5, 'BA'),
(596, 'Presidente Tancredo Neves', 5, 'BA'),
(597, 'Queimadas', 5, 'BA'),
(598, 'Quijingue', 5, 'BA'),
(599, 'Quixabeira', 5, 'BA'),
(600, 'Rafael Jambeiro', 5, 'BA'),
(601, 'Remanso', 5, 'BA'),
(602, 'Retirolândia', 5, 'BA'),
(603, 'Riachão das Neves', 5, 'BA'),
(604, 'Riachão do Jacuípe', 5, 'BA'),
(605, 'Riacho de Santana', 5, 'BA'),
(606, 'Ribeira do Amparo', 5, 'BA'),
(607, 'Ribeira do Pombal', 5, 'BA'),
(608, 'Ribeirão do Largo', 5, 'BA'),
(609, 'Rio de Contas', 5, 'BA'),
(610, 'Rio do Antônio', 5, 'BA'),
(611, 'Rio do Pires', 5, 'BA'),
(612, 'Rio Real', 5, 'BA'),
(613, 'Rodelas', 5, 'BA'),
(614, 'Ruy Barbosa', 5, 'BA'),
(615, 'Salinas da Margarida', 5, 'BA'),
(616, 'Salvador', 5, 'BA'),
(617, 'Santa Bárbara', 5, 'BA'),
(618, 'Santa Brígida', 5, 'BA'),
(619, 'Santa Cruz Cabrália', 5, 'BA'),
(620, 'Santa Cruz da Vitória', 5, 'BA'),
(621, 'Santa Inês', 5, 'BA'),
(622, 'Santa Luzia', 5, 'BA'),
(623, 'Santa Maria da Vitória', 5, 'BA'),
(624, 'Santa Rita de Cássia', 5, 'BA'),
(625, 'Santa Teresinha', 5, 'BA'),
(626, 'Santaluz', 5, 'BA'),
(627, 'Santana', 5, 'BA'),
(628, 'Santanópolis', 5, 'BA'),
(629, 'Santo Amaro', 5, 'BA'),
(630, 'Santo Antônio de Jesus', 5, 'BA'),
(631, 'Santo Estêvão', 5, 'BA'),
(632, 'São Desidério', 5, 'BA'),
(633, 'São Domingos', 5, 'BA'),
(634, 'São Felipe', 5, 'BA'),
(635, 'São Félix', 5, 'BA'),
(636, 'São Félix do Coribe', 5, 'BA'),
(637, 'São Francisco do Conde', 5, 'BA'),
(638, 'São Gabriel', 5, 'BA'),
(639, 'São Gonçalo dos Campos', 5, 'BA'),
(640, 'São José da Vitória', 5, 'BA'),
(641, 'São José do Jacuípe', 5, 'BA'),
(642, 'São Miguel das Matas', 5, 'BA'),
(643, 'São Sebastião do Passé', 5, 'BA'),
(644, 'Sapeaçu', 5, 'BA'),
(645, 'Sátiro Dias', 5, 'BA'),
(646, 'Saubara', 5, 'BA'),
(647, 'Saúde', 5, 'BA'),
(648, 'Seabra', 5, 'BA'),
(649, 'Sebastião Laranjeiras', 5, 'BA'),
(650, 'Senhor do Bonfim', 5, 'BA'),
(651, 'Sento Sé', 5, 'BA'),
(652, 'Serra do Ramalho', 5, 'BA'),
(653, 'Serra Dourada', 5, 'BA'),
(654, 'Serra Preta', 5, 'BA'),
(655, 'Serrinha', 5, 'BA'),
(656, 'Serrolândia', 5, 'BA'),
(657, 'Simões Filho', 5, 'BA'),
(658, 'Sítio do Mato', 5, 'BA'),
(659, 'Sítio do Quinto', 5, 'BA'),
(660, 'Sobradinho', 5, 'BA'),
(661, 'Souto Soares', 5, 'BA'),
(662, 'Tabocas do Brejo Velho', 5, 'BA'),
(663, 'Tanhaçu', 5, 'BA'),
(664, 'Tanque Novo', 5, 'BA'),
(665, 'Tanquinho', 5, 'BA'),
(666, 'Taperoá', 5, 'BA'),
(667, 'Tapiramutá', 5, 'BA'),
(668, 'Teixeira de Freitas', 5, 'BA'),
(669, 'Teodoro Sampaio', 5, 'BA'),
(670, 'Teofilândia', 5, 'BA'),
(671, 'Teolândia', 5, 'BA'),
(672, 'Terra Nova', 5, 'BA'),
(673, 'Tremedal', 5, 'BA'),
(674, 'Tucano', 5, 'BA'),
(675, 'Uauá', 5, 'BA'),
(676, 'Ubaíra', 5, 'BA'),
(677, 'Ubaitaba', 5, 'BA'),
(678, 'Ubatã', 5, 'BA'),
(679, 'Uibaí', 5, 'BA'),
(680, 'Umburanas', 5, 'BA'),
(681, 'Una', 5, 'BA'),
(682, 'Urandi', 5, 'BA'),
(683, 'Uruçuca', 5, 'BA'),
(684, 'Utinga', 5, 'BA'),
(685, 'Valença', 5, 'BA'),
(686, 'Valente', 5, 'BA'),
(687, 'Várzea da Roça', 5, 'BA'),
(688, 'Várzea do Poço', 5, 'BA'),
(689, 'Várzea Nova', 5, 'BA'),
(690, 'Varzedo', 5, 'BA'),
(691, 'Vera Cruz', 5, 'BA'),
(692, 'Vereda', 5, 'BA'),
(693, 'Vitória da Conquista', 5, 'BA'),
(694, 'Wagner', 5, 'BA'),
(695, 'Wanderley', 5, 'BA'),
(696, 'Wenceslau Guimarães', 5, 'BA'),
(697, 'Xique-Xique', 5, 'BA'),
(698, 'Abaiara', 6, 'CE'),
(699, 'Acarape', 6, 'CE'),
(700, 'Acaraú', 6, 'CE'),
(701, 'Acopiara', 6, 'CE'),
(702, 'Aiuaba', 6, 'CE'),
(703, 'Alcântaras', 6, 'CE'),
(704, 'Altaneira', 6, 'CE'),
(705, 'Alto Santo', 6, 'CE'),
(706, 'Amontada', 6, 'CE'),
(707, 'Antonina do Norte', 6, 'CE'),
(708, 'Apuiarés', 6, 'CE'),
(709, 'Aquiraz', 6, 'CE'),
(710, 'Aracati', 6, 'CE'),
(711, 'Aracoiaba', 6, 'CE'),
(712, 'Ararendá', 6, 'CE'),
(713, 'Araripe', 6, 'CE'),
(714, 'Aratuba', 6, 'CE'),
(715, 'Arneiroz', 6, 'CE'),
(716, 'Assaré', 6, 'CE'),
(717, 'Aurora', 6, 'CE'),
(718, 'Baixio', 6, 'CE'),
(719, 'Banabuiú', 6, 'CE'),
(720, 'Barbalha', 6, 'CE'),
(721, 'Barreira', 6, 'CE'),
(722, 'Barro', 6, 'CE'),
(723, 'Barroquinha', 6, 'CE'),
(724, 'Baturité', 6, 'CE'),
(725, 'Beberibe', 6, 'CE'),
(726, 'Bela Cruz', 6, 'CE'),
(727, 'Boa Viagem', 6, 'CE'),
(728, 'Brejo Santo', 6, 'CE'),
(729, 'Camocim', 6, 'CE'),
(730, 'Campos Sales', 6, 'CE'),
(731, 'Canindé', 6, 'CE'),
(732, 'Capistrano', 6, 'CE'),
(733, 'Caridade', 6, 'CE'),
(734, 'Cariré', 6, 'CE'),
(735, 'Caririaçu', 6, 'CE'),
(736, 'Cariús', 6, 'CE'),
(737, 'Carnaubal', 6, 'CE'),
(738, 'Cascavel', 6, 'CE'),
(739, 'Catarina', 6, 'CE'),
(740, 'Catunda', 6, 'CE'),
(741, 'Caucaia', 6, 'CE'),
(742, 'Cedro', 6, 'CE'),
(743, 'Chaval', 6, 'CE'),
(744, 'Choró', 6, 'CE'),
(745, 'Chorozinho', 6, 'CE'),
(746, 'Coreaú', 6, 'CE'),
(747, 'Crateús', 6, 'CE'),
(748, 'Crato', 6, 'CE'),
(749, 'Croatá', 6, 'CE'),
(750, 'Cruz', 6, 'CE'),
(751, 'Deputado Irapuan Pinheiro', 6, 'CE'),
(752, 'Ererê', 6, 'CE'),
(753, 'Eusébio', 6, 'CE'),
(754, 'Farias Brito', 6, 'CE'),
(755, 'Forquilha', 6, 'CE'),
(756, 'Fortaleza', 6, 'CE'),
(757, 'Fortim', 6, 'CE'),
(758, 'Frecheirinha', 6, 'CE'),
(759, 'General Sampaio', 6, 'CE'),
(760, 'Graça', 6, 'CE'),
(761, 'Granja', 6, 'CE'),
(762, 'Granjeiro', 6, 'CE'),
(763, 'Groaíras', 6, 'CE'),
(764, 'Guaiúba', 6, 'CE'),
(765, 'Guaraciaba do Norte', 6, 'CE'),
(766, 'Guaramiranga', 6, 'CE'),
(767, 'Hidrolândia', 6, 'CE'),
(768, 'Horizonte', 6, 'CE'),
(769, 'Ibaretama', 6, 'CE'),
(770, 'Ibiapina', 6, 'CE'),
(771, 'Ibicuitinga', 6, 'CE'),
(772, 'Icapuí', 6, 'CE'),
(773, 'Icó', 6, 'CE'),
(774, 'Iguatu', 6, 'CE'),
(775, 'Independência', 6, 'CE'),
(776, 'Ipaporanga', 6, 'CE'),
(777, 'Ipaumirim', 6, 'CE'),
(778, 'Ipu', 6, 'CE'),
(779, 'Ipueiras', 6, 'CE'),
(780, 'Iracema', 6, 'CE'),
(781, 'Irauçuba', 6, 'CE'),
(782, 'Itaiçaba', 6, 'CE'),
(783, 'Itaitinga', 6, 'CE'),
(784, 'Itapagé', 6, 'CE'),
(785, 'Itapipoca', 6, 'CE'),
(786, 'Itapiúna', 6, 'CE'),
(787, 'Itarema', 6, 'CE'),
(788, 'Itatira', 6, 'CE'),
(789, 'Jaguaretama', 6, 'CE'),
(790, 'Jaguaribara', 6, 'CE'),
(791, 'Jaguaribe', 6, 'CE'),
(792, 'Jaguaruana', 6, 'CE'),
(793, 'Jardim', 6, 'CE'),
(794, 'Jati', 6, 'CE'),
(795, 'Jijoca de Jericoacoara', 6, 'CE'),
(796, 'Juazeiro do Norte', 6, 'CE'),
(797, 'Jucás', 6, 'CE'),
(798, 'Lavras da Mangabeira', 6, 'CE'),
(799, 'Limoeiro do Norte', 6, 'CE'),
(800, 'Madalena', 6, 'CE'),
(801, 'Maracanaú', 6, 'CE'),
(802, 'Maranguape', 6, 'CE'),
(803, 'Marco', 6, 'CE'),
(804, 'Martinópole', 6, 'CE'),
(805, 'Massapê', 6, 'CE'),
(806, 'Mauriti', 6, 'CE'),
(807, 'Meruoca', 6, 'CE'),
(808, 'Milagres', 6, 'CE'),
(809, 'Milhã', 6, 'CE'),
(810, 'Miraíma', 6, 'CE'),
(811, 'Missão Velha', 6, 'CE'),
(812, 'Mombaça', 6, 'CE'),
(813, 'Monsenhor Tabosa', 6, 'CE'),
(814, 'Morada Nova', 6, 'CE'),
(815, 'Moraújo', 6, 'CE'),
(816, 'Morrinhos', 6, 'CE'),
(817, 'Mucambo', 6, 'CE'),
(818, 'Mulungu', 6, 'CE'),
(819, 'Nova Olinda', 6, 'CE'),
(820, 'Nova Russas', 6, 'CE'),
(821, 'Novo Oriente', 6, 'CE'),
(822, 'Ocara', 6, 'CE'),
(823, 'Orós', 6, 'CE'),
(824, 'Pacajus', 6, 'CE'),
(825, 'Pacatuba', 6, 'CE'),
(826, 'Pacoti', 6, 'CE'),
(827, 'Pacujá', 6, 'CE'),
(828, 'Palhano', 6, 'CE'),
(829, 'Palmácia', 6, 'CE'),
(830, 'Paracuru', 6, 'CE'),
(831, 'Paraipaba', 6, 'CE'),
(832, 'Parambu', 6, 'CE'),
(833, 'Paramoti', 6, 'CE'),
(834, 'Pedra Branca', 6, 'CE'),
(835, 'Penaforte', 6, 'CE'),
(836, 'Pentecoste', 6, 'CE'),
(837, 'Pereiro', 6, 'CE'),
(838, 'Pindoretama', 6, 'CE'),
(839, 'Piquet Carneiro', 6, 'CE'),
(840, 'Pires Ferreira', 6, 'CE'),
(841, 'Poranga', 6, 'CE'),
(842, 'Porteiras', 6, 'CE'),
(843, 'Potengi', 6, 'CE'),
(844, 'Potiretama', 6, 'CE'),
(845, 'Quiterianópolis', 6, 'CE'),
(846, 'Quixadá', 6, 'CE'),
(847, 'Quixelô', 6, 'CE'),
(848, 'Quixeramobim', 6, 'CE'),
(849, 'Quixeré', 6, 'CE'),
(850, 'Redenção', 6, 'CE'),
(851, 'Reriutaba', 6, 'CE'),
(852, 'Russas', 6, 'CE'),
(853, 'Saboeiro', 6, 'CE'),
(854, 'Salitre', 6, 'CE'),
(855, 'Santa Quitéria', 6, 'CE'),
(856, 'Santana do Acaraú', 6, 'CE'),
(857, 'Santana do Cariri', 6, 'CE'),
(858, 'São Benedito', 6, 'CE'),
(859, 'São Gonçalo do Amarante', 6, 'CE'),
(860, 'São João do Jaguaribe', 6, 'CE'),
(861, 'São Luís do Curu', 6, 'CE'),
(862, 'Senador Pompeu', 6, 'CE'),
(863, 'Senador Sá', 6, 'CE'),
(864, 'Sobral', 6, 'CE'),
(865, 'Solonópole', 6, 'CE'),
(866, 'Tabuleiro do Norte', 6, 'CE'),
(867, 'Tamboril', 6, 'CE'),
(868, 'Tarrafas', 6, 'CE'),
(869, 'Tauá', 6, 'CE'),
(870, 'Tejuçuoca', 6, 'CE'),
(871, 'Tianguá', 6, 'CE'),
(872, 'Trairi', 6, 'CE'),
(873, 'Tururu', 6, 'CE'),
(874, 'Ubajara', 6, 'CE'),
(875, 'Umari', 6, 'CE'),
(876, 'Umirim', 6, 'CE'),
(877, 'Uruburetama', 6, 'CE'),
(878, 'Uruoca', 6, 'CE'),
(879, 'Varjota', 6, 'CE'),
(880, 'Várzea Alegre', 6, 'CE'),
(881, 'Viçosa do Ceará', 6, 'CE'),
(882, 'Brasília', 7, 'DF'),
(883, 'Abadia de Goiás', 9, 'GO'),
(884, 'Abadiânia', 9, 'GO'),
(885, 'Acreúna', 9, 'GO'),
(886, 'Adelândia', 9, 'GO'),
(887, 'Água Fria de Goiás', 9, 'GO'),
(888, 'Água Limpa', 9, 'GO'),
(889, 'Águas Lindas de Goiás', 9, 'GO'),
(890, 'Alexânia', 9, 'GO'),
(891, 'Aloândia', 9, 'GO'),
(892, 'Alto Horizonte', 9, 'GO'),
(893, 'Alto Paraíso de Goiás', 9, 'GO'),
(894, 'Alvorada do Norte', 9, 'GO'),
(895, 'Amaralina', 9, 'GO'),
(896, 'Americano do Brasil', 9, 'GO'),
(897, 'Amorinópolis', 9, 'GO'),
(898, 'Anápolis', 9, 'GO'),
(899, 'Anhanguera', 9, 'GO'),
(900, 'Anicuns', 9, 'GO'),
(901, 'Aparecida de Goiânia', 9, 'GO'),
(902, 'Aparecida do Rio Doce', 9, 'GO'),
(903, 'Aporé', 9, 'GO'),
(904, 'Araçu', 9, 'GO'),
(905, 'Aragarças', 9, 'GO'),
(906, 'Aragoiânia', 9, 'GO'),
(907, 'Araguapaz', 9, 'GO'),
(908, 'Arenópolis', 9, 'GO'),
(909, 'Aruanã', 9, 'GO'),
(910, 'Aurilândia', 9, 'GO'),
(911, 'Avelinópolis', 9, 'GO'),
(912, 'Baliza', 9, 'GO'),
(913, 'Barro Alto', 9, 'GO'),
(914, 'Bela Vista de Goiás', 9, 'GO'),
(915, 'Bom Jardim de Goiás', 9, 'GO'),
(916, 'Bom Jesus de Goiás', 9, 'GO'),
(917, 'Bonfinópolis', 9, 'GO'),
(918, 'Bonópolis', 9, 'GO'),
(919, 'Brazabrantes', 9, 'GO'),
(920, 'Britânia', 9, 'GO'),
(921, 'Buriti Alegre', 9, 'GO'),
(922, 'Buriti de Goiás', 9, 'GO'),
(923, 'Buritinópolis', 9, 'GO'),
(924, 'Cabeceiras', 9, 'GO'),
(925, 'Cachoeira Alta', 9, 'GO'),
(926, 'Cachoeira de Goiás', 9, 'GO'),
(927, 'Cachoeira Dourada', 9, 'GO'),
(928, 'Caçu', 9, 'GO'),
(929, 'Caiapônia', 9, 'GO'),
(930, 'Caldas Novas', 9, 'GO'),
(931, 'Caldazinha', 9, 'GO'),
(932, 'Campestre de Goiás', 9, 'GO'),
(933, 'Campinaçu', 9, 'GO'),
(934, 'Campinorte', 9, 'GO'),
(935, 'Campo Alegre de Goiás', 9, 'GO'),
(936, 'Campo Limpo de Goiás', 9, 'GO'),
(937, 'Campos Belos', 9, 'GO'),
(938, 'Campos Verdes', 9, 'GO'),
(939, 'Carmo do Rio Verde', 9, 'GO'),
(940, 'Castelândia', 9, 'GO'),
(941, 'Catalão', 9, 'GO'),
(942, 'Caturaí', 9, 'GO'),
(943, 'Cavalcante', 9, 'GO'),
(944, 'Ceres', 9, 'GO'),
(945, 'Cezarina', 9, 'GO'),
(946, 'Chapadão do Céu', 9, 'GO'),
(947, 'Cidade Ocidental', 9, 'GO'),
(948, 'Cocalzinho de Goiás', 9, 'GO'),
(949, 'Colinas do Sul', 9, 'GO'),
(950, 'Córrego do Ouro', 9, 'GO'),
(951, 'Corumbá de Goiás', 9, 'GO'),
(952, 'Corumbaíba', 9, 'GO'),
(953, 'Cristalina', 9, 'GO'),
(954, 'Cristianópolis', 9, 'GO'),
(955, 'Crixás', 9, 'GO'),
(956, 'Cromínia', 9, 'GO'),
(957, 'Cumari', 9, 'GO'),
(958, 'Damianópolis', 9, 'GO'),
(959, 'Damolândia', 9, 'GO'),
(960, 'Davinópolis', 9, 'GO'),
(961, 'Diorama', 9, 'GO'),
(962, 'Divinópolis de Goiás', 9, 'GO'),
(963, 'Doverlândia', 9, 'GO'),
(964, 'Edealina', 9, 'GO'),
(965, 'Edéia', 9, 'GO'),
(966, 'Estrela do Norte', 9, 'GO'),
(967, 'Faina', 9, 'GO'),
(968, 'Fazenda Nova', 9, 'GO'),
(969, 'Firminópolis', 9, 'GO'),
(970, 'Flores de Goiás', 9, 'GO'),
(971, 'Formosa', 9, 'GO'),
(972, 'Formoso', 9, 'GO'),
(973, 'Gameleira de Goiás', 9, 'GO'),
(974, 'Goianápolis', 9, 'GO'),
(975, 'Goiandira', 9, 'GO'),
(976, 'Goianésia', 9, 'GO'),
(977, 'Goiânia', 9, 'GO'),
(978, 'Goianira', 9, 'GO'),
(979, 'Goiás', 9, 'GO'),
(980, 'Goiatuba', 9, 'GO'),
(981, 'Gouvelândia', 9, 'GO'),
(982, 'Guapó', 9, 'GO'),
(983, 'Guaraíta', 9, 'GO'),
(984, 'Guarani de Goiás', 9, 'GO'),
(985, 'Guarinos', 9, 'GO'),
(986, 'Heitoraí', 9, 'GO'),
(987, 'Hidrolândia', 9, 'GO'),
(988, 'Hidrolina', 9, 'GO'),
(989, 'Iaciara', 9, 'GO'),
(990, 'Inaciolândia', 9, 'GO'),
(991, 'Indiara', 9, 'GO'),
(992, 'Inhumas', 9, 'GO'),
(993, 'Ipameri', 9, 'GO'),
(994, 'Ipiranga de Goiás', 9, 'GO'),
(995, 'Iporá', 9, 'GO'),
(996, 'Israelândia', 9, 'GO'),
(997, 'Itaberaí', 9, 'GO'),
(998, 'Itaguari', 9, 'GO'),
(999, 'Itaguaru', 9, 'GO'),
(1000, 'Itajá', 9, 'GO'),
(1001, 'Itapaci', 9, 'GO'),
(1002, 'Itapirapuã', 9, 'GO'),
(1003, 'Itapuranga', 9, 'GO'),
(1004, 'Itarumã', 9, 'GO'),
(1005, 'Itauçu', 9, 'GO'),
(1006, 'Itumbiara', 9, 'GO'),
(1007, 'Ivolândia', 9, 'GO'),
(1008, 'Jandaia', 9, 'GO'),
(1009, 'Jaraguá', 9, 'GO'),
(1010, 'Jataí', 9, 'GO'),
(1011, 'Jaupaci', 9, 'GO'),
(1012, 'Jesúpolis', 9, 'GO'),
(1013, 'Joviânia', 9, 'GO'),
(1014, 'Jussara', 9, 'GO'),
(1015, 'Lagoa Santa', 9, 'GO'),
(1016, 'Leopoldo de Bulhões', 9, 'GO'),
(1017, 'Luziânia', 9, 'GO'),
(1018, 'Mairipotaba', 9, 'GO'),
(1019, 'Mambaí', 9, 'GO'),
(1020, 'Mara Rosa', 9, 'GO'),
(1021, 'Marzagão', 9, 'GO'),
(1022, 'Matrinchã', 9, 'GO'),
(1023, 'Maurilândia', 9, 'GO'),
(1024, 'Mimoso de Goiás', 9, 'GO'),
(1025, 'Minaçu', 9, 'GO'),
(1026, 'Mineiros', 9, 'GO'),
(1027, 'Moiporá', 9, 'GO'),
(1028, 'Monte Alegre de Goiás', 9, 'GO'),
(1029, 'Montes Claros de Goiás', 9, 'GO'),
(1030, 'Montividiu', 9, 'GO'),
(1031, 'Montividiu do Norte', 9, 'GO'),
(1032, 'Morrinhos', 9, 'GO'),
(1033, 'Morro Agudo de Goiás', 9, 'GO'),
(1034, 'Mossâmedes', 9, 'GO'),
(1035, 'Mozarlândia', 9, 'GO'),
(1036, 'Mundo Novo', 9, 'GO'),
(1037, 'Mutunópolis', 9, 'GO'),
(1038, 'Nazário', 9, 'GO'),
(1039, 'Nerópolis', 9, 'GO'),
(1040, 'Niquelândia', 9, 'GO'),
(1041, 'Nova América', 9, 'GO'),
(1042, 'Nova Aurora', 9, 'GO'),
(1043, 'Nova Crixás', 9, 'GO'),
(1044, 'Nova Glória', 9, 'GO'),
(1045, 'Nova Iguaçu de Goiás', 9, 'GO'),
(1046, 'Nova Roma', 9, 'GO'),
(1047, 'Nova Veneza', 9, 'GO'),
(1048, 'Novo Brasil', 9, 'GO'),
(1049, 'Novo Gama', 9, 'GO'),
(1050, 'Novo Planalto', 9, 'GO'),
(1051, 'Orizona', 9, 'GO'),
(1052, 'Ouro Verde de Goiás', 9, 'GO'),
(1053, 'Ouvidor', 9, 'GO'),
(1054, 'Padre Bernardo', 9, 'GO'),
(1055, 'Palestina de Goiás', 9, 'GO'),
(1056, 'Palmeiras de Goiás', 9, 'GO'),
(1057, 'Palmelo', 9, 'GO'),
(1058, 'Palminópolis', 9, 'GO'),
(1059, 'Panamá', 9, 'GO'),
(1060, 'Paranaiguara', 9, 'GO'),
(1061, 'Paraúna', 9, 'GO'),
(1062, 'Perolândia', 9, 'GO'),
(1063, 'Petrolina de Goiás', 9, 'GO'),
(1064, 'Pilar de Goiás', 9, 'GO'),
(1065, 'Piracanjuba', 9, 'GO'),
(1066, 'Piranhas', 9, 'GO'),
(1067, 'Pirenópolis', 9, 'GO'),
(1068, 'Pires do Rio', 9, 'GO'),
(1069, 'Planaltina', 9, 'GO'),
(1070, 'Pontalina', 9, 'GO'),
(1071, 'Porangatu', 9, 'GO'),
(1072, 'Porteirão', 9, 'GO'),
(1073, 'Portelândia', 9, 'GO'),
(1074, 'Posse', 9, 'GO'),
(1075, 'Professor Jamil', 9, 'GO'),
(1076, 'Quirinópolis', 9, 'GO'),
(1077, 'Rialma', 9, 'GO'),
(1078, 'Rianápolis', 9, 'GO'),
(1079, 'Rio Quente', 9, 'GO'),
(1080, 'Rio Verde', 9, 'GO'),
(1081, 'Rubiataba', 9, 'GO'),
(1082, 'Sanclerlândia', 9, 'GO'),
(1083, 'Santa Bárbara de Goiás', 9, 'GO'),
(1084, 'Santa Cruz de Goiás', 9, 'GO'),
(1085, 'Santa Fé de Goiás', 9, 'GO'),
(1086, 'Santa Helena de Goiás', 9, 'GO'),
(1087, 'Santa Isabel', 9, 'GO'),
(1088, 'Santa Rita do Araguaia', 9, 'GO'),
(1089, 'Santa Rita do Novo Destino', 9, 'GO'),
(1090, 'Santa Rosa de Goiás', 9, 'GO'),
(1091, 'Santa Tereza de Goiás', 9, 'GO'),
(1092, 'Santa Terezinha de Goiás', 9, 'GO'),
(1093, 'Santo Antônio da Barra', 9, 'GO'),
(1094, 'Santo Antônio de Goiás', 9, 'GO'),
(1095, 'Santo Antônio do Descoberto', 9, 'GO'),
(1096, 'São Domingos', 9, 'GO'),
(1097, 'São Francisco de Goiás', 9, 'GO'),
(1098, 'São João d`Aliança', 9, 'GO'),
(1099, 'São João da Paraúna', 9, 'GO'),
(1100, 'São Luís de Montes Belos', 9, 'GO'),
(1101, 'São Luíz do Norte', 9, 'GO'),
(1102, 'São Miguel do Araguaia', 9, 'GO'),
(1103, 'São Miguel do Passa Quatro', 9, 'GO'),
(1104, 'São Patrício', 9, 'GO'),
(1105, 'São Simão', 9, 'GO'),
(1106, 'Senador Canedo', 9, 'GO'),
(1107, 'Serranópolis', 9, 'GO'),
(1108, 'Silvânia', 9, 'GO'),
(1109, 'Simolândia', 9, 'GO'),
(1110, 'Sítio d`Abadia', 9, 'GO'),
(1111, 'Taquaral de Goiás', 9, 'GO'),
(1112, 'Teresina de Goiás', 9, 'GO'),
(1113, 'Terezópolis de Goiás', 9, 'GO'),
(1114, 'Três Ranchos', 9, 'GO'),
(1115, 'Trindade', 9, 'GO'),
(1116, 'Trombas', 9, 'GO'),
(1117, 'Turvânia', 9, 'GO'),
(1118, 'Turvelândia', 9, 'GO'),
(1119, 'Uirapuru', 9, 'GO'),
(1120, 'Uruaçu', 9, 'GO'),
(1121, 'Uruana', 9, 'GO'),
(1122, 'Urutaí', 9, 'GO'),
(1123, 'Valparaíso de Goiás', 9, 'GO'),
(1124, 'Varjão', 9, 'GO'),
(1125, 'Vianópolis', 9, 'GO'),
(1126, 'Vicentinópolis', 9, 'GO'),
(1127, 'Vila Boa', 9, 'GO'),
(1128, 'Vila Propício', 9, 'GO'),
(1129, 'Açailândia', 10, 'MA'),
(1130, 'Afonso Cunha', 10, 'MA'),
(1131, 'Água Doce do Maranhão', 10, 'MA'),
(1132, 'Alcântara', 10, 'MA'),
(1133, 'Aldeias Altas', 10, 'MA'),
(1134, 'Altamira do Maranhão', 10, 'MA'),
(1135, 'Alto Alegre do Maranhão', 10, 'MA'),
(1136, 'Alto Alegre do Pindaré', 10, 'MA'),
(1137, 'Alto Parnaíba', 10, 'MA'),
(1138, 'Amapá do Maranhão', 10, 'MA'),
(1139, 'Amarante do Maranhão', 10, 'MA'),
(1140, 'Anajatuba', 10, 'MA'),
(1141, 'Anapurus', 10, 'MA'),
(1142, 'Apicum-Açu', 10, 'MA'),
(1143, 'Araguanã', 10, 'MA'),
(1144, 'Araioses', 10, 'MA'),
(1145, 'Arame', 10, 'MA'),
(1146, 'Arari', 10, 'MA'),
(1147, 'Axixá', 10, 'MA'),
(1148, 'Bacabal', 10, 'MA'),
(1149, 'Bacabeira', 10, 'MA'),
(1150, 'Bacuri', 10, 'MA'),
(1151, 'Bacurituba', 10, 'MA'),
(1152, 'Balsas', 10, 'MA'),
(1153, 'Barão de Grajaú', 10, 'MA'),
(1154, 'Barra do Corda', 10, 'MA'),
(1155, 'Barreirinhas', 10, 'MA'),
(1156, 'Bela Vista do Maranhão', 10, 'MA'),
(1157, 'Belágua', 10, 'MA'),
(1158, 'Benedito Leite', 10, 'MA'),
(1159, 'Bequimão', 10, 'MA'),
(1160, 'Bernardo do Mearim', 10, 'MA'),
(1161, 'Boa Vista do Gurupi', 10, 'MA'),
(1162, 'Bom Jardim', 10, 'MA'),
(1163, 'Bom Jesus das Selvas', 10, 'MA'),
(1164, 'Bom Lugar', 10, 'MA'),
(1165, 'Brejo', 10, 'MA'),
(1166, 'Brejo de Areia', 10, 'MA'),
(1167, 'Buriti', 10, 'MA'),
(1168, 'Buriti Bravo', 10, 'MA'),
(1169, 'Buriticupu', 10, 'MA'),
(1170, 'Buritirana', 10, 'MA'),
(1171, 'Cachoeira Grande', 10, 'MA'),
(1172, 'Cajapió', 10, 'MA'),
(1173, 'Cajari', 10, 'MA'),
(1174, 'Campestre do Maranhão', 10, 'MA'),
(1175, 'Cândido Mendes', 10, 'MA'),
(1176, 'Cantanhede', 10, 'MA'),
(1177, 'Capinzal do Norte', 10, 'MA'),
(1178, 'Carolina', 10, 'MA'),
(1179, 'Carutapera', 10, 'MA'),
(1180, 'Caxias', 10, 'MA'),
(1181, 'Cedral', 10, 'MA'),
(1182, 'Central do Maranhão', 10, 'MA'),
(1183, 'Centro do Guilherme', 10, 'MA'),
(1184, 'Centro Novo do Maranhão', 10, 'MA'),
(1185, 'Chapadinha', 10, 'MA'),
(1186, 'Cidelândia', 10, 'MA'),
(1187, 'Codó', 10, 'MA'),
(1188, 'Coelho Neto', 10, 'MA'),
(1189, 'Colinas', 10, 'MA'),
(1190, 'Conceição do Lago-Açu', 10, 'MA'),
(1191, 'Coroatá', 10, 'MA'),
(1192, 'Cururupu', 10, 'MA'),
(1193, 'Davinópolis', 10, 'MA'),
(1194, 'Dom Pedro', 10, 'MA'),
(1195, 'Duque Bacelar', 10, 'MA'),
(1196, 'Esperantinópolis', 10, 'MA'),
(1197, 'Estreito', 10, 'MA'),
(1198, 'Feira Nova do Maranhão', 10, 'MA'),
(1199, 'Fernando Falcão', 10, 'MA'),
(1200, 'Formosa da Serra Negra', 10, 'MA'),
(1201, 'Fortaleza dos Nogueiras', 10, 'MA'),
(1202, 'Fortuna', 10, 'MA'),
(1203, 'Godofredo Viana', 10, 'MA'),
(1204, 'Gonçalves Dias', 10, 'MA'),
(1205, 'Governador Archer', 10, 'MA'),
(1206, 'Governador Edison Lobão', 10, 'MA'),
(1207, 'Governador Eugênio Barros', 10, 'MA'),
(1208, 'Governador Luiz Rocha', 10, 'MA'),
(1209, 'Governador Newton Bello', 10, 'MA'),
(1210, 'Governador Nunes Freire', 10, 'MA'),
(1211, 'Graça Aranha', 10, 'MA'),
(1212, 'Grajaú', 10, 'MA'),
(1213, 'Guimarães', 10, 'MA'),
(1214, 'Humberto de Campos', 10, 'MA'),
(1215, 'Icatu', 10, 'MA'),
(1216, 'Igarapé do Meio', 10, 'MA'),
(1217, 'Igarapé Grande', 10, 'MA'),
(1218, 'Imperatriz', 10, 'MA'),
(1219, 'Itaipava do Grajaú', 10, 'MA'),
(1220, 'Itapecuru Mirim', 10, 'MA'),
(1221, 'Itinga do Maranhão', 10, 'MA'),
(1222, 'Jatobá', 10, 'MA'),
(1223, 'Jenipapo dos Vieiras', 10, 'MA'),
(1224, 'João Lisboa', 10, 'MA'),
(1225, 'Joselândia', 10, 'MA'),
(1226, 'Junco do Maranhão', 10, 'MA'),
(1227, 'Lago da Pedra', 10, 'MA'),
(1228, 'Lago do Junco', 10, 'MA'),
(1229, 'Lago dos Rodrigues', 10, 'MA'),
(1230, 'Lago Verde', 10, 'MA'),
(1231, 'Lagoa do Mato', 10, 'MA'),
(1232, 'Lagoa Grande do Maranhão', 10, 'MA'),
(1233, 'Lajeado Novo', 10, 'MA'),
(1234, 'Lima Campos', 10, 'MA'),
(1235, 'Loreto', 10, 'MA'),
(1236, 'Luís Domingues', 10, 'MA'),
(1237, 'Magalhães de Almeida', 10, 'MA'),
(1238, 'Maracaçumé', 10, 'MA'),
(1239, 'Marajá do Sena', 10, 'MA'),
(1240, 'Maranhãozinho', 10, 'MA'),
(1241, 'Mata Roma', 10, 'MA'),
(1242, 'Matinha', 10, 'MA'),
(1243, 'Matões', 10, 'MA'),
(1244, 'Matões do Norte', 10, 'MA'),
(1245, 'Milagres do Maranhão', 10, 'MA'),
(1246, 'Mirador', 10, 'MA'),
(1247, 'Miranda do Norte', 10, 'MA'),
(1248, 'Mirinzal', 10, 'MA'),
(1249, 'Monção', 10, 'MA'),
(1250, 'Montes Altos', 10, 'MA'),
(1251, 'Morros', 10, 'MA'),
(1252, 'Nina Rodrigues', 10, 'MA'),
(1253, 'Nova Colinas', 10, 'MA'),
(1254, 'Nova Iorque', 10, 'MA'),
(1255, 'Nova Olinda do Maranhão', 10, 'MA'),
(1256, 'Olho d`Água das Cunhãs', 10, 'MA'),
(1257, 'Olinda Nova do Maranhão', 10, 'MA'),
(1258, 'Paço do Lumiar', 10, 'MA'),
(1259, 'Palmeirândia', 10, 'MA'),
(1260, 'Paraibano', 10, 'MA'),
(1261, 'Parnarama', 10, 'MA'),
(1262, 'Passagem Franca', 10, 'MA'),
(1263, 'Pastos Bons', 10, 'MA'),
(1264, 'Paulino Neves', 10, 'MA'),
(1265, 'Paulo Ramos', 10, 'MA'),
(1266, 'Pedreiras', 10, 'MA'),
(1267, 'Pedro do Rosário', 10, 'MA'),
(1268, 'Penalva', 10, 'MA'),
(1269, 'Peri Mirim', 10, 'MA'),
(1270, 'Peritoró', 10, 'MA'),
(1271, 'Pindaré-Mirim', 10, 'MA'),
(1272, 'Pinheiro', 10, 'MA'),
(1273, 'Pio XII', 10, 'MA'),
(1274, 'Pirapemas', 10, 'MA'),
(1275, 'Poção de Pedras', 10, 'MA'),
(1276, 'Porto Franco', 10, 'MA'),
(1277, 'Porto Rico do Maranhão', 10, 'MA'),
(1278, 'Presidente Dutra', 10, 'MA'),
(1279, 'Presidente Juscelino', 10, 'MA'),
(1280, 'Presidente Médici', 10, 'MA'),
(1281, 'Presidente Sarney', 10, 'MA'),
(1282, 'Presidente Vargas', 10, 'MA'),
(1283, 'Primeira Cruz', 10, 'MA'),
(1284, 'Raposa', 10, 'MA'),
(1285, 'Riachão', 10, 'MA'),
(1286, 'Ribamar Fiquene', 10, 'MA'),
(1287, 'Rosário', 10, 'MA'),
(1288, 'Sambaíba', 10, 'MA'),
(1289, 'Santa Filomena do Maranhão', 10, 'MA'),
(1290, 'Santa Helena', 10, 'MA'),
(1291, 'Santa Inês', 10, 'MA'),
(1292, 'Santa Luzia', 10, 'MA'),
(1293, 'Santa Luzia do Paruá', 10, 'MA'),
(1294, 'Santa Quitéria do Maranhão', 10, 'MA'),
(1295, 'Santa Rita', 10, 'MA'),
(1296, 'Santana do Maranhão', 10, 'MA'),
(1297, 'Santo Amaro do Maranhão', 10, 'MA'),
(1298, 'Santo Antônio dos Lopes', 10, 'MA'),
(1299, 'São Benedito do Rio Preto', 10, 'MA'),
(1300, 'São Bento', 10, 'MA'),
(1301, 'São Bernardo', 10, 'MA'),
(1302, 'São Domingos do Azeitão', 10, 'MA'),
(1303, 'São Domingos do Maranhão', 10, 'MA'),
(1304, 'São Félix de Balsas', 10, 'MA'),
(1305, 'São Francisco do Brejão', 10, 'MA'),
(1306, 'São Francisco do Maranhão', 10, 'MA'),
(1307, 'São João Batista', 10, 'MA'),
(1308, 'São João do Carú', 10, 'MA'),
(1309, 'São João do Paraíso', 10, 'MA'),
(1310, 'São João do Soter', 10, 'MA'),
(1311, 'São João dos Patos', 10, 'MA'),
(1312, 'São José de Ribamar', 10, 'MA'),
(1313, 'São José dos Basílios', 10, 'MA'),
(1314, 'São Luís', 10, 'MA'),
(1315, 'São Luís Gonzaga do Maranhão', 10, 'MA'),
(1316, 'São Mateus do Maranhão', 10, 'MA'),
(1317, 'São Pedro da Água Branca', 10, 'MA'),
(1318, 'São Pedro dos Crentes', 10, 'MA'),
(1319, 'São Raimundo das Mangabeiras', 10, 'MA'),
(1320, 'São Raimundo do Doca Bezerra', 10, 'MA'),
(1321, 'São Roberto', 10, 'MA'),
(1322, 'São Vicente Ferrer', 10, 'MA'),
(1323, 'Satubinha', 10, 'MA'),
(1324, 'Senador Alexandre Costa', 10, 'MA'),
(1325, 'Senador La Rocque', 10, 'MA'),
(1326, 'Serrano do Maranhão', 10, 'MA'),
(1327, 'Sítio Novo', 10, 'MA'),
(1328, 'Sucupira do Norte', 10, 'MA'),
(1329, 'Sucupira do Riachão', 10, 'MA'),
(1330, 'Tasso Fragoso', 10, 'MA'),
(1331, 'Timbiras', 10, 'MA'),
(1332, 'Timon', 10, 'MA'),
(1333, 'Trizidela do Vale', 10, 'MA'),
(1334, 'Tufilândia', 10, 'MA'),
(1335, 'Tuntum', 10, 'MA'),
(1336, 'Turiaçu', 10, 'MA'),
(1337, 'Turilândia', 10, 'MA'),
(1338, 'Tutóia', 10, 'MA'),
(1339, 'Urbano Santos', 10, 'MA'),
(1340, 'Vargem Grande', 10, 'MA'),
(1341, 'Viana', 10, 'MA'),
(1342, 'Vila Nova dos Martírios', 10, 'MA'),
(1343, 'Vitória do Mearim', 10, 'MA'),
(1344, 'Vitorino Freire', 10, 'MA'),
(1345, 'Zé Doca', 10, 'MA'),
(1346, 'Acorizal', 13, 'MT'),
(1347, 'Água Boa', 13, 'MT'),
(1348, 'Alta Floresta', 13, 'MT'),
(1349, 'Alto Araguaia', 13, 'MT'),
(1350, 'Alto Boa Vista', 13, 'MT'),
(1351, 'Alto Garças', 13, 'MT'),
(1352, 'Alto Paraguai', 13, 'MT'),
(1353, 'Alto Taquari', 13, 'MT'),
(1354, 'Apiacás', 13, 'MT'),
(1355, 'Araguaiana', 13, 'MT'),
(1356, 'Araguainha', 13, 'MT'),
(1357, 'Araputanga', 13, 'MT'),
(1358, 'Arenápolis', 13, 'MT'),
(1359, 'Aripuanã', 13, 'MT'),
(1360, 'Barão de Melgaço', 13, 'MT'),
(1361, 'Barra do Bugres', 13, 'MT'),
(1362, 'Barra do Garças', 13, 'MT'),
(1363, 'Bom Jesus do Araguaia', 13, 'MT'),
(1364, 'Brasnorte', 13, 'MT'),
(1365, 'Cáceres', 13, 'MT'),
(1366, 'Campinápolis', 13, 'MT'),
(1367, 'Campo Novo do Parecis', 13, 'MT'),
(1368, 'Campo Verde', 13, 'MT'),
(1369, 'Campos de Júlio', 13, 'MT'),
(1370, 'Canabrava do Norte', 13, 'MT'),
(1371, 'Canarana', 13, 'MT'),
(1372, 'Carlinda', 13, 'MT'),
(1373, 'Castanheira', 13, 'MT'),
(1374, 'Chapada dos Guimarães', 13, 'MT'),
(1375, 'Cláudia', 13, 'MT'),
(1376, 'Cocalinho', 13, 'MT'),
(1377, 'Colíder', 13, 'MT'),
(1378, 'Colniza', 13, 'MT'),
(1379, 'Comodoro', 13, 'MT'),
(1380, 'Confresa', 13, 'MT'),
(1381, 'Conquista d`Oeste', 13, 'MT'),
(1382, 'Cotriguaçu', 13, 'MT'),
(1383, 'Cuiabá', 13, 'MT'),
(1384, 'Curvelândia', 13, 'MT'),
(1385, 'Curvelândia', 13, 'MT'),
(1386, 'Denise', 13, 'MT'),
(1387, 'Diamantino', 13, 'MT'),
(1388, 'Dom Aquino', 13, 'MT'),
(1389, 'Feliz Natal', 13, 'MT'),
(1390, 'Figueirópolis d`Oeste', 13, 'MT'),
(1391, 'Gaúcha do Norte', 13, 'MT'),
(1392, 'General Carneiro', 13, 'MT'),
(1393, 'Glória d`Oeste', 13, 'MT'),
(1394, 'Guarantã do Norte', 13, 'MT'),
(1395, 'Guiratinga', 13, 'MT'),
(1396, 'Indiavaí', 13, 'MT'),
(1397, 'Ipiranga do Norte', 13, 'MT'),
(1398, 'Itanhangá', 13, 'MT'),
(1399, 'Itaúba', 13, 'MT'),
(1400, 'Itiquira', 13, 'MT'),
(1401, 'Jaciara', 13, 'MT'),
(1402, 'Jangada', 13, 'MT'),
(1403, 'Jauru', 13, 'MT'),
(1404, 'Juara', 13, 'MT'),
(1405, 'Juína', 13, 'MT'),
(1406, 'Juruena', 13, 'MT'),
(1407, 'Juscimeira', 13, 'MT'),
(1408, 'Lambari d`Oeste', 13, 'MT'),
(1409, 'Lucas do Rio Verde', 13, 'MT'),
(1410, 'Luciára', 13, 'MT'),
(1411, 'Marcelândia', 13, 'MT'),
(1412, 'Matupá', 13, 'MT'),
(1413, 'Mirassol d`Oeste', 13, 'MT'),
(1414, 'Nobres', 13, 'MT'),
(1415, 'Nortelândia', 13, 'MT'),
(1416, 'Nossa Senhora do Livramento', 13, 'MT'),
(1417, 'Nova Bandeirantes', 13, 'MT'),
(1418, 'Nova Brasilândia', 13, 'MT'),
(1419, 'Nova Canaã do Norte', 13, 'MT'),
(1420, 'Nova Guarita', 13, 'MT'),
(1421, 'Nova Lacerda', 13, 'MT'),
(1422, 'Nova Marilândia', 13, 'MT'),
(1423, 'Nova Maringá', 13, 'MT'),
(1424, 'Nova Monte verde', 13, 'MT'),
(1425, 'Nova Mutum', 13, 'MT'),
(1426, 'Nova Olímpia', 13, 'MT'),
(1427, 'Nova Santa Helena', 13, 'MT'),
(1428, 'Nova Ubiratã', 13, 'MT'),
(1429, 'Nova Xavantina', 13, 'MT'),
(1430, 'Novo Horizonte do Norte', 13, 'MT'),
(1431, 'Novo Mundo', 13, 'MT'),
(1432, 'Novo Santo Antônio', 13, 'MT'),
(1433, 'Novo São Joaquim', 13, 'MT'),
(1434, 'Paranaíta', 13, 'MT'),
(1435, 'Paranatinga', 13, 'MT'),
(1436, 'Pedra Preta', 13, 'MT'),
(1437, 'Peixoto de Azevedo', 13, 'MT'),
(1438, 'Planalto da Serra', 13, 'MT'),
(1439, 'Poconé', 13, 'MT'),
(1440, 'Pontal do Araguaia', 13, 'MT'),
(1441, 'Ponte Branca', 13, 'MT'),
(1442, 'Pontes e Lacerda', 13, 'MT'),
(1443, 'Porto Alegre do Norte', 13, 'MT'),
(1444, 'Porto dos Gaúchos', 13, 'MT'),
(1445, 'Porto Esperidião', 13, 'MT'),
(1446, 'Porto Estrela', 13, 'MT'),
(1447, 'Poxoréo', 13, 'MT'),
(1448, 'Primavera do Leste', 13, 'MT'),
(1449, 'Querência', 13, 'MT'),
(1450, 'Reserva do Cabaçal', 13, 'MT'),
(1451, 'Ribeirão Cascalheira', 13, 'MT'),
(1452, 'Ribeirãozinho', 13, 'MT'),
(1453, 'Rio Branco', 13, 'MT'),
(1454, 'Rondolândia', 13, 'MT'),
(1455, 'Rondonópolis', 13, 'MT'),
(1456, 'Rosário Oeste', 13, 'MT'),
(1457, 'Salto do Céu', 13, 'MT'),
(1458, 'Santa Carmem', 13, 'MT'),
(1459, 'Santa Cruz do Xingu', 13, 'MT'),
(1460, 'Santa Rita do Trivelato', 13, 'MT'),
(1461, 'Santa Terezinha', 13, 'MT'),
(1462, 'Santo Afonso', 13, 'MT'),
(1463, 'Santo Antônio do Leste', 13, 'MT'),
(1464, 'Santo Antônio do Leverger', 13, 'MT'),
(1465, 'São Félix do Araguaia', 13, 'MT'),
(1466, 'São José do Povo', 13, 'MT'),
(1467, 'São José do Rio Claro', 13, 'MT'),
(1468, 'São José do Xingu', 13, 'MT'),
(1469, 'São José dos Quatro Marcos', 13, 'MT'),
(1470, 'São Pedro da Cipa', 13, 'MT'),
(1471, 'Sapezal', 13, 'MT'),
(1472, 'Serra Nova Dourada', 13, 'MT'),
(1473, 'Sinop', 13, 'MT'),
(1474, 'Sorriso', 13, 'MT'),
(1475, 'Tabaporã', 13, 'MT'),
(1476, 'Tangará da Serra', 13, 'MT'),
(1477, 'Tapurah', 13, 'MT'),
(1478, 'Terra Nova do Norte', 13, 'MT'),
(1479, 'Tesouro', 13, 'MT'),
(1480, 'Torixoréu', 13, 'MT'),
(1481, 'União do Sul', 13, 'MT'),
(1482, 'Vale de São Domingos', 13, 'MT'),
(1483, 'Várzea Grande', 13, 'MT'),
(1484, 'Vera', 13, 'MT'),
(1485, 'Vila Bela da Santíssima Trindade', 13, 'MT'),
(1486, 'Vila Rica', 13, 'MT'),
(1487, 'Água Clara', 12, 'MS'),
(1488, 'Alcinópolis', 12, 'MS'),
(1489, 'Amambaí', 12, 'MS'),
(1490, 'Anastácio', 12, 'MS'),
(1491, 'Anaurilândia', 12, 'MS'),
(1492, 'Angélica', 12, 'MS'),
(1493, 'Antônio João', 12, 'MS'),
(1494, 'Aparecida do Taboado', 12, 'MS'),
(1495, 'Aquidauana', 12, 'MS'),
(1496, 'Aral Moreira', 12, 'MS'),
(1497, 'Bandeirantes', 12, 'MS'),
(1498, 'Bataguassu', 12, 'MS'),
(1499, 'Bataiporã', 12, 'MS'),
(1500, 'Bela Vista', 12, 'MS'),
(1501, 'Bodoquena', 12, 'MS'),
(1502, 'Bonito', 12, 'MS'),
(1503, 'Brasilândia', 12, 'MS'),
(1504, 'Caarapó', 12, 'MS'),
(1505, 'Camapuã', 12, 'MS'),
(1506, 'Campo Grande', 12, 'MS'),
(1507, 'Caracol', 12, 'MS'),
(1508, 'Cassilândia', 12, 'MS'),
(1509, 'Chapadão do Sul', 12, 'MS'),
(1510, 'Corguinho', 12, 'MS'),
(1511, 'Coronel Sapucaia', 12, 'MS'),
(1512, 'Corumbá', 12, 'MS'),
(1513, 'Costa Rica', 12, 'MS'),
(1514, 'Coxim', 12, 'MS'),
(1515, 'Deodápolis', 12, 'MS'),
(1516, 'Dois Irmãos do Buriti', 12, 'MS'),
(1517, 'Douradina', 12, 'MS'),
(1518, 'Dourados', 12, 'MS'),
(1519, 'Eldorado', 12, 'MS'),
(1520, 'Fátima do Sul', 12, 'MS'),
(1521, 'Figueirão', 12, 'MS'),
(1522, 'Glória de Dourados', 12, 'MS'),
(1523, 'Guia Lopes da Laguna', 12, 'MS'),
(1524, 'Iguatemi', 12, 'MS'),
(1525, 'Inocência', 12, 'MS'),
(1526, 'Itaporã', 12, 'MS'),
(1527, 'Itaquiraí', 12, 'MS'),
(1528, 'Ivinhema', 12, 'MS'),
(1529, 'Japorã', 12, 'MS'),
(1530, 'Jaraguari', 12, 'MS'),
(1531, 'Jardim', 12, 'MS'),
(1532, 'Jateí', 12, 'MS'),
(1533, 'Juti', 12, 'MS'),
(1534, 'Ladário', 12, 'MS'),
(1535, 'Laguna Carapã', 12, 'MS'),
(1536, 'Maracaju', 12, 'MS'),
(1537, 'Miranda', 12, 'MS'),
(1538, 'Mundo Novo', 12, 'MS'),
(1539, 'Naviraí', 12, 'MS'),
(1540, 'Nioaque', 12, 'MS'),
(1541, 'Nova Alvorada do Sul', 12, 'MS'),
(1542, 'Nova Andradina', 12, 'MS'),
(1543, 'Novo Horizonte do Sul', 12, 'MS'),
(1544, 'Paranaíba', 12, 'MS'),
(1545, 'Paranhos', 12, 'MS'),
(1546, 'Pedro Gomes', 12, 'MS'),
(1547, 'Ponta Porã', 12, 'MS'),
(1548, 'Porto Murtinho', 12, 'MS'),
(1549, 'Ribas do Rio Pardo', 12, 'MS'),
(1550, 'Rio Brilhante', 12, 'MS'),
(1551, 'Rio Negro', 12, 'MS'),
(1552, 'Rio Verde de Mato Grosso', 12, 'MS'),
(1553, 'Rochedo', 12, 'MS'),
(1554, 'Santa Rita do Pardo', 12, 'MS'),
(1555, 'São Gabriel do Oeste', 12, 'MS'),
(1556, 'Selvíria', 12, 'MS'),
(1557, 'Sete Quedas', 12, 'MS'),
(1558, 'Sidrolândia', 12, 'MS'),
(1559, 'Sonora', 12, 'MS'),
(1560, 'Tacuru', 12, 'MS'),
(1561, 'Taquarussu', 12, 'MS'),
(1562, 'Terenos', 12, 'MS'),
(1563, 'Três Lagoas', 12, 'MS'),
(1564, 'Vicentina', 12, 'MS'),
(1565, 'Abadia dos Dourados', 11, 'MG'),
(1566, 'Abaeté', 11, 'MG'),
(1567, 'Abre Campo', 11, 'MG'),
(1568, 'Acaiaca', 11, 'MG'),
(1569, 'Açucena', 11, 'MG'),
(1570, 'Água Boa', 11, 'MG'),
(1571, 'Água Comprida', 11, 'MG'),
(1572, 'Aguanil', 11, 'MG'),
(1573, 'Águas Formosas', 11, 'MG'),
(1574, 'Águas Vermelhas', 11, 'MG'),
(1575, 'Aimorés', 11, 'MG'),
(1576, 'Aiuruoca', 11, 'MG'),
(1577, 'Alagoa', 11, 'MG'),
(1578, 'Albertina', 11, 'MG'),
(1579, 'Além Paraíba', 11, 'MG'),
(1580, 'Alfenas', 11, 'MG'),
(1581, 'Alfredo Vasconcelos', 11, 'MG'),
(1582, 'Almenara', 11, 'MG'),
(1583, 'Alpercata', 11, 'MG'),
(1584, 'Alpinópolis', 11, 'MG'),
(1585, 'Alterosa', 11, 'MG'),
(1586, 'Alto Caparaó', 11, 'MG'),
(1587, 'Alto Jequitibá', 11, 'MG'),
(1588, 'Alto Rio Doce', 11, 'MG'),
(1589, 'Alvarenga', 11, 'MG'),
(1590, 'Alvinópolis', 11, 'MG'),
(1591, 'Alvorada de Minas', 11, 'MG'),
(1592, 'Amparo do Serra', 11, 'MG'),
(1593, 'Andradas', 11, 'MG'),
(1594, 'Andrelândia', 11, 'MG'),
(1595, 'Angelândia', 11, 'MG'),
(1596, 'Antônio Carlos', 11, 'MG'),
(1597, 'Antônio Dias', 11, 'MG'),
(1598, 'Antônio Prado de Minas', 11, 'MG'),
(1599, 'Araçaí', 11, 'MG'),
(1600, 'Aracitaba', 11, 'MG'),
(1601, 'Araçuaí', 11, 'MG'),
(1602, 'Araguari', 11, 'MG'),
(1603, 'Arantina', 11, 'MG'),
(1604, 'Araponga', 11, 'MG'),
(1605, 'Araporã', 11, 'MG'),
(1606, 'Arapuá', 11, 'MG'),
(1607, 'Araújos', 11, 'MG'),
(1608, 'Araxá', 11, 'MG'),
(1609, 'Arceburgo', 11, 'MG'),
(1610, 'Arcos', 11, 'MG'),
(1611, 'Areado', 11, 'MG'),
(1612, 'Argirita', 11, 'MG'),
(1613, 'Aricanduva', 11, 'MG'),
(1614, 'Arinos', 11, 'MG'),
(1615, 'Astolfo Dutra', 11, 'MG'),
(1616, 'Ataléia', 11, 'MG'),
(1617, 'Augusto de Lima', 11, 'MG'),
(1618, 'Baependi', 11, 'MG'),
(1619, 'Baldim', 11, 'MG'),
(1620, 'Bambuí', 11, 'MG'),
(1621, 'Bandeira', 11, 'MG'),
(1622, 'Bandeira do Sul', 11, 'MG'),
(1623, 'Barão de Cocais', 11, 'MG'),
(1624, 'Barão de Monte Alto', 11, 'MG'),
(1625, 'Barbacena', 11, 'MG'),
(1626, 'Barra Longa', 11, 'MG'),
(1627, 'Barroso', 11, 'MG'),
(1628, 'Bela Vista de Minas', 11, 'MG'),
(1629, 'Belmiro Braga', 11, 'MG'),
(1630, 'Belo Horizonte', 11, 'MG'),
(1631, 'Belo Oriente', 11, 'MG'),
(1632, 'Belo Vale', 11, 'MG'),
(1633, 'Berilo', 11, 'MG'),
(1634, 'Berizal', 11, 'MG'),
(1635, 'Bertópolis', 11, 'MG'),
(1636, 'Betim', 11, 'MG'),
(1637, 'Bias Fortes', 11, 'MG'),
(1638, 'Bicas', 11, 'MG'),
(1639, 'Biquinhas', 11, 'MG'),
(1640, 'Boa Esperança', 11, 'MG'),
(1641, 'Bocaina de Minas', 11, 'MG'),
(1642, 'Bocaiúva', 11, 'MG'),
(1643, 'Bom Despacho', 11, 'MG'),
(1644, 'Bom Jardim de Minas', 11, 'MG'),
(1645, 'Bom Jesus da Penha', 11, 'MG'),
(1646, 'Bom Jesus do Amparo', 11, 'MG'),
(1647, 'Bom Jesus do Galho', 11, 'MG'),
(1648, 'Bom Repouso', 11, 'MG'),
(1649, 'Bom Sucesso', 11, 'MG'),
(1650, 'Bonfim', 11, 'MG'),
(1651, 'Bonfinópolis de Minas', 11, 'MG'),
(1652, 'Bonito de Minas', 11, 'MG'),
(1653, 'Borda da Mata', 11, 'MG'),
(1654, 'Botelhos', 11, 'MG'),
(1655, 'Botumirim', 11, 'MG'),
(1656, 'Brás Pires', 11, 'MG'),
(1657, 'Brasilândia de Minas', 11, 'MG'),
(1658, 'Brasília de Minas', 11, 'MG'),
(1659, 'Brasópolis', 11, 'MG'),
(1660, 'Braúnas', 11, 'MG'),
(1661, 'Brumadinho', 11, 'MG'),
(1662, 'Bueno Brandão', 11, 'MG'),
(1663, 'Buenópolis', 11, 'MG'),
(1664, 'Bugre', 11, 'MG'),
(1665, 'Buritis', 11, 'MG'),
(1666, 'Buritizeiro', 11, 'MG');
INSERT INTO `cidade` (`id`, `nome`, `estado`, `uf`) VALUES
(1667, 'Cabeceira Grande', 11, 'MG'),
(1668, 'Cabo Verde', 11, 'MG'),
(1669, 'Cachoeira da Prata', 11, 'MG'),
(1670, 'Cachoeira de Minas', 11, 'MG'),
(1671, 'Cachoeira de Pajeú', 11, 'MG'),
(1672, 'Cachoeira Dourada', 11, 'MG'),
(1673, 'Caetanópolis', 11, 'MG'),
(1674, 'Caeté', 11, 'MG'),
(1675, 'Caiana', 11, 'MG'),
(1676, 'Cajuri', 11, 'MG'),
(1677, 'Caldas', 11, 'MG'),
(1678, 'Camacho', 11, 'MG'),
(1679, 'Camanducaia', 11, 'MG'),
(1680, 'Cambuí', 11, 'MG'),
(1681, 'Cambuquira', 11, 'MG'),
(1682, 'Campanário', 11, 'MG'),
(1683, 'Campanha', 11, 'MG'),
(1684, 'Campestre', 11, 'MG'),
(1685, 'Campina Verde', 11, 'MG'),
(1686, 'Campo Azul', 11, 'MG'),
(1687, 'Campo Belo', 11, 'MG'),
(1688, 'Campo do Meio', 11, 'MG'),
(1689, 'Campo Florido', 11, 'MG'),
(1690, 'Campos Altos', 11, 'MG'),
(1691, 'Campos Gerais', 11, 'MG'),
(1692, 'Cana Verde', 11, 'MG'),
(1693, 'Canaã', 11, 'MG'),
(1694, 'Canápolis', 11, 'MG'),
(1695, 'Candeias', 11, 'MG'),
(1696, 'Cantagalo', 11, 'MG'),
(1697, 'Caparaó', 11, 'MG'),
(1698, 'Capela Nova', 11, 'MG'),
(1699, 'Capelinha', 11, 'MG'),
(1700, 'Capetinga', 11, 'MG'),
(1701, 'Capim Branco', 11, 'MG'),
(1702, 'Capinópolis', 11, 'MG'),
(1703, 'Capitão Andrade', 11, 'MG'),
(1704, 'Capitão Enéas', 11, 'MG'),
(1705, 'Capitólio', 11, 'MG'),
(1706, 'Caputira', 11, 'MG'),
(1707, 'Caraí', 11, 'MG'),
(1708, 'Caranaíba', 11, 'MG'),
(1709, 'Carandaí', 11, 'MG'),
(1710, 'Carangola', 11, 'MG'),
(1711, 'Caratinga', 11, 'MG'),
(1712, 'Carbonita', 11, 'MG'),
(1713, 'Careaçu', 11, 'MG'),
(1714, 'Carlos Chagas', 11, 'MG'),
(1715, 'Carmésia', 11, 'MG'),
(1716, 'Carmo da Cachoeira', 11, 'MG'),
(1717, 'Carmo da Mata', 11, 'MG'),
(1718, 'Carmo de Minas', 11, 'MG'),
(1719, 'Carmo do Cajuru', 11, 'MG'),
(1720, 'Carmo do Paranaíba', 11, 'MG'),
(1721, 'Carmo do Rio Claro', 11, 'MG'),
(1722, 'Carmópolis de Minas', 11, 'MG'),
(1723, 'Carneirinho', 11, 'MG'),
(1724, 'Carrancas', 11, 'MG'),
(1725, 'Carvalhópolis', 11, 'MG'),
(1726, 'Carvalhos', 11, 'MG'),
(1727, 'Casa Grande', 11, 'MG'),
(1728, 'Cascalho Rico', 11, 'MG'),
(1729, 'Cássia', 11, 'MG'),
(1730, 'Cataguases', 11, 'MG'),
(1731, 'Catas Altas', 11, 'MG'),
(1732, 'Catas Altas da Noruega', 11, 'MG'),
(1733, 'Catuji', 11, 'MG'),
(1734, 'Catuti', 11, 'MG'),
(1735, 'Caxambu', 11, 'MG'),
(1736, 'Cedro do Abaeté', 11, 'MG'),
(1737, 'Central de Minas', 11, 'MG'),
(1738, 'Centralina', 11, 'MG'),
(1739, 'Chácara', 11, 'MG'),
(1740, 'Chalé', 11, 'MG'),
(1741, 'Chapada do Norte', 11, 'MG'),
(1742, 'Chapada Gaúcha', 11, 'MG'),
(1743, 'Chiador', 11, 'MG'),
(1744, 'Cipotânea', 11, 'MG'),
(1745, 'Claraval', 11, 'MG'),
(1746, 'Claro dos Poções', 11, 'MG'),
(1747, 'Cláudio', 11, 'MG'),
(1748, 'Coimbra', 11, 'MG'),
(1749, 'Coluna', 11, 'MG'),
(1750, 'Comendador Gomes', 11, 'MG'),
(1751, 'Comercinho', 11, 'MG'),
(1752, 'Conceição da Aparecida', 11, 'MG'),
(1753, 'Conceição da Barra de Minas', 11, 'MG'),
(1754, 'Conceição das Alagoas', 11, 'MG'),
(1755, 'Conceição das Pedras', 11, 'MG'),
(1756, 'Conceição de Ipanema', 11, 'MG'),
(1757, 'Conceição do Mato Dentro', 11, 'MG'),
(1758, 'Conceição do Pará', 11, 'MG'),
(1759, 'Conceição do Rio Verde', 11, 'MG'),
(1760, 'Conceição dos Ouros', 11, 'MG'),
(1761, 'Cônego Marinho', 11, 'MG'),
(1762, 'Confins', 11, 'MG'),
(1763, 'Congonhal', 11, 'MG'),
(1764, 'Congonhas', 11, 'MG'),
(1765, 'Congonhas do Norte', 11, 'MG'),
(1766, 'Conquista', 11, 'MG'),
(1767, 'Conselheiro Lafaiete', 11, 'MG'),
(1768, 'Conselheiro Pena', 11, 'MG'),
(1769, 'Consolação', 11, 'MG'),
(1770, 'Contagem', 11, 'MG'),
(1771, 'Coqueiral', 11, 'MG'),
(1772, 'Coração de Jesus', 11, 'MG'),
(1773, 'Cordisburgo', 11, 'MG'),
(1774, 'Cordislândia', 11, 'MG'),
(1775, 'Corinto', 11, 'MG'),
(1776, 'Coroaci', 11, 'MG'),
(1777, 'Coromandel', 11, 'MG'),
(1778, 'Coronel Fabriciano', 11, 'MG'),
(1779, 'Coronel Murta', 11, 'MG'),
(1780, 'Coronel Pacheco', 11, 'MG'),
(1781, 'Coronel Xavier Chaves', 11, 'MG'),
(1782, 'Córrego Danta', 11, 'MG'),
(1783, 'Córrego do Bom Jesus', 11, 'MG'),
(1784, 'Córrego Fundo', 11, 'MG'),
(1785, 'Córrego Novo', 11, 'MG'),
(1786, 'Couto de Magalhães de Minas', 11, 'MG'),
(1787, 'Crisólita', 11, 'MG'),
(1788, 'Cristais', 11, 'MG'),
(1789, 'Cristália', 11, 'MG'),
(1790, 'Cristiano Otoni', 11, 'MG'),
(1791, 'Cristina', 11, 'MG'),
(1792, 'Crucilândia', 11, 'MG'),
(1793, 'Cruzeiro da Fortaleza', 11, 'MG'),
(1794, 'Cruzília', 11, 'MG'),
(1795, 'Cuparaque', 11, 'MG'),
(1796, 'Curral de Dentro', 11, 'MG'),
(1797, 'Curvelo', 11, 'MG'),
(1798, 'Datas', 11, 'MG'),
(1799, 'Delfim Moreira', 11, 'MG'),
(1800, 'Delfinópolis', 11, 'MG'),
(1801, 'Delta', 11, 'MG'),
(1802, 'Descoberto', 11, 'MG'),
(1803, 'Desterro de Entre Rios', 11, 'MG'),
(1804, 'Desterro do Melo', 11, 'MG'),
(1805, 'Diamantina', 11, 'MG'),
(1806, 'Diogo de Vasconcelos', 11, 'MG'),
(1807, 'Dionísio', 11, 'MG'),
(1808, 'Divinésia', 11, 'MG'),
(1809, 'Divino', 11, 'MG'),
(1810, 'Divino das Laranjeiras', 11, 'MG'),
(1811, 'Divinolândia de Minas', 11, 'MG'),
(1812, 'Divinópolis', 11, 'MG'),
(1813, 'Divisa Alegre', 11, 'MG'),
(1814, 'Divisa Nova', 11, 'MG'),
(1815, 'Divisópolis', 11, 'MG'),
(1816, 'Dom Bosco', 11, 'MG'),
(1817, 'Dom Cavati', 11, 'MG'),
(1818, 'Dom Joaquim', 11, 'MG'),
(1819, 'Dom Silvério', 11, 'MG'),
(1820, 'Dom Viçoso', 11, 'MG'),
(1821, 'Dona Eusébia', 11, 'MG'),
(1822, 'Dores de Campos', 11, 'MG'),
(1823, 'Dores de Guanhães', 11, 'MG'),
(1824, 'Dores do Indaiá', 11, 'MG'),
(1825, 'Dores do Turvo', 11, 'MG'),
(1826, 'Doresópolis', 11, 'MG'),
(1827, 'Douradoquara', 11, 'MG'),
(1828, 'Durandé', 11, 'MG'),
(1829, 'Elói Mendes', 11, 'MG'),
(1830, 'Engenheiro Caldas', 11, 'MG'),
(1831, 'Engenheiro Navarro', 11, 'MG'),
(1832, 'Entre Folhas', 11, 'MG'),
(1833, 'Entre Rios de Minas', 11, 'MG'),
(1834, 'Ervália', 11, 'MG'),
(1835, 'Esmeraldas', 11, 'MG'),
(1836, 'Espera Feliz', 11, 'MG'),
(1837, 'Espinosa', 11, 'MG'),
(1838, 'Espírito Santo do Dourado', 11, 'MG'),
(1839, 'Estiva', 11, 'MG'),
(1840, 'Estrela Dalva', 11, 'MG'),
(1841, 'Estrela do Indaiá', 11, 'MG'),
(1842, 'Estrela do Sul', 11, 'MG'),
(1843, 'Eugenópolis', 11, 'MG'),
(1844, 'Ewbank da Câmara', 11, 'MG'),
(1845, 'Extrema', 11, 'MG'),
(1846, 'Fama', 11, 'MG'),
(1847, 'Faria Lemos', 11, 'MG'),
(1848, 'Felício dos Santos', 11, 'MG'),
(1849, 'Felisburgo', 11, 'MG'),
(1850, 'Felixlândia', 11, 'MG'),
(1851, 'Fernandes Tourinho', 11, 'MG'),
(1852, 'Ferros', 11, 'MG'),
(1853, 'Fervedouro', 11, 'MG'),
(1854, 'Florestal', 11, 'MG'),
(1855, 'Formiga', 11, 'MG'),
(1856, 'Formoso', 11, 'MG'),
(1857, 'Fortaleza de Minas', 11, 'MG'),
(1858, 'Fortuna de Minas', 11, 'MG'),
(1859, 'Francisco Badaró', 11, 'MG'),
(1860, 'Francisco Dumont', 11, 'MG'),
(1861, 'Francisco Sá', 11, 'MG'),
(1862, 'Franciscópolis', 11, 'MG'),
(1863, 'Frei Gaspar', 11, 'MG'),
(1864, 'Frei Inocêncio', 11, 'MG'),
(1865, 'Frei Lagonegro', 11, 'MG'),
(1866, 'Fronteira', 11, 'MG'),
(1867, 'Fronteira dos Vales', 11, 'MG'),
(1868, 'Fruta de Leite', 11, 'MG'),
(1869, 'Frutal', 11, 'MG'),
(1870, 'Funilândia', 11, 'MG'),
(1871, 'Galiléia', 11, 'MG'),
(1872, 'Gameleiras', 11, 'MG'),
(1873, 'Glaucilândia', 11, 'MG'),
(1874, 'Goiabeira', 11, 'MG'),
(1875, 'Goianá', 11, 'MG'),
(1876, 'Gonçalves', 11, 'MG'),
(1877, 'Gonzaga', 11, 'MG'),
(1878, 'Gouveia', 11, 'MG'),
(1879, 'Governador Valadares', 11, 'MG'),
(1880, 'Grão Mogol', 11, 'MG'),
(1881, 'Grupiara', 11, 'MG'),
(1882, 'Guanhães', 11, 'MG'),
(1883, 'Guapé', 11, 'MG'),
(1884, 'Guaraciaba', 11, 'MG'),
(1885, 'Guaraciama', 11, 'MG'),
(1886, 'Guaranésia', 11, 'MG'),
(1887, 'Guarani', 11, 'MG'),
(1888, 'Guarará', 11, 'MG'),
(1889, 'Guarda-Mor', 11, 'MG'),
(1890, 'Guaxupé', 11, 'MG'),
(1891, 'Guidoval', 11, 'MG'),
(1892, 'Guimarânia', 11, 'MG'),
(1893, 'Guiricema', 11, 'MG'),
(1894, 'Gurinhatã', 11, 'MG'),
(1895, 'Heliodora', 11, 'MG'),
(1896, 'Iapu', 11, 'MG'),
(1897, 'Ibertioga', 11, 'MG'),
(1898, 'Ibiá', 11, 'MG'),
(1899, 'Ibiaí', 11, 'MG'),
(1900, 'Ibiracatu', 11, 'MG'),
(1901, 'Ibiraci', 11, 'MG'),
(1902, 'Ibirité', 11, 'MG'),
(1903, 'Ibitiúra de Minas', 11, 'MG'),
(1904, 'Ibituruna', 11, 'MG'),
(1905, 'Icaraí de Minas', 11, 'MG'),
(1906, 'Igarapé', 11, 'MG'),
(1907, 'Igaratinga', 11, 'MG'),
(1908, 'Iguatama', 11, 'MG'),
(1909, 'Ijaci', 11, 'MG'),
(1910, 'Ilicínea', 11, 'MG'),
(1911, 'Imbé de Minas', 11, 'MG'),
(1912, 'Inconfidentes', 11, 'MG'),
(1913, 'Indaiabira', 11, 'MG'),
(1914, 'Indianópolis', 11, 'MG'),
(1915, 'Ingaí', 11, 'MG'),
(1916, 'Inhapim', 11, 'MG'),
(1917, 'Inhaúma', 11, 'MG'),
(1918, 'Inimutaba', 11, 'MG'),
(1919, 'Ipaba', 11, 'MG'),
(1920, 'Ipanema', 11, 'MG'),
(1921, 'Ipatinga', 11, 'MG'),
(1922, 'Ipiaçu', 11, 'MG'),
(1923, 'Ipuiúna', 11, 'MG'),
(1924, 'Iraí de Minas', 11, 'MG'),
(1925, 'Itabira', 11, 'MG'),
(1926, 'Itabirinha de Mantena', 11, 'MG'),
(1927, 'Itabirito', 11, 'MG'),
(1928, 'Itacambira', 11, 'MG'),
(1929, 'Itacarambi', 11, 'MG'),
(1930, 'Itaguara', 11, 'MG'),
(1931, 'Itaipé', 11, 'MG'),
(1932, 'Itajubá', 11, 'MG'),
(1933, 'Itamarandiba', 11, 'MG'),
(1934, 'Itamarati de Minas', 11, 'MG'),
(1935, 'Itambacuri', 11, 'MG'),
(1936, 'Itambé do Mato Dentro', 11, 'MG'),
(1937, 'Itamogi', 11, 'MG'),
(1938, 'Itamonte', 11, 'MG'),
(1939, 'Itanhandu', 11, 'MG'),
(1940, 'Itanhomi', 11, 'MG'),
(1941, 'Itaobim', 11, 'MG'),
(1942, 'Itapagipe', 11, 'MG'),
(1943, 'Itapecerica', 11, 'MG'),
(1944, 'Itapeva', 11, 'MG'),
(1945, 'Itatiaiuçu', 11, 'MG'),
(1946, 'Itaú de Minas', 11, 'MG'),
(1947, 'Itaúna', 11, 'MG'),
(1948, 'Itaverava', 11, 'MG'),
(1949, 'Itinga', 11, 'MG'),
(1950, 'Itueta', 11, 'MG'),
(1951, 'Ituiutaba', 11, 'MG'),
(1952, 'Itumirim', 11, 'MG'),
(1953, 'Iturama', 11, 'MG'),
(1954, 'Itutinga', 11, 'MG'),
(1955, 'Jaboticatubas', 11, 'MG'),
(1956, 'Jacinto', 11, 'MG'),
(1957, 'Jacuí', 11, 'MG'),
(1958, 'Jacutinga', 11, 'MG'),
(1959, 'Jaguaraçu', 11, 'MG'),
(1960, 'Jaíba', 11, 'MG'),
(1961, 'Jampruca', 11, 'MG'),
(1962, 'Janaúba', 11, 'MG'),
(1963, 'Januária', 11, 'MG'),
(1964, 'Japaraíba', 11, 'MG'),
(1965, 'Japonvar', 11, 'MG'),
(1966, 'Jeceaba', 11, 'MG'),
(1967, 'Jenipapo de Minas', 11, 'MG'),
(1968, 'Jequeri', 11, 'MG'),
(1969, 'Jequitaí', 11, 'MG'),
(1970, 'Jequitibá', 11, 'MG'),
(1971, 'Jequitinhonha', 11, 'MG'),
(1972, 'Jesuânia', 11, 'MG'),
(1973, 'Joaíma', 11, 'MG'),
(1974, 'Joanésia', 11, 'MG'),
(1975, 'João Monlevade', 11, 'MG'),
(1976, 'João Pinheiro', 11, 'MG'),
(1977, 'Joaquim Felício', 11, 'MG'),
(1978, 'Jordânia', 11, 'MG'),
(1979, 'José Gonçalves de Minas', 11, 'MG'),
(1980, 'José Raydan', 11, 'MG'),
(1981, 'Josenópolis', 11, 'MG'),
(1982, 'Juatuba', 11, 'MG'),
(1983, 'Juiz de Fora', 11, 'MG'),
(1984, 'Juramento', 11, 'MG'),
(1985, 'Juruaia', 11, 'MG'),
(1986, 'Juvenília', 11, 'MG'),
(1987, 'Ladainha', 11, 'MG'),
(1988, 'Lagamar', 11, 'MG'),
(1989, 'Lagoa da Prata', 11, 'MG'),
(1990, 'Lagoa dos Patos', 11, 'MG'),
(1991, 'Lagoa Dourada', 11, 'MG'),
(1992, 'Lagoa Formosa', 11, 'MG'),
(1993, 'Lagoa Grande', 11, 'MG'),
(1994, 'Lagoa Santa', 11, 'MG'),
(1995, 'Lajinha', 11, 'MG'),
(1996, 'Lambari', 11, 'MG'),
(1997, 'Lamim', 11, 'MG'),
(1998, 'Laranjal', 11, 'MG'),
(1999, 'Lassance', 11, 'MG'),
(2000, 'Lavras', 11, 'MG'),
(2001, 'Leandro Ferreira', 11, 'MG'),
(2002, 'Leme do Prado', 11, 'MG'),
(2003, 'Leopoldina', 11, 'MG'),
(2004, 'Liberdade', 11, 'MG'),
(2005, 'Lima Duarte', 11, 'MG'),
(2006, 'Limeira do Oeste', 11, 'MG'),
(2007, 'Lontra', 11, 'MG'),
(2008, 'Luisburgo', 11, 'MG'),
(2009, 'Luislândia', 11, 'MG'),
(2010, 'Luminárias', 11, 'MG'),
(2011, 'Luz', 11, 'MG'),
(2012, 'Machacalis', 11, 'MG'),
(2013, 'Machado', 11, 'MG'),
(2014, 'Madre de Deus de Minas', 11, 'MG'),
(2015, 'Malacacheta', 11, 'MG'),
(2016, 'Mamonas', 11, 'MG'),
(2017, 'Manga', 11, 'MG'),
(2018, 'Manhuaçu', 11, 'MG'),
(2019, 'Manhumirim', 11, 'MG'),
(2020, 'Mantena', 11, 'MG'),
(2021, 'Mar de Espanha', 11, 'MG'),
(2022, 'Maravilhas', 11, 'MG'),
(2023, 'Maria da Fé', 11, 'MG'),
(2024, 'Mariana', 11, 'MG'),
(2025, 'Marilac', 11, 'MG'),
(2026, 'Mário Campos', 11, 'MG'),
(2027, 'Maripá de Minas', 11, 'MG'),
(2028, 'Marliéria', 11, 'MG'),
(2029, 'Marmelópolis', 11, 'MG'),
(2030, 'Martinho Campos', 11, 'MG'),
(2031, 'Martins Soares', 11, 'MG'),
(2032, 'Mata Verde', 11, 'MG'),
(2033, 'Materlândia', 11, 'MG'),
(2034, 'Mateus Leme', 11, 'MG'),
(2035, 'Mathias Lobato', 11, 'MG'),
(2036, 'Matias Barbosa', 11, 'MG'),
(2037, 'Matias Cardoso', 11, 'MG'),
(2038, 'Matipó', 11, 'MG'),
(2039, 'Mato Verde', 11, 'MG'),
(2040, 'Matozinhos', 11, 'MG'),
(2041, 'Matutina', 11, 'MG'),
(2042, 'Medeiros', 11, 'MG'),
(2043, 'Medina', 11, 'MG'),
(2044, 'Mendes Pimentel', 11, 'MG'),
(2045, 'Mercês', 11, 'MG'),
(2046, 'Mesquita', 11, 'MG'),
(2047, 'Minas Novas', 11, 'MG'),
(2048, 'Minduri', 11, 'MG'),
(2049, 'Mirabela', 11, 'MG'),
(2050, 'Miradouro', 11, 'MG'),
(2051, 'Miraí', 11, 'MG'),
(2052, 'Miravânia', 11, 'MG'),
(2053, 'Moeda', 11, 'MG'),
(2054, 'Moema', 11, 'MG'),
(2055, 'Monjolos', 11, 'MG'),
(2056, 'Monsenhor Paulo', 11, 'MG'),
(2057, 'Montalvânia', 11, 'MG'),
(2058, 'Monte Alegre de Minas', 11, 'MG'),
(2059, 'Monte Azul', 11, 'MG'),
(2060, 'Monte Belo', 11, 'MG'),
(2061, 'Monte Carmelo', 11, 'MG'),
(2062, 'Monte Formoso', 11, 'MG'),
(2063, 'Monte Santo de Minas', 11, 'MG'),
(2064, 'Monte Sião', 11, 'MG'),
(2065, 'Montes Claros', 11, 'MG'),
(2066, 'Montezuma', 11, 'MG'),
(2067, 'Morada Nova de Minas', 11, 'MG'),
(2068, 'Morro da Garça', 11, 'MG'),
(2069, 'Morro do Pilar', 11, 'MG'),
(2070, 'Munhoz', 11, 'MG'),
(2071, 'Muriaé', 11, 'MG'),
(2072, 'Mutum', 11, 'MG'),
(2073, 'Muzambinho', 11, 'MG'),
(2074, 'Nacip Raydan', 11, 'MG'),
(2075, 'Nanuque', 11, 'MG'),
(2076, 'Naque', 11, 'MG'),
(2077, 'Natalândia', 11, 'MG'),
(2078, 'Natércia', 11, 'MG'),
(2079, 'Nazareno', 11, 'MG'),
(2080, 'Nepomuceno', 11, 'MG'),
(2081, 'Ninheira', 11, 'MG'),
(2082, 'Nova Belém', 11, 'MG'),
(2083, 'Nova Era', 11, 'MG'),
(2084, 'Nova Lima', 11, 'MG'),
(2085, 'Nova Módica', 11, 'MG'),
(2086, 'Nova Ponte', 11, 'MG'),
(2087, 'Nova Porteirinha', 11, 'MG'),
(2088, 'Nova Resende', 11, 'MG'),
(2089, 'Nova Serrana', 11, 'MG'),
(2090, 'Nova União', 11, 'MG'),
(2091, 'Novo Cruzeiro', 11, 'MG'),
(2092, 'Novo Oriente de Minas', 11, 'MG'),
(2093, 'Novorizonte', 11, 'MG'),
(2094, 'Olaria', 11, 'MG'),
(2095, 'Olhos-d`Água', 11, 'MG'),
(2096, 'Olímpio Noronha', 11, 'MG'),
(2097, 'Oliveira', 11, 'MG'),
(2098, 'Oliveira Fortes', 11, 'MG'),
(2099, 'Onça de Pitangui', 11, 'MG'),
(2100, 'Oratórios', 11, 'MG'),
(2101, 'Orizânia', 11, 'MG'),
(2102, 'Ouro Branco', 11, 'MG'),
(2103, 'Ouro Fino', 11, 'MG'),
(2104, 'Ouro Preto', 11, 'MG'),
(2105, 'Ouro Verde de Minas', 11, 'MG'),
(2106, 'Padre Carvalho', 11, 'MG'),
(2107, 'Padre Paraíso', 11, 'MG'),
(2108, 'Pai Pedro', 11, 'MG'),
(2109, 'Paineiras', 11, 'MG'),
(2110, 'Pains', 11, 'MG'),
(2111, 'Paiva', 11, 'MG'),
(2112, 'Palma', 11, 'MG'),
(2113, 'Palmópolis', 11, 'MG'),
(2114, 'Papagaios', 11, 'MG'),
(2115, 'Pará de Minas', 11, 'MG'),
(2116, 'Paracatu', 11, 'MG'),
(2117, 'Paraguaçu', 11, 'MG'),
(2118, 'Paraisópolis', 11, 'MG'),
(2119, 'Paraopeba', 11, 'MG'),
(2120, 'Passa Quatro', 11, 'MG'),
(2121, 'Passa Tempo', 11, 'MG'),
(2122, 'Passabém', 11, 'MG'),
(2123, 'Passa-Vinte', 11, 'MG'),
(2124, 'Passos', 11, 'MG'),
(2125, 'Patis', 11, 'MG'),
(2126, 'Patos de Minas', 11, 'MG'),
(2127, 'Patrocínio', 11, 'MG'),
(2128, 'Patrocínio do Muriaé', 11, 'MG'),
(2129, 'Paula Cândido', 11, 'MG'),
(2130, 'Paulistas', 11, 'MG'),
(2131, 'Pavão', 11, 'MG'),
(2132, 'Peçanha', 11, 'MG'),
(2133, 'Pedra Azul', 11, 'MG'),
(2134, 'Pedra Bonita', 11, 'MG'),
(2135, 'Pedra do Anta', 11, 'MG'),
(2136, 'Pedra do Indaiá', 11, 'MG'),
(2137, 'Pedra Dourada', 11, 'MG'),
(2138, 'Pedralva', 11, 'MG'),
(2139, 'Pedras de Maria da Cruz', 11, 'MG'),
(2140, 'Pedrinópolis', 11, 'MG'),
(2141, 'Pedro Leopoldo', 11, 'MG'),
(2142, 'Pedro Teixeira', 11, 'MG'),
(2143, 'Pequeri', 11, 'MG'),
(2144, 'Pequi', 11, 'MG'),
(2145, 'Perdigão', 11, 'MG'),
(2146, 'Perdizes', 11, 'MG'),
(2147, 'Perdões', 11, 'MG'),
(2148, 'Periquito', 11, 'MG'),
(2149, 'Pescador', 11, 'MG'),
(2150, 'Piau', 11, 'MG'),
(2151, 'Piedade de Caratinga', 11, 'MG'),
(2152, 'Piedade de Ponte Nova', 11, 'MG'),
(2153, 'Piedade do Rio Grande', 11, 'MG'),
(2154, 'Piedade dos Gerais', 11, 'MG'),
(2155, 'Pimenta', 11, 'MG'),
(2156, 'Pingo-d`Água', 11, 'MG'),
(2157, 'Pintópolis', 11, 'MG'),
(2158, 'Piracema', 11, 'MG'),
(2159, 'Pirajuba', 11, 'MG'),
(2160, 'Piranga', 11, 'MG'),
(2161, 'Piranguçu', 11, 'MG'),
(2162, 'Piranguinho', 11, 'MG'),
(2163, 'Pirapetinga', 11, 'MG'),
(2164, 'Pirapora', 11, 'MG'),
(2165, 'Piraúba', 11, 'MG'),
(2166, 'Pitangui', 11, 'MG'),
(2167, 'Piumhi', 11, 'MG'),
(2168, 'Planura', 11, 'MG'),
(2169, 'Poço Fundo', 11, 'MG'),
(2170, 'Poços de Caldas', 11, 'MG'),
(2171, 'Pocrane', 11, 'MG'),
(2172, 'Pompéu', 11, 'MG'),
(2173, 'Ponte Nova', 11, 'MG'),
(2174, 'Ponto Chique', 11, 'MG'),
(2175, 'Ponto dos Volantes', 11, 'MG'),
(2176, 'Porteirinha', 11, 'MG'),
(2177, 'Porto Firme', 11, 'MG'),
(2178, 'Poté', 11, 'MG'),
(2179, 'Pouso Alegre', 11, 'MG'),
(2180, 'Pouso Alto', 11, 'MG'),
(2181, 'Prados', 11, 'MG'),
(2182, 'Prata', 11, 'MG'),
(2183, 'Pratápolis', 11, 'MG'),
(2184, 'Pratinha', 11, 'MG'),
(2185, 'Presidente Bernardes', 11, 'MG'),
(2186, 'Presidente Juscelino', 11, 'MG'),
(2187, 'Presidente Kubitschek', 11, 'MG'),
(2188, 'Presidente Olegário', 11, 'MG'),
(2189, 'Prudente de Morais', 11, 'MG'),
(2190, 'Quartel Geral', 11, 'MG'),
(2191, 'Queluzito', 11, 'MG'),
(2192, 'Raposos', 11, 'MG'),
(2193, 'Raul Soares', 11, 'MG'),
(2194, 'Recreio', 11, 'MG'),
(2195, 'Reduto', 11, 'MG'),
(2196, 'Resende Costa', 11, 'MG'),
(2197, 'Resplendor', 11, 'MG'),
(2198, 'Ressaquinha', 11, 'MG'),
(2199, 'Riachinho', 11, 'MG'),
(2200, 'Riacho dos Machados', 11, 'MG'),
(2201, 'Ribeirão das Neves', 11, 'MG'),
(2202, 'Ribeirão Vermelho', 11, 'MG'),
(2203, 'Rio Acima', 11, 'MG'),
(2204, 'Rio Casca', 11, 'MG'),
(2205, 'Rio do Prado', 11, 'MG'),
(2206, 'Rio Doce', 11, 'MG'),
(2207, 'Rio Espera', 11, 'MG'),
(2208, 'Rio Manso', 11, 'MG'),
(2209, 'Rio Novo', 11, 'MG'),
(2210, 'Rio Paranaíba', 11, 'MG'),
(2211, 'Rio Pardo de Minas', 11, 'MG'),
(2212, 'Rio Piracicaba', 11, 'MG'),
(2213, 'Rio Pomba', 11, 'MG'),
(2214, 'Rio Preto', 11, 'MG'),
(2215, 'Rio Vermelho', 11, 'MG'),
(2216, 'Ritápolis', 11, 'MG'),
(2217, 'Rochedo de Minas', 11, 'MG'),
(2218, 'Rodeiro', 11, 'MG'),
(2219, 'Romaria', 11, 'MG'),
(2220, 'Rosário da Limeira', 11, 'MG'),
(2221, 'Rubelita', 11, 'MG'),
(2222, 'Rubim', 11, 'MG'),
(2223, 'Sabará', 11, 'MG'),
(2224, 'Sabinópolis', 11, 'MG'),
(2225, 'Sacramento', 11, 'MG'),
(2226, 'Salinas', 11, 'MG'),
(2227, 'Salto da Divisa', 11, 'MG'),
(2228, 'Santa Bárbara', 11, 'MG'),
(2229, 'Santa Bárbara do Leste', 11, 'MG'),
(2230, 'Santa Bárbara do Monte Verde', 11, 'MG'),
(2231, 'Santa Bárbara do Tugúrio', 11, 'MG'),
(2232, 'Santa Cruz de Minas', 11, 'MG'),
(2233, 'Santa Cruz de Salinas', 11, 'MG'),
(2234, 'Santa Cruz do Escalvado', 11, 'MG'),
(2235, 'Santa Efigênia de Minas', 11, 'MG'),
(2236, 'Santa Fé de Minas', 11, 'MG'),
(2237, 'Santa Helena de Minas', 11, 'MG'),
(2238, 'Santa Juliana', 11, 'MG'),
(2239, 'Santa Luzia', 11, 'MG'),
(2240, 'Santa Margarida', 11, 'MG'),
(2241, 'Santa Maria de Itabira', 11, 'MG'),
(2242, 'Santa Maria do Salto', 11, 'MG'),
(2243, 'Santa Maria do Suaçuí', 11, 'MG'),
(2244, 'Santa Rita de Caldas', 11, 'MG'),
(2245, 'Santa Rita de Ibitipoca', 11, 'MG'),
(2246, 'Santa Rita de Jacutinga', 11, 'MG'),
(2247, 'Santa Rita de Minas', 11, 'MG'),
(2248, 'Santa Rita do Itueto', 11, 'MG'),
(2249, 'Santa Rita do Sapucaí', 11, 'MG'),
(2250, 'Santa Rosa da Serra', 11, 'MG'),
(2251, 'Santa Vitória', 11, 'MG'),
(2252, 'Santana da Vargem', 11, 'MG'),
(2253, 'Santana de Cataguases', 11, 'MG'),
(2254, 'Santana de Pirapama', 11, 'MG'),
(2255, 'Santana do Deserto', 11, 'MG'),
(2256, 'Santana do Garambéu', 11, 'MG'),
(2257, 'Santana do Jacaré', 11, 'MG'),
(2258, 'Santana do Manhuaçu', 11, 'MG'),
(2259, 'Santana do Paraíso', 11, 'MG'),
(2260, 'Santana do Riacho', 11, 'MG'),
(2261, 'Santana dos Montes', 11, 'MG'),
(2262, 'Santo Antônio do Amparo', 11, 'MG'),
(2263, 'Santo Antônio do Aventureiro', 11, 'MG'),
(2264, 'Santo Antônio do Grama', 11, 'MG'),
(2265, 'Santo Antônio do Itambé', 11, 'MG'),
(2266, 'Santo Antônio do Jacinto', 11, 'MG'),
(2267, 'Santo Antônio do Monte', 11, 'MG'),
(2268, 'Santo Antônio do Retiro', 11, 'MG'),
(2269, 'Santo Antônio do Rio Abaixo', 11, 'MG'),
(2270, 'Santo Hipólito', 11, 'MG'),
(2271, 'Santos Dumont', 11, 'MG'),
(2272, 'São Bento Abade', 11, 'MG'),
(2273, 'São Brás do Suaçuí', 11, 'MG'),
(2274, 'São Domingos das Dores', 11, 'MG'),
(2275, 'São Domingos do Prata', 11, 'MG'),
(2276, 'São Félix de Minas', 11, 'MG'),
(2277, 'São Francisco', 11, 'MG'),
(2278, 'São Francisco de Paula', 11, 'MG'),
(2279, 'São Francisco de Sales', 11, 'MG'),
(2280, 'São Francisco do Glória', 11, 'MG'),
(2281, 'São Geraldo', 11, 'MG'),
(2282, 'São Geraldo da Piedade', 11, 'MG'),
(2283, 'São Geraldo do Baixio', 11, 'MG'),
(2284, 'São Gonçalo do Abaeté', 11, 'MG'),
(2285, 'São Gonçalo do Pará', 11, 'MG'),
(2286, 'São Gonçalo do Rio Abaixo', 11, 'MG'),
(2287, 'São Gonçalo do Rio Preto', 11, 'MG'),
(2288, 'São Gonçalo do Sapucaí', 11, 'MG'),
(2289, 'São Gotardo', 11, 'MG'),
(2290, 'São João Batista do Glória', 11, 'MG'),
(2291, 'São João da Lagoa', 11, 'MG'),
(2292, 'São João da Mata', 11, 'MG'),
(2293, 'São João da Ponte', 11, 'MG'),
(2294, 'São João das Missões', 11, 'MG'),
(2295, 'São João del Rei', 11, 'MG'),
(2296, 'São João do Manhuaçu', 11, 'MG'),
(2297, 'São João do Manteninha', 11, 'MG'),
(2298, 'São João do Oriente', 11, 'MG'),
(2299, 'São João do Pacuí', 11, 'MG'),
(2300, 'São João do Paraíso', 11, 'MG'),
(2301, 'São João Evangelista', 11, 'MG'),
(2302, 'São João Nepomuceno', 11, 'MG'),
(2303, 'São Joaquim de Bicas', 11, 'MG'),
(2304, 'São José da Barra', 11, 'MG'),
(2305, 'São José da Lapa', 11, 'MG'),
(2306, 'São José da Safira', 11, 'MG'),
(2307, 'São José da Varginha', 11, 'MG'),
(2308, 'São José do Alegre', 11, 'MG'),
(2309, 'São José do Divino', 11, 'MG'),
(2310, 'São José do Goiabal', 11, 'MG'),
(2311, 'São José do Jacuri', 11, 'MG'),
(2312, 'São José do Mantimento', 11, 'MG'),
(2313, 'São Lourenço', 11, 'MG'),
(2314, 'São Miguel do Anta', 11, 'MG'),
(2315, 'São Pedro da União', 11, 'MG'),
(2316, 'São Pedro do Suaçuí', 11, 'MG'),
(2317, 'São Pedro dos Ferros', 11, 'MG'),
(2318, 'São Romão', 11, 'MG'),
(2319, 'São Roque de Minas', 11, 'MG'),
(2320, 'São Sebastião da Bela Vista', 11, 'MG'),
(2321, 'São Sebastião da Vargem Alegre', 11, 'MG'),
(2322, 'São Sebastião do Anta', 11, 'MG'),
(2323, 'São Sebastião do Maranhão', 11, 'MG'),
(2324, 'São Sebastião do Oeste', 11, 'MG'),
(2325, 'São Sebastião do Paraíso', 11, 'MG'),
(2326, 'São Sebastião do Rio Preto', 11, 'MG'),
(2327, 'São Sebastião do Rio Verde', 11, 'MG'),
(2328, 'São Thomé das Letras', 11, 'MG'),
(2329, 'São Tiago', 11, 'MG'),
(2330, 'São Tomás de Aquino', 11, 'MG'),
(2331, 'São Vicente de Minas', 11, 'MG'),
(2332, 'Sapucaí-Mirim', 11, 'MG'),
(2333, 'Sardoá', 11, 'MG'),
(2334, 'Sarzedo', 11, 'MG'),
(2335, 'Sem-Peixe', 11, 'MG'),
(2336, 'Senador Amaral', 11, 'MG'),
(2337, 'Senador Cortes', 11, 'MG'),
(2338, 'Senador Firmino', 11, 'MG'),
(2339, 'Senador José Bento', 11, 'MG'),
(2340, 'Senador Modestino Gonçalves', 11, 'MG'),
(2341, 'Senhora de Oliveira', 11, 'MG'),
(2342, 'Senhora do Porto', 11, 'MG'),
(2343, 'Senhora dos Remédios', 11, 'MG'),
(2344, 'Sericita', 11, 'MG'),
(2345, 'Seritinga', 11, 'MG'),
(2346, 'Serra Azul de Minas', 11, 'MG'),
(2347, 'Serra da Saudade', 11, 'MG'),
(2348, 'Serra do Salitre', 11, 'MG'),
(2349, 'Serra dos Aimorés', 11, 'MG'),
(2350, 'Serrania', 11, 'MG'),
(2351, 'Serranópolis de Minas', 11, 'MG'),
(2352, 'Serranos', 11, 'MG'),
(2353, 'Serro', 11, 'MG'),
(2354, 'Sete Lagoas', 11, 'MG'),
(2355, 'Setubinha', 11, 'MG'),
(2356, 'Silveirânia', 11, 'MG'),
(2357, 'Silvianópolis', 11, 'MG'),
(2358, 'Simão Pereira', 11, 'MG'),
(2359, 'Simonésia', 11, 'MG'),
(2360, 'Sobrália', 11, 'MG'),
(2361, 'Soledade de Minas', 11, 'MG'),
(2362, 'Tabuleiro', 11, 'MG'),
(2363, 'Taiobeiras', 11, 'MG'),
(2364, 'Taparuba', 11, 'MG'),
(2365, 'Tapira', 11, 'MG'),
(2366, 'Tapiraí', 11, 'MG'),
(2367, 'Taquaraçu de Minas', 11, 'MG'),
(2368, 'Tarumirim', 11, 'MG'),
(2369, 'Teixeiras', 11, 'MG'),
(2370, 'Teófilo Otoni', 11, 'MG'),
(2371, 'Timóteo', 11, 'MG'),
(2372, 'Tiradentes', 11, 'MG'),
(2373, 'Tiros', 11, 'MG'),
(2374, 'Tocantins', 11, 'MG'),
(2375, 'Tocos do Moji', 11, 'MG'),
(2376, 'Toledo', 11, 'MG'),
(2377, 'Tombos', 11, 'MG'),
(2378, 'Três Corações', 11, 'MG'),
(2379, 'Três Marias', 11, 'MG'),
(2380, 'Três Pontas', 11, 'MG'),
(2381, 'Tumiritinga', 11, 'MG'),
(2382, 'Tupaciguara', 11, 'MG'),
(2383, 'Turmalina', 11, 'MG'),
(2384, 'Turvolândia', 11, 'MG'),
(2385, 'Ubá', 11, 'MG'),
(2386, 'Ubaí', 11, 'MG'),
(2387, 'Ubaporanga', 11, 'MG'),
(2388, 'Uberaba', 11, 'MG'),
(2389, 'Uberlândia', 11, 'MG'),
(2390, 'Umburatiba', 11, 'MG'),
(2391, 'Unaí', 11, 'MG'),
(2392, 'União de Minas', 11, 'MG'),
(2393, 'Uruana de Minas', 11, 'MG'),
(2394, 'Urucânia', 11, 'MG'),
(2395, 'Urucuia', 11, 'MG'),
(2396, 'Vargem Alegre', 11, 'MG'),
(2397, 'Vargem Bonita', 11, 'MG'),
(2398, 'Vargem Grande do Rio Pardo', 11, 'MG'),
(2399, 'Varginha', 11, 'MG'),
(2400, 'Varjão de Minas', 11, 'MG'),
(2401, 'Várzea da Palma', 11, 'MG'),
(2402, 'Varzelândia', 11, 'MG'),
(2403, 'Vazante', 11, 'MG'),
(2404, 'Verdelândia', 11, 'MG'),
(2405, 'Veredinha', 11, 'MG'),
(2406, 'Veríssimo', 11, 'MG'),
(2407, 'Vermelho Novo', 11, 'MG'),
(2408, 'Vespasiano', 11, 'MG'),
(2409, 'Viçosa', 11, 'MG'),
(2410, 'Vieiras', 11, 'MG'),
(2411, 'Virgem da Lapa', 11, 'MG'),
(2412, 'Virgínia', 11, 'MG'),
(2413, 'Virginópolis', 11, 'MG'),
(2414, 'Virgolândia', 11, 'MG'),
(2415, 'Visconde do Rio Branco', 11, 'MG'),
(2416, 'Volta Grande', 11, 'MG'),
(2417, 'Wenceslau Braz', 11, 'MG'),
(2418, 'Abaetetuba', 14, 'PA'),
(2419, 'Abel Figueiredo', 14, 'PA'),
(2420, 'Acará', 14, 'PA'),
(2421, 'Afuá', 14, 'PA'),
(2422, 'Água Azul do Norte', 14, 'PA'),
(2423, 'Alenquer', 14, 'PA'),
(2424, 'Almeirim', 14, 'PA'),
(2425, 'Altamira', 14, 'PA'),
(2426, 'Anajás', 14, 'PA'),
(2427, 'Ananindeua', 14, 'PA'),
(2428, 'Anapu', 14, 'PA'),
(2429, 'Augusto Corrêa', 14, 'PA'),
(2430, 'Aurora do Pará', 14, 'PA'),
(2431, 'Aveiro', 14, 'PA'),
(2432, 'Bagre', 14, 'PA'),
(2433, 'Baião', 14, 'PA'),
(2434, 'Bannach', 14, 'PA'),
(2435, 'Barcarena', 14, 'PA'),
(2436, 'Belém', 14, 'PA'),
(2437, 'Belterra', 14, 'PA'),
(2438, 'Benevides', 14, 'PA'),
(2439, 'Bom Jesus do Tocantins', 14, 'PA'),
(2440, 'Bonito', 14, 'PA'),
(2441, 'Bragança', 14, 'PA'),
(2442, 'Brasil Novo', 14, 'PA'),
(2443, 'Brejo Grande do Araguaia', 14, 'PA'),
(2444, 'Breu Branco', 14, 'PA'),
(2445, 'Breves', 14, 'PA'),
(2446, 'Bujaru', 14, 'PA'),
(2447, 'Cachoeira do Arari', 14, 'PA'),
(2448, 'Cachoeira do Piriá', 14, 'PA'),
(2449, 'Cametá', 14, 'PA'),
(2450, 'Canaã dos Carajás', 14, 'PA'),
(2451, 'Capanema', 14, 'PA'),
(2452, 'Capitão Poço', 14, 'PA'),
(2453, 'Castanhal', 14, 'PA'),
(2454, 'Chaves', 14, 'PA'),
(2455, 'Colares', 14, 'PA'),
(2456, 'Conceição do Araguaia', 14, 'PA'),
(2457, 'Concórdia do Pará', 14, 'PA'),
(2458, 'Cumaru do Norte', 14, 'PA'),
(2459, 'Curionópolis', 14, 'PA'),
(2460, 'Curralinho', 14, 'PA'),
(2461, 'Curuá', 14, 'PA'),
(2462, 'Curuçá', 14, 'PA'),
(2463, 'Dom Eliseu', 14, 'PA'),
(2464, 'Eldorado dos Carajás', 14, 'PA'),
(2465, 'Faro', 14, 'PA'),
(2466, 'Floresta do Araguaia', 14, 'PA'),
(2467, 'Garrafão do Norte', 14, 'PA'),
(2468, 'Goianésia do Pará', 14, 'PA'),
(2469, 'Gurupá', 14, 'PA'),
(2470, 'Igarapé-Açu', 14, 'PA'),
(2471, 'Igarapé-Miri', 14, 'PA'),
(2472, 'Inhangapi', 14, 'PA'),
(2473, 'Ipixuna do Pará', 14, 'PA'),
(2474, 'Irituia', 14, 'PA'),
(2475, 'Itaituba', 14, 'PA'),
(2476, 'Itupiranga', 14, 'PA'),
(2477, 'Jacareacanga', 14, 'PA'),
(2478, 'Jacundá', 14, 'PA'),
(2479, 'Juruti', 14, 'PA'),
(2480, 'Limoeiro do Ajuru', 14, 'PA'),
(2481, 'Mãe do Rio', 14, 'PA'),
(2482, 'Magalhães Barata', 14, 'PA'),
(2483, 'Marabá', 14, 'PA'),
(2484, 'Maracanã', 14, 'PA'),
(2485, 'Marapanim', 14, 'PA'),
(2486, 'Marituba', 14, 'PA'),
(2487, 'Medicilândia', 14, 'PA'),
(2488, 'Melgaço', 14, 'PA'),
(2489, 'Mocajuba', 14, 'PA'),
(2490, 'Moju', 14, 'PA'),
(2491, 'Monte Alegre', 14, 'PA'),
(2492, 'Muaná', 14, 'PA'),
(2493, 'Nova Esperança do Piriá', 14, 'PA'),
(2494, 'Nova Ipixuna', 14, 'PA'),
(2495, 'Nova Timboteua', 14, 'PA'),
(2496, 'Novo Progresso', 14, 'PA'),
(2497, 'Novo Repartimento', 14, 'PA'),
(2498, 'Óbidos', 14, 'PA'),
(2499, 'Oeiras do Pará', 14, 'PA'),
(2500, 'Oriximiná', 14, 'PA'),
(2501, 'Ourém', 14, 'PA'),
(2502, 'Ourilândia do Norte', 14, 'PA'),
(2503, 'Pacajá', 14, 'PA'),
(2504, 'Palestina do Pará', 14, 'PA'),
(2505, 'Paragominas', 14, 'PA'),
(2506, 'Parauapebas', 14, 'PA'),
(2507, 'Pau d`Arco', 14, 'PA'),
(2508, 'Peixe-Boi', 14, 'PA'),
(2509, 'Piçarra', 14, 'PA'),
(2510, 'Placas', 14, 'PA'),
(2511, 'Ponta de Pedras', 14, 'PA'),
(2512, 'Portel', 14, 'PA'),
(2513, 'Porto de Moz', 14, 'PA'),
(2514, 'Prainha', 14, 'PA'),
(2515, 'Primavera', 14, 'PA'),
(2516, 'Quatipuru', 14, 'PA'),
(2517, 'Redenção', 14, 'PA'),
(2518, 'Rio Maria', 14, 'PA'),
(2519, 'Rondon do Pará', 14, 'PA'),
(2520, 'Rurópolis', 14, 'PA'),
(2521, 'Salinópolis', 14, 'PA'),
(2522, 'Salvaterra', 14, 'PA'),
(2523, 'Santa Bárbara do Pará', 14, 'PA'),
(2524, 'Santa Cruz do Arari', 14, 'PA'),
(2525, 'Santa Isabel do Pará', 14, 'PA'),
(2526, 'Santa Luzia do Pará', 14, 'PA'),
(2527, 'Santa Maria das Barreiras', 14, 'PA'),
(2528, 'Santa Maria do Pará', 14, 'PA'),
(2529, 'Santana do Araguaia', 14, 'PA'),
(2530, 'Santarém', 14, 'PA'),
(2531, 'Santarém Novo', 14, 'PA'),
(2532, 'Santo Antônio do Tauá', 14, 'PA'),
(2533, 'São Caetano de Odivelas', 14, 'PA'),
(2534, 'São Domingos do Araguaia', 14, 'PA'),
(2535, 'São Domingos do Capim', 14, 'PA'),
(2536, 'São Félix do Xingu', 14, 'PA'),
(2537, 'São Francisco do Pará', 14, 'PA'),
(2538, 'São Geraldo do Araguaia', 14, 'PA'),
(2539, 'São João da Ponta', 14, 'PA'),
(2540, 'São João de Pirabas', 14, 'PA'),
(2541, 'São João do Araguaia', 14, 'PA'),
(2542, 'São Miguel do Guamá', 14, 'PA'),
(2543, 'São Sebastião da Boa Vista', 14, 'PA'),
(2544, 'Sapucaia', 14, 'PA'),
(2545, 'Senador José Porfírio', 14, 'PA'),
(2546, 'Soure', 14, 'PA'),
(2547, 'Tailândia', 14, 'PA'),
(2548, 'Terra Alta', 14, 'PA'),
(2549, 'Terra Santa', 14, 'PA'),
(2550, 'Tomé-Açu', 14, 'PA'),
(2551, 'Tracuateua', 14, 'PA'),
(2552, 'Trairão', 14, 'PA'),
(2553, 'Tucumã', 14, 'PA'),
(2554, 'Tucuruí', 14, 'PA'),
(2555, 'Ulianópolis', 14, 'PA'),
(2556, 'Uruará', 14, 'PA'),
(2557, 'Vigia', 14, 'PA'),
(2558, 'Viseu', 14, 'PA'),
(2559, 'Vitória do Xingu', 14, 'PA'),
(2560, 'Xinguara', 14, 'PA'),
(2561, 'Água Branca', 15, 'PB'),
(2562, 'Aguiar', 15, 'PB'),
(2563, 'Alagoa Grande', 15, 'PB'),
(2564, 'Alagoa Nova', 15, 'PB'),
(2565, 'Alagoinha', 15, 'PB'),
(2566, 'Alcantil', 15, 'PB'),
(2567, 'Algodão de Jandaíra', 15, 'PB'),
(2568, 'Alhandra', 15, 'PB'),
(2569, 'Amparo', 15, 'PB'),
(2570, 'Aparecida', 15, 'PB'),
(2571, 'Araçagi', 15, 'PB'),
(2572, 'Arara', 15, 'PB'),
(2573, 'Araruna', 15, 'PB'),
(2574, 'Areia', 15, 'PB'),
(2575, 'Areia de Baraúnas', 15, 'PB'),
(2576, 'Areial', 15, 'PB'),
(2577, 'Aroeiras', 15, 'PB'),
(2578, 'Assunção', 15, 'PB'),
(2579, 'Baía da Traição', 15, 'PB'),
(2580, 'Bananeiras', 15, 'PB'),
(2581, 'Baraúna', 15, 'PB'),
(2582, 'Barra de Santa Rosa', 15, 'PB'),
(2583, 'Barra de Santana', 15, 'PB'),
(2584, 'Barra de São Miguel', 15, 'PB'),
(2585, 'Bayeux', 15, 'PB'),
(2586, 'Belém', 15, 'PB'),
(2587, 'Belém do Brejo do Cruz', 15, 'PB'),
(2588, 'Bernardino Batista', 15, 'PB'),
(2589, 'Boa Ventura', 15, 'PB'),
(2590, 'Boa Vista', 15, 'PB'),
(2591, 'Bom Jesus', 15, 'PB'),
(2592, 'Bom Sucesso', 15, 'PB'),
(2593, 'Bonito de Santa Fé', 15, 'PB'),
(2594, 'Boqueirão', 15, 'PB'),
(2595, 'Borborema', 15, 'PB'),
(2596, 'Brejo do Cruz', 15, 'PB'),
(2597, 'Brejo dos Santos', 15, 'PB'),
(2598, 'Caaporã', 15, 'PB'),
(2599, 'Cabaceiras', 15, 'PB'),
(2600, 'Cabedelo', 15, 'PB'),
(2601, 'Cachoeira dos Índios', 15, 'PB'),
(2602, 'Cacimba de Areia', 15, 'PB'),
(2603, 'Cacimba de Dentro', 15, 'PB'),
(2604, 'Cacimbas', 15, 'PB'),
(2605, 'Caiçara', 15, 'PB'),
(2606, 'Cajazeiras', 15, 'PB'),
(2607, 'Cajazeirinhas', 15, 'PB'),
(2608, 'Caldas Brandão', 15, 'PB'),
(2609, 'Camalaú', 15, 'PB'),
(2610, 'Campina Grande', 15, 'PB'),
(2611, 'Campo de Santana', 15, 'PB'),
(2612, 'Capim', 15, 'PB'),
(2613, 'Caraúbas', 15, 'PB'),
(2614, 'Carrapateira', 15, 'PB'),
(2615, 'Casserengue', 15, 'PB'),
(2616, 'Catingueira', 15, 'PB'),
(2617, 'Catolé do Rocha', 15, 'PB'),
(2618, 'Caturité', 15, 'PB'),
(2619, 'Conceição', 15, 'PB'),
(2620, 'Condado', 15, 'PB'),
(2621, 'Conde', 15, 'PB'),
(2622, 'Congo', 15, 'PB'),
(2623, 'Coremas', 15, 'PB'),
(2624, 'Coxixola', 15, 'PB'),
(2625, 'Cruz do Espírito Santo', 15, 'PB'),
(2626, 'Cubati', 15, 'PB'),
(2627, 'Cuité', 15, 'PB'),
(2628, 'Cuité de Mamanguape', 15, 'PB'),
(2629, 'Cuitegi', 15, 'PB'),
(2630, 'Curral de Cima', 15, 'PB'),
(2631, 'Curral Velho', 15, 'PB'),
(2632, 'Damião', 15, 'PB'),
(2633, 'Desterro', 15, 'PB'),
(2634, 'Diamante', 15, 'PB'),
(2635, 'Dona Inês', 15, 'PB'),
(2636, 'Duas Estradas', 15, 'PB'),
(2637, 'Emas', 15, 'PB'),
(2638, 'Esperança', 15, 'PB'),
(2639, 'Fagundes', 15, 'PB'),
(2640, 'Frei Martinho', 15, 'PB'),
(2641, 'Gado Bravo', 15, 'PB'),
(2642, 'Guarabira', 15, 'PB'),
(2643, 'Gurinhém', 15, 'PB'),
(2644, 'Gurjão', 15, 'PB'),
(2645, 'Ibiara', 15, 'PB'),
(2646, 'Igaracy', 15, 'PB'),
(2647, 'Imaculada', 15, 'PB'),
(2648, 'Ingá', 15, 'PB'),
(2649, 'Itabaiana', 15, 'PB'),
(2650, 'Itaporanga', 15, 'PB'),
(2651, 'Itapororoca', 15, 'PB'),
(2652, 'Itatuba', 15, 'PB'),
(2653, 'Jacaraú', 15, 'PB'),
(2654, 'Jericó', 15, 'PB'),
(2655, 'João Pessoa', 15, 'PB'),
(2656, 'Juarez Távora', 15, 'PB'),
(2657, 'Juazeirinho', 15, 'PB'),
(2658, 'Junco do Seridó', 15, 'PB'),
(2659, 'Juripiranga', 15, 'PB'),
(2660, 'Juru', 15, 'PB'),
(2661, 'Lagoa', 15, 'PB'),
(2662, 'Lagoa de Dentro', 15, 'PB'),
(2663, 'Lagoa Seca', 15, 'PB'),
(2664, 'Lastro', 15, 'PB'),
(2665, 'Livramento', 15, 'PB'),
(2666, 'Logradouro', 15, 'PB'),
(2667, 'Lucena', 15, 'PB'),
(2668, 'Mãe d`Água', 15, 'PB'),
(2669, 'Malta', 15, 'PB'),
(2670, 'Mamanguape', 15, 'PB'),
(2671, 'Manaíra', 15, 'PB'),
(2672, 'Marcação', 15, 'PB'),
(2673, 'Mari', 15, 'PB'),
(2674, 'Marizópolis', 15, 'PB'),
(2675, 'Massaranduba', 15, 'PB'),
(2676, 'Mataraca', 15, 'PB'),
(2677, 'Matinhas', 15, 'PB'),
(2678, 'Mato Grosso', 15, 'PB'),
(2679, 'Maturéia', 15, 'PB'),
(2680, 'Mogeiro', 15, 'PB'),
(2681, 'Montadas', 15, 'PB'),
(2682, 'Monte Horebe', 15, 'PB'),
(2683, 'Monteiro', 15, 'PB'),
(2684, 'Mulungu', 15, 'PB'),
(2685, 'Natuba', 15, 'PB'),
(2686, 'Nazarezinho', 15, 'PB'),
(2687, 'Nova Floresta', 15, 'PB'),
(2688, 'Nova Olinda', 15, 'PB'),
(2689, 'Nova Palmeira', 15, 'PB'),
(2690, 'Olho d`Água', 15, 'PB'),
(2691, 'Olivedos', 15, 'PB'),
(2692, 'Ouro Velho', 15, 'PB'),
(2693, 'Parari', 15, 'PB'),
(2694, 'Passagem', 15, 'PB'),
(2695, 'Patos', 15, 'PB'),
(2696, 'Paulista', 15, 'PB'),
(2697, 'Pedra Branca', 15, 'PB'),
(2698, 'Pedra Lavrada', 15, 'PB'),
(2699, 'Pedras de Fogo', 15, 'PB'),
(2700, 'Pedro Régis', 15, 'PB'),
(2701, 'Piancó', 15, 'PB'),
(2702, 'Picuí', 15, 'PB'),
(2703, 'Pilar', 15, 'PB'),
(2704, 'Pilões', 15, 'PB'),
(2705, 'Pilõezinhos', 15, 'PB'),
(2706, 'Pirpirituba', 15, 'PB'),
(2707, 'Pitimbu', 15, 'PB'),
(2708, 'Pocinhos', 15, 'PB'),
(2709, 'Poço Dantas', 15, 'PB'),
(2710, 'Poço de José de Moura', 15, 'PB'),
(2711, 'Pombal', 15, 'PB'),
(2712, 'Prata', 15, 'PB'),
(2713, 'Princesa Isabel', 15, 'PB'),
(2714, 'Puxinanã', 15, 'PB'),
(2715, 'Queimadas', 15, 'PB'),
(2716, 'Quixabá', 15, 'PB'),
(2717, 'Remígio', 15, 'PB'),
(2718, 'Riachão', 15, 'PB'),
(2719, 'Riachão do Bacamarte', 15, 'PB'),
(2720, 'Riachão do Poço', 15, 'PB'),
(2721, 'Riacho de Santo Antônio', 15, 'PB'),
(2722, 'Riacho dos Cavalos', 15, 'PB'),
(2723, 'Rio Tinto', 15, 'PB'),
(2724, 'Salgadinho', 15, 'PB'),
(2725, 'Salgado de São Félix', 15, 'PB'),
(2726, 'Santa Cecília', 15, 'PB'),
(2727, 'Santa Cruz', 15, 'PB'),
(2728, 'Santa Helena', 15, 'PB'),
(2729, 'Santa Inês', 15, 'PB'),
(2730, 'Santa Luzia', 15, 'PB'),
(2731, 'Santa Rita', 15, 'PB'),
(2732, 'Santa Teresinha', 15, 'PB'),
(2733, 'Santana de Mangueira', 15, 'PB'),
(2734, 'Santana dos Garrotes', 15, 'PB'),
(2735, 'Santarém', 15, 'PB'),
(2736, 'Santo André', 15, 'PB'),
(2737, 'São Bentinho', 15, 'PB'),
(2738, 'São Bento', 15, 'PB'),
(2739, 'São Domingos de Pombal', 15, 'PB'),
(2740, 'São Domingos do Cariri', 15, 'PB'),
(2741, 'São Francisco', 15, 'PB'),
(2742, 'São João do Cariri', 15, 'PB'),
(2743, 'São João do Rio do Peixe', 15, 'PB'),
(2744, 'São João do Tigre', 15, 'PB'),
(2745, 'São José da Lagoa Tapada', 15, 'PB'),
(2746, 'São José de Caiana', 15, 'PB'),
(2747, 'São José de Espinharas', 15, 'PB'),
(2748, 'São José de Piranhas', 15, 'PB'),
(2749, 'São José de Princesa', 15, 'PB'),
(2750, 'São José do Bonfim', 15, 'PB'),
(2751, 'São José do Brejo do Cruz', 15, 'PB'),
(2752, 'São José do Sabugi', 15, 'PB'),
(2753, 'São José dos Cordeiros', 15, 'PB'),
(2754, 'São José dos Ramos', 15, 'PB'),
(2755, 'São Mamede', 15, 'PB'),
(2756, 'São Miguel de Taipu', 15, 'PB'),
(2757, 'São Sebastião de Lagoa de Roça', 15, 'PB'),
(2758, 'São Sebastião do Umbuzeiro', 15, 'PB'),
(2759, 'Sapé', 15, 'PB'),
(2760, 'Seridó', 15, 'PB'),
(2761, 'Serra Branca', 15, 'PB'),
(2762, 'Serra da Raiz', 15, 'PB'),
(2763, 'Serra Grande', 15, 'PB'),
(2764, 'Serra Redonda', 15, 'PB'),
(2765, 'Serraria', 15, 'PB'),
(2766, 'Sertãozinho', 15, 'PB'),
(2767, 'Sobrado', 15, 'PB'),
(2768, 'Solânea', 15, 'PB'),
(2769, 'Soledade', 15, 'PB'),
(2770, 'Sossêgo', 15, 'PB'),
(2771, 'Sousa', 15, 'PB'),
(2772, 'Sumé', 15, 'PB'),
(2773, 'Taperoá', 15, 'PB'),
(2774, 'Tavares', 15, 'PB'),
(2775, 'Teixeira', 15, 'PB'),
(2776, 'Tenório', 15, 'PB'),
(2777, 'Triunfo', 15, 'PB'),
(2778, 'Uiraúna', 15, 'PB'),
(2779, 'Umbuzeiro', 15, 'PB'),
(2780, 'Várzea', 15, 'PB'),
(2781, 'Vieirópolis', 15, 'PB'),
(2782, 'Vista Serrana', 15, 'PB'),
(2783, 'Zabelê', 15, 'PB'),
(2784, 'Abatiá', 18, 'PR'),
(2785, 'Adrianópolis', 18, 'PR'),
(2786, 'Agudos do Sul', 18, 'PR'),
(2787, 'Almirante Tamandaré', 18, 'PR'),
(2788, 'Altamira do Paraná', 18, 'PR'),
(2789, 'Alto Paraíso', 18, 'PR'),
(2790, 'Alto Paraná', 18, 'PR'),
(2791, 'Alto Piquiri', 18, 'PR'),
(2792, 'Altônia', 18, 'PR'),
(2793, 'Alvorada do Sul', 18, 'PR'),
(2794, 'Amaporã', 18, 'PR'),
(2795, 'Ampére', 18, 'PR'),
(2796, 'Anahy', 18, 'PR'),
(2797, 'Andirá', 18, 'PR'),
(2798, 'Ângulo', 18, 'PR'),
(2799, 'Antonina', 18, 'PR'),
(2800, 'Antônio Olinto', 18, 'PR'),
(2801, 'Apucarana', 18, 'PR'),
(2802, 'Arapongas', 18, 'PR'),
(2803, 'Arapoti', 18, 'PR'),
(2804, 'Arapuã', 18, 'PR'),
(2805, 'Araruna', 18, 'PR'),
(2806, 'Araucária', 18, 'PR'),
(2807, 'Ariranha do Ivaí', 18, 'PR'),
(2808, 'Assaí', 18, 'PR'),
(2809, 'Assis Chateaubriand', 18, 'PR'),
(2810, 'Astorga', 18, 'PR'),
(2811, 'Atalaia', 18, 'PR'),
(2812, 'Balsa Nova', 18, 'PR'),
(2813, 'Bandeirantes', 18, 'PR'),
(2814, 'Barbosa Ferraz', 18, 'PR'),
(2815, 'Barra do Jacaré', 18, 'PR'),
(2816, 'Barracão', 18, 'PR'),
(2817, 'Bela Vista da Caroba', 18, 'PR'),
(2818, 'Bela Vista do Paraíso', 18, 'PR'),
(2819, 'Bituruna', 18, 'PR'),
(2820, 'Boa Esperança', 18, 'PR'),
(2821, 'Boa Esperança do Iguaçu', 18, 'PR'),
(2822, 'Boa Ventura de São Roque', 18, 'PR'),
(2823, 'Boa Vista da Aparecida', 18, 'PR'),
(2824, 'Bocaiúva do Sul', 18, 'PR'),
(2825, 'Bom Jesus do Sul', 18, 'PR'),
(2826, 'Bom Sucesso', 18, 'PR'),
(2827, 'Bom Sucesso do Sul', 18, 'PR'),
(2828, 'Borrazópolis', 18, 'PR'),
(2829, 'Braganey', 18, 'PR'),
(2830, 'Brasilândia do Sul', 18, 'PR'),
(2831, 'Cafeara', 18, 'PR'),
(2832, 'Cafelândia', 18, 'PR'),
(2833, 'Cafezal do Sul', 18, 'PR'),
(2834, 'Califórnia', 18, 'PR'),
(2835, 'Cambará', 18, 'PR'),
(2836, 'Cambé', 18, 'PR'),
(2837, 'Cambira', 18, 'PR'),
(2838, 'Campina da Lagoa', 18, 'PR'),
(2839, 'Campina do Simão', 18, 'PR'),
(2840, 'Campina Grande do Sul', 18, 'PR'),
(2841, 'Campo Bonito', 18, 'PR'),
(2842, 'Campo do Tenente', 18, 'PR'),
(2843, 'Campo Largo', 18, 'PR'),
(2844, 'Campo Magro', 18, 'PR'),
(2845, 'Campo Mourão', 18, 'PR'),
(2846, 'Cândido de Abreu', 18, 'PR'),
(2847, 'Candói', 18, 'PR'),
(2848, 'Cantagalo', 18, 'PR'),
(2849, 'Capanema', 18, 'PR'),
(2850, 'Capitão Leônidas Marques', 18, 'PR'),
(2851, 'Carambeí', 18, 'PR'),
(2852, 'Carlópolis', 18, 'PR'),
(2853, 'Cascavel', 18, 'PR'),
(2854, 'Castro', 18, 'PR'),
(2855, 'Catanduvas', 18, 'PR'),
(2856, 'Centenário do Sul', 18, 'PR'),
(2857, 'Cerro Azul', 18, 'PR'),
(2858, 'Céu Azul', 18, 'PR'),
(2859, 'Chopinzinho', 18, 'PR'),
(2860, 'Cianorte', 18, 'PR'),
(2861, 'Cidade Gaúcha', 18, 'PR'),
(2862, 'Clevelândia', 18, 'PR'),
(2863, 'Colombo', 18, 'PR'),
(2864, 'Colorado', 18, 'PR'),
(2865, 'Congonhinhas', 18, 'PR'),
(2866, 'Conselheiro Mairinck', 18, 'PR'),
(2867, 'Contenda', 18, 'PR'),
(2868, 'Corbélia', 18, 'PR'),
(2869, 'Cornélio Procópio', 18, 'PR'),
(2870, 'Coronel Domingos Soares', 18, 'PR'),
(2871, 'Coronel Vivida', 18, 'PR'),
(2872, 'Corumbataí do Sul', 18, 'PR'),
(2873, 'Cruz Machado', 18, 'PR'),
(2874, 'Cruzeiro do Iguaçu', 18, 'PR'),
(2875, 'Cruzeiro do Oeste', 18, 'PR'),
(2876, 'Cruzeiro do Sul', 18, 'PR'),
(2877, 'Cruzmaltina', 18, 'PR'),
(2878, 'Curitiba', 18, 'PR'),
(2879, 'Curiúva', 18, 'PR'),
(2880, 'Diamante d`Oeste', 18, 'PR'),
(2881, 'Diamante do Norte', 18, 'PR'),
(2882, 'Diamante do Sul', 18, 'PR'),
(2883, 'Dois Vizinhos', 18, 'PR'),
(2884, 'Douradina', 18, 'PR'),
(2885, 'Doutor Camargo', 18, 'PR'),
(2886, 'Doutor Ulysses', 18, 'PR'),
(2887, 'Enéas Marques', 18, 'PR'),
(2888, 'Engenheiro Beltrão', 18, 'PR'),
(2889, 'Entre Rios do Oeste', 18, 'PR'),
(2890, 'Esperança Nova', 18, 'PR'),
(2891, 'Espigão Alto do Iguaçu', 18, 'PR'),
(2892, 'Farol', 18, 'PR'),
(2893, 'Faxinal', 18, 'PR'),
(2894, 'Fazenda Rio Grande', 18, 'PR'),
(2895, 'Fênix', 18, 'PR'),
(2896, 'Fernandes Pinheiro', 18, 'PR'),
(2897, 'Figueira', 18, 'PR'),
(2898, 'Flor da Serra do Sul', 18, 'PR'),
(2899, 'Floraí', 18, 'PR'),
(2900, 'Floresta', 18, 'PR'),
(2901, 'Florestópolis', 18, 'PR'),
(2902, 'Flórida', 18, 'PR'),
(2903, 'Formosa do Oeste', 18, 'PR'),
(2904, 'Foz do Iguaçu', 18, 'PR'),
(2905, 'Foz do Jordão', 18, 'PR'),
(2906, 'Francisco Alves', 18, 'PR'),
(2907, 'Francisco Beltrão', 18, 'PR'),
(2908, 'General Carneiro', 18, 'PR'),
(2909, 'Godoy Moreira', 18, 'PR'),
(2910, 'Goioerê', 18, 'PR'),
(2911, 'Goioxim', 18, 'PR'),
(2912, 'Grandes Rios', 18, 'PR'),
(2913, 'Guaíra', 18, 'PR'),
(2914, 'Guairaçá', 18, 'PR'),
(2915, 'Guamiranga', 18, 'PR'),
(2916, 'Guapirama', 18, 'PR'),
(2917, 'Guaporema', 18, 'PR'),
(2918, 'Guaraci', 18, 'PR'),
(2919, 'Guaraniaçu', 18, 'PR'),
(2920, 'Guarapuava', 18, 'PR'),
(2921, 'Guaraqueçaba', 18, 'PR'),
(2922, 'Guaratuba', 18, 'PR'),
(2923, 'Honório Serpa', 18, 'PR'),
(2924, 'Ibaiti', 18, 'PR'),
(2925, 'Ibema', 18, 'PR'),
(2926, 'Ibiporã', 18, 'PR'),
(2927, 'Icaraíma', 18, 'PR'),
(2928, 'Iguaraçu', 18, 'PR'),
(2929, 'Iguatu', 18, 'PR'),
(2930, 'Imbaú', 18, 'PR'),
(2931, 'Imbituva', 18, 'PR'),
(2932, 'Inácio Martins', 18, 'PR'),
(2933, 'Inajá', 18, 'PR'),
(2934, 'Indianópolis', 18, 'PR'),
(2935, 'Ipiranga', 18, 'PR'),
(2936, 'Iporã', 18, 'PR'),
(2937, 'Iracema do Oeste', 18, 'PR'),
(2938, 'Irati', 18, 'PR'),
(2939, 'Iretama', 18, 'PR'),
(2940, 'Itaguajé', 18, 'PR'),
(2941, 'Itaipulândia', 18, 'PR'),
(2942, 'Itambaracá', 18, 'PR'),
(2943, 'Itambé', 18, 'PR'),
(2944, 'Itapejara d`Oeste', 18, 'PR'),
(2945, 'Itaperuçu', 18, 'PR'),
(2946, 'Itaúna do Sul', 18, 'PR'),
(2947, 'Ivaí', 18, 'PR'),
(2948, 'Ivaiporã', 18, 'PR'),
(2949, 'Ivaté', 18, 'PR'),
(2950, 'Ivatuba', 18, 'PR'),
(2951, 'Jaboti', 18, 'PR'),
(2952, 'Jacarezinho', 18, 'PR'),
(2953, 'Jaguapitã', 18, 'PR'),
(2954, 'Jaguariaíva', 18, 'PR'),
(2955, 'Jandaia do Sul', 18, 'PR'),
(2956, 'Janiópolis', 18, 'PR'),
(2957, 'Japira', 18, 'PR'),
(2958, 'Japurá', 18, 'PR'),
(2959, 'Jardim Alegre', 18, 'PR'),
(2960, 'Jardim Olinda', 18, 'PR'),
(2961, 'Jataizinho', 18, 'PR'),
(2962, 'Jesuítas', 18, 'PR'),
(2963, 'Joaquim Távora', 18, 'PR'),
(2964, 'Jundiaí do Sul', 18, 'PR'),
(2965, 'Juranda', 18, 'PR'),
(2966, 'Jussara', 18, 'PR'),
(2967, 'Kaloré', 18, 'PR'),
(2968, 'Lapa', 18, 'PR'),
(2969, 'Laranjal', 18, 'PR'),
(2970, 'Laranjeiras do Sul', 18, 'PR'),
(2971, 'Leópolis', 18, 'PR'),
(2972, 'Lidianópolis', 18, 'PR'),
(2973, 'Lindoeste', 18, 'PR'),
(2974, 'Loanda', 18, 'PR'),
(2975, 'Lobato', 18, 'PR'),
(2976, 'Londrina', 18, 'PR'),
(2977, 'Luiziana', 18, 'PR'),
(2978, 'Lunardelli', 18, 'PR'),
(2979, 'Lupionópolis', 18, 'PR'),
(2980, 'Mallet', 18, 'PR'),
(2981, 'Mamborê', 18, 'PR'),
(2982, 'Mandaguaçu', 18, 'PR'),
(2983, 'Mandaguari', 18, 'PR'),
(2984, 'Mandirituba', 18, 'PR'),
(2985, 'Manfrinópolis', 18, 'PR'),
(2986, 'Mangueirinha', 18, 'PR'),
(2987, 'Manoel Ribas', 18, 'PR'),
(2988, 'Marechal Cândido Rondon', 18, 'PR'),
(2989, 'Maria Helena', 18, 'PR'),
(2990, 'Marialva', 18, 'PR'),
(2991, 'Marilândia do Sul', 18, 'PR'),
(2992, 'Marilena', 18, 'PR'),
(2993, 'Mariluz', 18, 'PR'),
(2994, 'Maringá', 18, 'PR'),
(2995, 'Mariópolis', 18, 'PR'),
(2996, 'Maripá', 18, 'PR'),
(2997, 'Marmeleiro', 18, 'PR'),
(2998, 'Marquinho', 18, 'PR'),
(2999, 'Marumbi', 18, 'PR'),
(3000, 'Matelândia', 18, 'PR'),
(3001, 'Matinhos', 18, 'PR'),
(3002, 'Mato Rico', 18, 'PR'),
(3003, 'Mauá da Serra', 18, 'PR'),
(3004, 'Medianeira', 18, 'PR'),
(3005, 'Mercedes', 18, 'PR'),
(3006, 'Mirador', 18, 'PR'),
(3007, 'Miraselva', 18, 'PR'),
(3008, 'Missal', 18, 'PR'),
(3009, 'Moreira Sales', 18, 'PR'),
(3010, 'Morretes', 18, 'PR'),
(3011, 'Munhoz de Melo', 18, 'PR'),
(3012, 'Nossa Senhora das Graças', 18, 'PR'),
(3013, 'Nova Aliança do Ivaí', 18, 'PR'),
(3014, 'Nova América da Colina', 18, 'PR'),
(3015, 'Nova Aurora', 18, 'PR'),
(3016, 'Nova Cantu', 18, 'PR'),
(3017, 'Nova Esperança', 18, 'PR'),
(3018, 'Nova Esperança do Sudoeste', 18, 'PR'),
(3019, 'Nova Fátima', 18, 'PR'),
(3020, 'Nova Laranjeiras', 18, 'PR'),
(3021, 'Nova Londrina', 18, 'PR'),
(3022, 'Nova Olímpia', 18, 'PR'),
(3023, 'Nova Prata do Iguaçu', 18, 'PR'),
(3024, 'Nova Santa Bárbara', 18, 'PR'),
(3025, 'Nova Santa Rosa', 18, 'PR'),
(3026, 'Nova Tebas', 18, 'PR'),
(3027, 'Novo Itacolomi', 18, 'PR'),
(3028, 'Ortigueira', 18, 'PR'),
(3029, 'Ourizona', 18, 'PR'),
(3030, 'Ouro Verde do Oeste', 18, 'PR'),
(3031, 'Paiçandu', 18, 'PR'),
(3032, 'Palmas', 18, 'PR'),
(3033, 'Palmeira', 18, 'PR'),
(3034, 'Palmital', 18, 'PR'),
(3035, 'Palotina', 18, 'PR'),
(3036, 'Paraíso do Norte', 18, 'PR'),
(3037, 'Paranacity', 18, 'PR'),
(3038, 'Paranaguá', 18, 'PR'),
(3039, 'Paranapoema', 18, 'PR'),
(3040, 'Paranavaí', 18, 'PR'),
(3041, 'Pato Bragado', 18, 'PR'),
(3042, 'Pato Branco', 18, 'PR'),
(3043, 'Paula Freitas', 18, 'PR'),
(3044, 'Paulo Frontin', 18, 'PR'),
(3045, 'Peabiru', 18, 'PR'),
(3046, 'Perobal', 18, 'PR'),
(3047, 'Pérola', 18, 'PR'),
(3048, 'Pérola d`Oeste', 18, 'PR'),
(3049, 'Piên', 18, 'PR'),
(3050, 'Pinhais', 18, 'PR'),
(3051, 'Pinhal de São Bento', 18, 'PR'),
(3052, 'Pinhalão', 18, 'PR'),
(3053, 'Pinhão', 18, 'PR'),
(3054, 'Piraí do Sul', 18, 'PR'),
(3055, 'Piraquara', 18, 'PR'),
(3056, 'Pitanga', 18, 'PR'),
(3057, 'Pitangueiras', 18, 'PR'),
(3058, 'Planaltina do Paraná', 18, 'PR'),
(3059, 'Planalto', 18, 'PR'),
(3060, 'Ponta Grossa', 18, 'PR'),
(3061, 'Pontal do Paraná', 18, 'PR'),
(3062, 'Porecatu', 18, 'PR'),
(3063, 'Porto Amazonas', 18, 'PR'),
(3064, 'Porto Barreiro', 18, 'PR'),
(3065, 'Porto Rico', 18, 'PR'),
(3066, 'Porto Vitória', 18, 'PR'),
(3067, 'Prado Ferreira', 18, 'PR'),
(3068, 'Pranchita', 18, 'PR'),
(3069, 'Presidente Castelo Branco', 18, 'PR'),
(3070, 'Primeiro de Maio', 18, 'PR'),
(3071, 'Prudentópolis', 18, 'PR'),
(3072, 'Quarto Centenário', 18, 'PR'),
(3073, 'Quatiguá', 18, 'PR'),
(3074, 'Quatro Barras', 18, 'PR'),
(3075, 'Quatro Pontes', 18, 'PR'),
(3076, 'Quedas do Iguaçu', 18, 'PR'),
(3077, 'Querência do Norte', 18, 'PR'),
(3078, 'Quinta do Sol', 18, 'PR'),
(3079, 'Quitandinha', 18, 'PR'),
(3080, 'Ramilândia', 18, 'PR'),
(3081, 'Rancho Alegre', 18, 'PR'),
(3082, 'Rancho Alegre d`Oeste', 18, 'PR'),
(3083, 'Realeza', 18, 'PR'),
(3084, 'Rebouças', 18, 'PR'),
(3085, 'Renascença', 18, 'PR'),
(3086, 'Reserva', 18, 'PR'),
(3087, 'Reserva do Iguaçu', 18, 'PR'),
(3088, 'Ribeirão Claro', 18, 'PR'),
(3089, 'Ribeirão do Pinhal', 18, 'PR'),
(3090, 'Rio Azul', 18, 'PR'),
(3091, 'Rio Bom', 18, 'PR'),
(3092, 'Rio Bonito do Iguaçu', 18, 'PR'),
(3093, 'Rio Branco do Ivaí', 18, 'PR'),
(3094, 'Rio Branco do Sul', 18, 'PR'),
(3095, 'Rio Negro', 18, 'PR'),
(3096, 'Rolândia', 18, 'PR'),
(3097, 'Roncador', 18, 'PR'),
(3098, 'Rondon', 18, 'PR'),
(3099, 'Rosário do Ivaí', 18, 'PR'),
(3100, 'Sabáudia', 18, 'PR'),
(3101, 'Salgado Filho', 18, 'PR'),
(3102, 'Salto do Itararé', 18, 'PR'),
(3103, 'Salto do Lontra', 18, 'PR'),
(3104, 'Santa Amélia', 18, 'PR'),
(3105, 'Santa Cecília do Pavão', 18, 'PR'),
(3106, 'Santa Cruz de Monte Castelo', 18, 'PR'),
(3107, 'Santa Fé', 18, 'PR'),
(3108, 'Santa Helena', 18, 'PR'),
(3109, 'Santa Inês', 18, 'PR'),
(3110, 'Santa Isabel do Ivaí', 18, 'PR'),
(3111, 'Santa Izabel do Oeste', 18, 'PR'),
(3112, 'Santa Lúcia', 18, 'PR'),
(3113, 'Santa Maria do Oeste', 18, 'PR'),
(3114, 'Santa Mariana', 18, 'PR'),
(3115, 'Santa Mônica', 18, 'PR'),
(3116, 'Santa Tereza do Oeste', 18, 'PR'),
(3117, 'Santa Terezinha de Itaipu', 18, 'PR'),
(3118, 'Santana do Itararé', 18, 'PR'),
(3119, 'Santo Antônio da Platina', 18, 'PR'),
(3120, 'Santo Antônio do Caiuá', 18, 'PR'),
(3121, 'Santo Antônio do Paraíso', 18, 'PR'),
(3122, 'Santo Antônio do Sudoeste', 18, 'PR'),
(3123, 'Santo Inácio', 18, 'PR'),
(3124, 'São Carlos do Ivaí', 18, 'PR'),
(3125, 'São Jerônimo da Serra', 18, 'PR'),
(3126, 'São João', 18, 'PR'),
(3127, 'São João do Caiuá', 18, 'PR'),
(3128, 'São João do Ivaí', 18, 'PR'),
(3129, 'São João do Triunfo', 18, 'PR'),
(3130, 'São Jorge d`Oeste', 18, 'PR'),
(3131, 'São Jorge do Ivaí', 18, 'PR'),
(3132, 'São Jorge do Patrocínio', 18, 'PR'),
(3133, 'São José da Boa Vista', 18, 'PR'),
(3134, 'São José das Palmeiras', 18, 'PR'),
(3135, 'São José dos Pinhais', 18, 'PR'),
(3136, 'São Manoel do Paraná', 18, 'PR'),
(3137, 'São Mateus do Sul', 18, 'PR'),
(3138, 'São Miguel do Iguaçu', 18, 'PR'),
(3139, 'São Pedro do Iguaçu', 18, 'PR'),
(3140, 'São Pedro do Ivaí', 18, 'PR'),
(3141, 'São Pedro do Paraná', 18, 'PR'),
(3142, 'São Sebastião da Amoreira', 18, 'PR'),
(3143, 'São Tomé', 18, 'PR'),
(3144, 'Sapopema', 18, 'PR'),
(3145, 'Sarandi', 18, 'PR'),
(3146, 'Saudade do Iguaçu', 18, 'PR'),
(3147, 'Sengés', 18, 'PR'),
(3148, 'Serranópolis do Iguaçu', 18, 'PR'),
(3149, 'Sertaneja', 18, 'PR'),
(3150, 'Sertanópolis', 18, 'PR'),
(3151, 'Siqueira Campos', 18, 'PR'),
(3152, 'Sulina', 18, 'PR'),
(3153, 'Tamarana', 18, 'PR'),
(3154, 'Tamboara', 18, 'PR'),
(3155, 'Tapejara', 18, 'PR'),
(3156, 'Tapira', 18, 'PR'),
(3157, 'Teixeira Soares', 18, 'PR'),
(3158, 'Telêmaco Borba', 18, 'PR'),
(3159, 'Terra Boa', 18, 'PR'),
(3160, 'Terra Rica', 18, 'PR'),
(3161, 'Terra Roxa', 18, 'PR'),
(3162, 'Tibagi', 18, 'PR'),
(3163, 'Tijucas do Sul', 18, 'PR'),
(3164, 'Toledo', 18, 'PR'),
(3165, 'Tomazina', 18, 'PR'),
(3166, 'Três Barras do Paraná', 18, 'PR'),
(3167, 'Tunas do Paraná', 18, 'PR'),
(3168, 'Tuneiras do Oeste', 18, 'PR'),
(3169, 'Tupãssi', 18, 'PR'),
(3170, 'Turvo', 18, 'PR'),
(3171, 'Ubiratã', 18, 'PR'),
(3172, 'Umuarama', 18, 'PR'),
(3173, 'União da Vitória', 18, 'PR'),
(3174, 'Uniflor', 18, 'PR'),
(3175, 'Uraí', 18, 'PR'),
(3176, 'Ventania', 18, 'PR'),
(3177, 'Vera Cruz do Oeste', 18, 'PR'),
(3178, 'Verê', 18, 'PR'),
(3179, 'Virmond', 18, 'PR'),
(3180, 'Vitorino', 18, 'PR'),
(3181, 'Wenceslau Braz', 18, 'PR'),
(3182, 'Xambrê', 18, 'PR'),
(3183, 'Abreu e Lima', 16, 'PE'),
(3184, 'Afogados da Ingazeira', 16, 'PE'),
(3185, 'Afrânio', 16, 'PE'),
(3186, 'Agrestina', 16, 'PE'),
(3187, 'Água Preta', 16, 'PE'),
(3188, 'Águas Belas', 16, 'PE'),
(3189, 'Alagoinha', 16, 'PE'),
(3190, 'Aliança', 16, 'PE'),
(3191, 'Altinho', 16, 'PE'),
(3192, 'Amaraji', 16, 'PE'),
(3193, 'Angelim', 16, 'PE'),
(3194, 'Araçoiaba', 16, 'PE'),
(3195, 'Araripina', 16, 'PE'),
(3196, 'Arcoverde', 16, 'PE'),
(3197, 'Barra de Guabiraba', 16, 'PE'),
(3198, 'Barreiros', 16, 'PE'),
(3199, 'Belém de Maria', 16, 'PE'),
(3200, 'Belém de São Francisco', 16, 'PE'),
(3201, 'Belo Jardim', 16, 'PE'),
(3202, 'Betânia', 16, 'PE'),
(3203, 'Bezerros', 16, 'PE'),
(3204, 'Bodocó', 16, 'PE'),
(3205, 'Bom Conselho', 16, 'PE'),
(3206, 'Bom Jardim', 16, 'PE'),
(3207, 'Bonito', 16, 'PE'),
(3208, 'Brejão', 16, 'PE'),
(3209, 'Brejinho', 16, 'PE'),
(3210, 'Brejo da Madre de Deus', 16, 'PE'),
(3211, 'Buenos Aires', 16, 'PE'),
(3212, 'Buíque', 16, 'PE'),
(3213, 'Cabo de Santo Agostinho', 16, 'PE'),
(3214, 'Cabrobó', 16, 'PE'),
(3215, 'Cachoeirinha', 16, 'PE'),
(3216, 'Caetés', 16, 'PE'),
(3217, 'Calçado', 16, 'PE'),
(3218, 'Calumbi', 16, 'PE'),
(3219, 'Camaragibe', 16, 'PE'),
(3220, 'Camocim de São Félix', 16, 'PE'),
(3221, 'Camutanga', 16, 'PE'),
(3222, 'Canhotinho', 16, 'PE'),
(3223, 'Capoeiras', 16, 'PE'),
(3224, 'Carnaíba', 16, 'PE'),
(3225, 'Carnaubeira da Penha', 16, 'PE'),
(3226, 'Carpina', 16, 'PE'),
(3227, 'Caruaru', 16, 'PE'),
(3228, 'Casinhas', 16, 'PE'),
(3229, 'Catende', 16, 'PE'),
(3230, 'Cedro', 16, 'PE'),
(3231, 'Chã de Alegria', 16, 'PE'),
(3232, 'Chã Grande', 16, 'PE'),
(3233, 'Condado', 16, 'PE'),
(3234, 'Correntes', 16, 'PE'),
(3235, 'Cortês', 16, 'PE'),
(3236, 'Cumaru', 16, 'PE');
INSERT INTO `cidade` (`id`, `nome`, `estado`, `uf`) VALUES
(3237, 'Cupira', 16, 'PE'),
(3238, 'Custódia', 16, 'PE'),
(3239, 'Dormentes', 16, 'PE'),
(3240, 'Escada', 16, 'PE'),
(3241, 'Exu', 16, 'PE'),
(3242, 'Feira Nova', 16, 'PE'),
(3243, 'Fernando de Noronha', 16, 'PE'),
(3244, 'Ferreiros', 16, 'PE'),
(3245, 'Flores', 16, 'PE'),
(3246, 'Floresta', 16, 'PE'),
(3247, 'Frei Miguelinho', 16, 'PE'),
(3248, 'Gameleira', 16, 'PE'),
(3249, 'Garanhuns', 16, 'PE'),
(3250, 'Glória do Goitá', 16, 'PE'),
(3251, 'Goiana', 16, 'PE'),
(3252, 'Granito', 16, 'PE'),
(3253, 'Gravatá', 16, 'PE'),
(3254, 'Iati', 16, 'PE'),
(3255, 'Ibimirim', 16, 'PE'),
(3256, 'Ibirajuba', 16, 'PE'),
(3257, 'Igarassu', 16, 'PE'),
(3258, 'Iguaraci', 16, 'PE'),
(3259, 'Ilha de Itamaracá', 16, 'PE'),
(3260, 'Inajá', 16, 'PE'),
(3261, 'Ingazeira', 16, 'PE'),
(3262, 'Ipojuca', 16, 'PE'),
(3263, 'Ipubi', 16, 'PE'),
(3264, 'Itacuruba', 16, 'PE'),
(3265, 'Itaíba', 16, 'PE'),
(3266, 'Itambé', 16, 'PE'),
(3267, 'Itapetim', 16, 'PE'),
(3268, 'Itapissuma', 16, 'PE'),
(3269, 'Itaquitinga', 16, 'PE'),
(3270, 'Jaboatão dos Guararapes', 16, 'PE'),
(3271, 'Jaqueira', 16, 'PE'),
(3272, 'Jataúba', 16, 'PE'),
(3273, 'Jatobá', 16, 'PE'),
(3274, 'João Alfredo', 16, 'PE'),
(3275, 'Joaquim Nabuco', 16, 'PE'),
(3276, 'Jucati', 16, 'PE'),
(3277, 'Jupi', 16, 'PE'),
(3278, 'Jurema', 16, 'PE'),
(3279, 'Lagoa do Carro', 16, 'PE'),
(3280, 'Lagoa do Itaenga', 16, 'PE'),
(3281, 'Lagoa do Ouro', 16, 'PE'),
(3282, 'Lagoa dos Gatos', 16, 'PE'),
(3283, 'Lagoa Grande', 16, 'PE'),
(3284, 'Lajedo', 16, 'PE'),
(3285, 'Limoeiro', 16, 'PE'),
(3286, 'Macaparana', 16, 'PE'),
(3287, 'Machados', 16, 'PE'),
(3288, 'Manari', 16, 'PE'),
(3289, 'Maraial', 16, 'PE'),
(3290, 'Mirandiba', 16, 'PE'),
(3291, 'Moreilândia', 16, 'PE'),
(3292, 'Moreno', 16, 'PE'),
(3293, 'Nazaré da Mata', 16, 'PE'),
(3294, 'Olinda', 16, 'PE'),
(3295, 'Orobó', 16, 'PE'),
(3296, 'Orocó', 16, 'PE'),
(3297, 'Ouricuri', 16, 'PE'),
(3298, 'Palmares', 16, 'PE'),
(3299, 'Palmeirina', 16, 'PE'),
(3300, 'Panelas', 16, 'PE'),
(3301, 'Paranatama', 16, 'PE'),
(3302, 'Parnamirim', 16, 'PE'),
(3303, 'Passira', 16, 'PE'),
(3304, 'Paudalho', 16, 'PE'),
(3305, 'Paulista', 16, 'PE'),
(3306, 'Pedra', 16, 'PE'),
(3307, 'Pesqueira', 16, 'PE'),
(3308, 'Petrolândia', 16, 'PE'),
(3309, 'Petrolina', 16, 'PE'),
(3310, 'Poção', 16, 'PE'),
(3311, 'Pombos', 16, 'PE'),
(3312, 'Primavera', 16, 'PE'),
(3313, 'Quipapá', 16, 'PE'),
(3314, 'Quixaba', 16, 'PE'),
(3315, 'Recife', 16, 'PE'),
(3316, 'Riacho das Almas', 16, 'PE'),
(3317, 'Ribeirão', 16, 'PE'),
(3318, 'Rio Formoso', 16, 'PE'),
(3319, 'Sairé', 16, 'PE'),
(3320, 'Salgadinho', 16, 'PE'),
(3321, 'Salgueiro', 16, 'PE'),
(3322, 'Saloá', 16, 'PE'),
(3323, 'Sanharó', 16, 'PE'),
(3324, 'Santa Cruz', 16, 'PE'),
(3325, 'Santa Cruz da Baixa Verde', 16, 'PE'),
(3326, 'Santa Cruz do Capibaribe', 16, 'PE'),
(3327, 'Santa Filomena', 16, 'PE'),
(3328, 'Santa Maria da Boa Vista', 16, 'PE'),
(3329, 'Santa Maria do Cambucá', 16, 'PE'),
(3330, 'Santa Terezinha', 16, 'PE'),
(3331, 'São Benedito do Sul', 16, 'PE'),
(3332, 'São Bento do Una', 16, 'PE'),
(3333, 'São Caitano', 16, 'PE'),
(3334, 'São João', 16, 'PE'),
(3335, 'São Joaquim do Monte', 16, 'PE'),
(3336, 'São José da Coroa Grande', 16, 'PE'),
(3337, 'São José do Belmonte', 16, 'PE'),
(3338, 'São José do Egito', 16, 'PE'),
(3339, 'São Lourenço da Mata', 16, 'PE'),
(3340, 'São Vicente Ferrer', 16, 'PE'),
(3341, 'Serra Talhada', 16, 'PE'),
(3342, 'Serrita', 16, 'PE'),
(3343, 'Sertânia', 16, 'PE'),
(3344, 'Sirinhaém', 16, 'PE'),
(3345, 'Solidão', 16, 'PE'),
(3346, 'Surubim', 16, 'PE'),
(3347, 'Tabira', 16, 'PE'),
(3348, 'Tacaimbó', 16, 'PE'),
(3349, 'Tacaratu', 16, 'PE'),
(3350, 'Tamandaré', 16, 'PE'),
(3351, 'Taquaritinga do Norte', 16, 'PE'),
(3352, 'Terezinha', 16, 'PE'),
(3353, 'Terra Nova', 16, 'PE'),
(3354, 'Timbaúba', 16, 'PE'),
(3355, 'Toritama', 16, 'PE'),
(3356, 'Tracunhaém', 16, 'PE'),
(3357, 'Trindade', 16, 'PE'),
(3358, 'Triunfo', 16, 'PE'),
(3359, 'Tupanatinga', 16, 'PE'),
(3360, 'Tuparetama', 16, 'PE'),
(3361, 'Venturosa', 16, 'PE'),
(3362, 'Verdejante', 16, 'PE'),
(3363, 'Vertente do Lério', 16, 'PE'),
(3364, 'Vertentes', 16, 'PE'),
(3365, 'Vicência', 16, 'PE'),
(3366, 'Vitória de Santo Antão', 16, 'PE'),
(3367, 'Xexéu', 16, 'PE'),
(3368, 'Acauã', 17, 'PI'),
(3369, 'Agricolândia', 17, 'PI'),
(3370, 'Água Branca', 17, 'PI'),
(3371, 'Alagoinha do Piauí', 17, 'PI'),
(3372, 'Alegrete do Piauí', 17, 'PI'),
(3373, 'Alto Longá', 17, 'PI'),
(3374, 'Altos', 17, 'PI'),
(3375, 'Alvorada do Gurguéia', 17, 'PI'),
(3376, 'Amarante', 17, 'PI'),
(3377, 'Angical do Piauí', 17, 'PI'),
(3378, 'Anísio de Abreu', 17, 'PI'),
(3379, 'Antônio Almeida', 17, 'PI'),
(3380, 'Aroazes', 17, 'PI'),
(3381, 'Aroeiras do Itaim', 17, 'PI'),
(3382, 'Arraial', 17, 'PI'),
(3383, 'Assunção do Piauí', 17, 'PI'),
(3384, 'Avelino Lopes', 17, 'PI'),
(3385, 'Baixa Grande do Ribeiro', 17, 'PI'),
(3386, 'Barra d`Alcântara', 17, 'PI'),
(3387, 'Barras', 17, 'PI'),
(3388, 'Barreiras do Piauí', 17, 'PI'),
(3389, 'Barro Duro', 17, 'PI'),
(3390, 'Batalha', 17, 'PI'),
(3391, 'Bela Vista do Piauí', 17, 'PI'),
(3392, 'Belém do Piauí', 17, 'PI'),
(3393, 'Beneditinos', 17, 'PI'),
(3394, 'Bertolínia', 17, 'PI'),
(3395, 'Betânia do Piauí', 17, 'PI'),
(3396, 'Boa Hora', 17, 'PI'),
(3397, 'Bocaina', 17, 'PI'),
(3398, 'Bom Jesus', 17, 'PI'),
(3399, 'Bom Princípio do Piauí', 17, 'PI'),
(3400, 'Bonfim do Piauí', 17, 'PI'),
(3401, 'Boqueirão do Piauí', 17, 'PI'),
(3402, 'Brasileira', 17, 'PI'),
(3403, 'Brejo do Piauí', 17, 'PI'),
(3404, 'Buriti dos Lopes', 17, 'PI'),
(3405, 'Buriti dos Montes', 17, 'PI'),
(3406, 'Cabeceiras do Piauí', 17, 'PI'),
(3407, 'Cajazeiras do Piauí', 17, 'PI'),
(3408, 'Cajueiro da Praia', 17, 'PI'),
(3409, 'Caldeirão Grande do Piauí', 17, 'PI'),
(3410, 'Campinas do Piauí', 17, 'PI'),
(3411, 'Campo Alegre do Fidalgo', 17, 'PI'),
(3412, 'Campo Grande do Piauí', 17, 'PI'),
(3413, 'Campo Largo do Piauí', 17, 'PI'),
(3414, 'Campo Maior', 17, 'PI'),
(3415, 'Canavieira', 17, 'PI'),
(3416, 'Canto do Buriti', 17, 'PI'),
(3417, 'Capitão de Campos', 17, 'PI'),
(3418, 'Capitão Gervásio Oliveira', 17, 'PI'),
(3419, 'Caracol', 17, 'PI'),
(3420, 'Caraúbas do Piauí', 17, 'PI'),
(3421, 'Caridade do Piauí', 17, 'PI'),
(3422, 'Castelo do Piauí', 17, 'PI'),
(3423, 'Caxingó', 17, 'PI'),
(3424, 'Cocal', 17, 'PI'),
(3425, 'Cocal de Telha', 17, 'PI'),
(3426, 'Cocal dos Alves', 17, 'PI'),
(3427, 'Coivaras', 17, 'PI'),
(3428, 'Colônia do Gurguéia', 17, 'PI'),
(3429, 'Colônia do Piauí', 17, 'PI'),
(3430, 'Conceição do Canindé', 17, 'PI'),
(3431, 'Coronel José Dias', 17, 'PI'),
(3432, 'Corrente', 17, 'PI'),
(3433, 'Cristalândia do Piauí', 17, 'PI'),
(3434, 'Cristino Castro', 17, 'PI'),
(3435, 'Curimatá', 17, 'PI'),
(3436, 'Currais', 17, 'PI'),
(3437, 'Curral Novo do Piauí', 17, 'PI'),
(3438, 'Curralinhos', 17, 'PI'),
(3439, 'Demerval Lobão', 17, 'PI'),
(3440, 'Dirceu Arcoverde', 17, 'PI'),
(3441, 'Dom Expedito Lopes', 17, 'PI'),
(3442, 'Dom Inocêncio', 17, 'PI'),
(3443, 'Domingos Mourão', 17, 'PI'),
(3444, 'Elesbão Veloso', 17, 'PI'),
(3445, 'Eliseu Martins', 17, 'PI'),
(3446, 'Esperantina', 17, 'PI'),
(3447, 'Fartura do Piauí', 17, 'PI'),
(3448, 'Flores do Piauí', 17, 'PI'),
(3449, 'Floresta do Piauí', 17, 'PI'),
(3450, 'Floriano', 17, 'PI'),
(3451, 'Francinópolis', 17, 'PI'),
(3452, 'Francisco Ayres', 17, 'PI'),
(3453, 'Francisco Macedo', 17, 'PI'),
(3454, 'Francisco Santos', 17, 'PI'),
(3455, 'Fronteiras', 17, 'PI'),
(3456, 'Geminiano', 17, 'PI'),
(3457, 'Gilbués', 17, 'PI'),
(3458, 'Guadalupe', 17, 'PI'),
(3459, 'Guaribas', 17, 'PI'),
(3460, 'Hugo Napoleão', 17, 'PI'),
(3461, 'Ilha Grande', 17, 'PI'),
(3462, 'Inhuma', 17, 'PI'),
(3463, 'Ipiranga do Piauí', 17, 'PI'),
(3464, 'Isaías Coelho', 17, 'PI'),
(3465, 'Itainópolis', 17, 'PI'),
(3466, 'Itaueira', 17, 'PI'),
(3467, 'Jacobina do Piauí', 17, 'PI'),
(3468, 'Jaicós', 17, 'PI'),
(3469, 'Jardim do Mulato', 17, 'PI'),
(3470, 'Jatobá do Piauí', 17, 'PI'),
(3471, 'Jerumenha', 17, 'PI'),
(3472, 'João Costa', 17, 'PI'),
(3473, 'Joaquim Pires', 17, 'PI'),
(3474, 'Joca Marques', 17, 'PI'),
(3475, 'José de Freitas', 17, 'PI'),
(3476, 'Juazeiro do Piauí', 17, 'PI'),
(3477, 'Júlio Borges', 17, 'PI'),
(3478, 'Jurema', 17, 'PI'),
(3479, 'Lagoa Alegre', 17, 'PI'),
(3480, 'Lagoa de São Francisco', 17, 'PI'),
(3481, 'Lagoa do Barro do Piauí', 17, 'PI'),
(3482, 'Lagoa do Piauí', 17, 'PI'),
(3483, 'Lagoa do Sítio', 17, 'PI'),
(3484, 'Lagoinha do Piauí', 17, 'PI'),
(3485, 'Landri Sales', 17, 'PI'),
(3486, 'Luís Correia', 17, 'PI'),
(3487, 'Luzilândia', 17, 'PI'),
(3488, 'Madeiro', 17, 'PI'),
(3489, 'Manoel Emídio', 17, 'PI'),
(3490, 'Marcolândia', 17, 'PI'),
(3491, 'Marcos Parente', 17, 'PI'),
(3492, 'Massapê do Piauí', 17, 'PI'),
(3493, 'Matias Olímpio', 17, 'PI'),
(3494, 'Miguel Alves', 17, 'PI'),
(3495, 'Miguel Leão', 17, 'PI'),
(3496, 'Milton Brandão', 17, 'PI'),
(3497, 'Monsenhor Gil', 17, 'PI'),
(3498, 'Monsenhor Hipólito', 17, 'PI'),
(3499, 'Monte Alegre do Piauí', 17, 'PI'),
(3500, 'Morro Cabeça no Tempo', 17, 'PI'),
(3501, 'Morro do Chapéu do Piauí', 17, 'PI'),
(3502, 'Murici dos Portelas', 17, 'PI'),
(3503, 'Nazaré do Piauí', 17, 'PI'),
(3504, 'Nossa Senhora de Nazaré', 17, 'PI'),
(3505, 'Nossa Senhora dos Remédios', 17, 'PI'),
(3506, 'Nova Santa Rita', 17, 'PI'),
(3507, 'Novo Oriente do Piauí', 17, 'PI'),
(3508, 'Novo Santo Antônio', 17, 'PI'),
(3509, 'Oeiras', 17, 'PI'),
(3510, 'Olho d`Água do Piauí', 17, 'PI'),
(3511, 'Padre Marcos', 17, 'PI'),
(3512, 'Paes Landim', 17, 'PI'),
(3513, 'Pajeú do Piauí', 17, 'PI'),
(3514, 'Palmeira do Piauí', 17, 'PI'),
(3515, 'Palmeirais', 17, 'PI'),
(3516, 'Paquetá', 17, 'PI'),
(3517, 'Parnaguá', 17, 'PI'),
(3518, 'Parnaíba', 17, 'PI'),
(3519, 'Passagem Franca do Piauí', 17, 'PI'),
(3520, 'Patos do Piauí', 17, 'PI'),
(3521, 'Pau d`Arco do Piauí', 17, 'PI'),
(3522, 'Paulistana', 17, 'PI'),
(3523, 'Pavussu', 17, 'PI'),
(3524, 'Pedro II', 17, 'PI'),
(3525, 'Pedro Laurentino', 17, 'PI'),
(3526, 'Picos', 17, 'PI'),
(3527, 'Pimenteiras', 17, 'PI'),
(3528, 'Pio IX', 17, 'PI'),
(3529, 'Piracuruca', 17, 'PI'),
(3530, 'Piripiri', 17, 'PI'),
(3531, 'Porto', 17, 'PI'),
(3532, 'Porto Alegre do Piauí', 17, 'PI'),
(3533, 'Prata do Piauí', 17, 'PI'),
(3534, 'Queimada Nova', 17, 'PI'),
(3535, 'Redenção do Gurguéia', 17, 'PI'),
(3536, 'Regeneração', 17, 'PI'),
(3537, 'Riacho Frio', 17, 'PI'),
(3538, 'Ribeira do Piauí', 17, 'PI'),
(3539, 'Ribeiro Gonçalves', 17, 'PI'),
(3540, 'Rio Grande do Piauí', 17, 'PI'),
(3541, 'Santa Cruz do Piauí', 17, 'PI'),
(3542, 'Santa Cruz dos Milagres', 17, 'PI'),
(3543, 'Santa Filomena', 17, 'PI'),
(3544, 'Santa Luz', 17, 'PI'),
(3545, 'Santa Rosa do Piauí', 17, 'PI'),
(3546, 'Santana do Piauí', 17, 'PI'),
(3547, 'Santo Antônio de Lisboa', 17, 'PI'),
(3548, 'Santo Antônio dos Milagres', 17, 'PI'),
(3549, 'Santo Inácio do Piauí', 17, 'PI'),
(3550, 'São Braz do Piauí', 17, 'PI'),
(3551, 'São Félix do Piauí', 17, 'PI'),
(3552, 'São Francisco de Assis do Piauí', 17, 'PI'),
(3553, 'São Francisco do Piauí', 17, 'PI'),
(3554, 'São Gonçalo do Gurguéia', 17, 'PI'),
(3555, 'São Gonçalo do Piauí', 17, 'PI'),
(3556, 'São João da Canabrava', 17, 'PI'),
(3557, 'São João da Fronteira', 17, 'PI'),
(3558, 'São João da Serra', 17, 'PI'),
(3559, 'São João da Varjota', 17, 'PI'),
(3560, 'São João do Arraial', 17, 'PI'),
(3561, 'São João do Piauí', 17, 'PI'),
(3562, 'São José do Divino', 17, 'PI'),
(3563, 'São José do Peixe', 17, 'PI'),
(3564, 'São José do Piauí', 17, 'PI'),
(3565, 'São Julião', 17, 'PI'),
(3566, 'São Lourenço do Piauí', 17, 'PI'),
(3567, 'São Luis do Piauí', 17, 'PI'),
(3568, 'São Miguel da Baixa Grande', 17, 'PI'),
(3569, 'São Miguel do Fidalgo', 17, 'PI'),
(3570, 'São Miguel do Tapuio', 17, 'PI'),
(3571, 'São Pedro do Piauí', 17, 'PI'),
(3572, 'São Raimundo Nonato', 17, 'PI'),
(3573, 'Sebastião Barros', 17, 'PI'),
(3574, 'Sebastião Leal', 17, 'PI'),
(3575, 'Sigefredo Pacheco', 17, 'PI'),
(3576, 'Simões', 17, 'PI'),
(3577, 'Simplício Mendes', 17, 'PI'),
(3578, 'Socorro do Piauí', 17, 'PI'),
(3579, 'Sussuapara', 17, 'PI'),
(3580, 'Tamboril do Piauí', 17, 'PI'),
(3581, 'Tanque do Piauí', 17, 'PI'),
(3582, 'Teresina', 17, 'PI'),
(3583, 'União', 17, 'PI'),
(3584, 'Uruçuí', 17, 'PI'),
(3585, 'Valença do Piauí', 17, 'PI'),
(3586, 'Várzea Branca', 17, 'PI'),
(3587, 'Várzea Grande', 17, 'PI'),
(3588, 'Vera Mendes', 17, 'PI'),
(3589, 'Vila Nova do Piauí', 17, 'PI'),
(3590, 'Wall Ferraz', 17, 'PI'),
(3591, 'Angra dos Reis', 19, 'RJ'),
(3592, 'Aperibé', 19, 'RJ'),
(3593, 'Araruama', 19, 'RJ'),
(3594, 'Areal', 19, 'RJ'),
(3595, 'Armação dos Búzios', 19, 'RJ'),
(3596, 'Arraial do Cabo', 19, 'RJ'),
(3597, 'Barra do Piraí', 19, 'RJ'),
(3598, 'Barra Mansa', 19, 'RJ'),
(3599, 'Belford Roxo', 19, 'RJ'),
(3600, 'Bom Jardim', 19, 'RJ'),
(3601, 'Bom Jesus do Itabapoana', 19, 'RJ'),
(3602, 'Cabo Frio', 19, 'RJ'),
(3603, 'Cachoeiras de Macacu', 19, 'RJ'),
(3604, 'Cambuci', 19, 'RJ'),
(3605, 'Campos dos Goytacazes', 19, 'RJ'),
(3606, 'Cantagalo', 19, 'RJ'),
(3607, 'Carapebus', 19, 'RJ'),
(3608, 'Cardoso Moreira', 19, 'RJ'),
(3609, 'Carmo', 19, 'RJ'),
(3610, 'Casimiro de Abreu', 19, 'RJ'),
(3611, 'Comendador Levy Gasparian', 19, 'RJ'),
(3612, 'Conceição de Macabu', 19, 'RJ'),
(3613, 'Cordeiro', 19, 'RJ'),
(3614, 'Duas Barras', 19, 'RJ'),
(3615, 'Duque de Caxias', 19, 'RJ'),
(3616, 'Engenheiro Paulo de Frontin', 19, 'RJ'),
(3617, 'Guapimirim', 19, 'RJ'),
(3618, 'Iguaba Grande', 19, 'RJ'),
(3619, 'Itaboraí', 19, 'RJ'),
(3620, 'Itaguaí', 19, 'RJ'),
(3621, 'Italva', 19, 'RJ'),
(3622, 'Itaocara', 19, 'RJ'),
(3623, 'Itaperuna', 19, 'RJ'),
(3624, 'Itatiaia', 19, 'RJ'),
(3625, 'Japeri', 19, 'RJ'),
(3626, 'Laje do Muriaé', 19, 'RJ'),
(3627, 'Macaé', 19, 'RJ'),
(3628, 'Macuco', 19, 'RJ'),
(3629, 'Magé', 19, 'RJ'),
(3630, 'Mangaratiba', 19, 'RJ'),
(3631, 'Maricá', 19, 'RJ'),
(3632, 'Mendes', 19, 'RJ'),
(3633, 'Mesquita', 19, 'RJ'),
(3634, 'Miguel Pereira', 19, 'RJ'),
(3635, 'Miracema', 19, 'RJ'),
(3636, 'Natividade', 19, 'RJ'),
(3637, 'Nilópolis', 19, 'RJ'),
(3638, 'Niterói', 19, 'RJ'),
(3639, 'Nova Friburgo', 19, 'RJ'),
(3640, 'Nova Iguaçu', 19, 'RJ'),
(3641, 'Paracambi', 19, 'RJ'),
(3642, 'Paraíba do Sul', 19, 'RJ'),
(3643, 'Parati', 19, 'RJ'),
(3644, 'Paty do Alferes', 19, 'RJ'),
(3645, 'Petrópolis', 19, 'RJ'),
(3646, 'Pinheiral', 19, 'RJ'),
(3647, 'Piraí', 19, 'RJ'),
(3648, 'Porciúncula', 19, 'RJ'),
(3649, 'Porto Real', 19, 'RJ'),
(3650, 'Quatis', 19, 'RJ'),
(3651, 'Queimados', 19, 'RJ'),
(3652, 'Quissamã', 19, 'RJ'),
(3653, 'Resende', 19, 'RJ'),
(3654, 'Rio Bonito', 19, 'RJ'),
(3655, 'Rio Claro', 19, 'RJ'),
(3656, 'Rio das Flores', 19, 'RJ'),
(3657, 'Rio das Ostras', 19, 'RJ'),
(3658, 'Rio de Janeiro', 19, 'RJ'),
(3659, 'Santa Maria Madalena', 19, 'RJ'),
(3660, 'Santo Antônio de Pádua', 19, 'RJ'),
(3661, 'São Fidélis', 19, 'RJ'),
(3662, 'São Francisco de Itabapoana', 19, 'RJ'),
(3663, 'São Gonçalo', 19, 'RJ'),
(3664, 'São João da Barra', 19, 'RJ'),
(3665, 'São João de Meriti', 19, 'RJ'),
(3666, 'São José de Ubá', 19, 'RJ'),
(3667, 'São José do Vale do Rio Pret', 19, 'RJ'),
(3668, 'São Pedro da Aldeia', 19, 'RJ'),
(3669, 'São Sebastião do Alto', 19, 'RJ'),
(3670, 'Sapucaia', 19, 'RJ'),
(3671, 'Saquarema', 19, 'RJ'),
(3672, 'Seropédica', 19, 'RJ'),
(3673, 'Silva Jardim', 19, 'RJ'),
(3674, 'Sumidouro', 19, 'RJ'),
(3675, 'Tanguá', 19, 'RJ'),
(3676, 'Teresópolis', 19, 'RJ'),
(3677, 'Trajano de Morais', 19, 'RJ'),
(3678, 'Três Rios', 19, 'RJ'),
(3679, 'Valença', 19, 'RJ'),
(3680, 'Varre-Sai', 19, 'RJ'),
(3681, 'Vassouras', 19, 'RJ'),
(3682, 'Volta Redonda', 19, 'RJ'),
(3683, 'Acari', 20, 'RN'),
(3684, 'Açu', 20, 'RN'),
(3685, 'Afonso Bezerra', 20, 'RN'),
(3686, 'Água Nova', 20, 'RN'),
(3687, 'Alexandria', 20, 'RN'),
(3688, 'Almino Afonso', 20, 'RN'),
(3689, 'Alto do Rodrigues', 20, 'RN'),
(3690, 'Angicos', 20, 'RN'),
(3691, 'Antônio Martins', 20, 'RN'),
(3692, 'Apodi', 20, 'RN'),
(3693, 'Areia Branca', 20, 'RN'),
(3694, 'Arês', 20, 'RN'),
(3695, 'Augusto Severo', 20, 'RN'),
(3696, 'Baía Formosa', 20, 'RN'),
(3697, 'Baraúna', 20, 'RN'),
(3698, 'Barcelona', 20, 'RN'),
(3699, 'Bento Fernandes', 20, 'RN'),
(3700, 'Bodó', 20, 'RN'),
(3701, 'Bom Jesus', 20, 'RN'),
(3702, 'Brejinho', 20, 'RN'),
(3703, 'Caiçara do Norte', 20, 'RN'),
(3704, 'Caiçara do Rio do Vento', 20, 'RN'),
(3705, 'Caicó', 20, 'RN'),
(3706, 'Campo Redondo', 20, 'RN'),
(3707, 'Canguaretama', 20, 'RN'),
(3708, 'Caraúbas', 20, 'RN'),
(3709, 'Carnaúba dos Dantas', 20, 'RN'),
(3710, 'Carnaubais', 20, 'RN'),
(3711, 'Ceará-Mirim', 20, 'RN'),
(3712, 'Cerro Corá', 20, 'RN'),
(3713, 'Coronel Ezequiel', 20, 'RN'),
(3714, 'Coronel João Pessoa', 20, 'RN'),
(3715, 'Cruzeta', 20, 'RN'),
(3716, 'Currais Novos', 20, 'RN'),
(3717, 'Doutor Severiano', 20, 'RN'),
(3718, 'Encanto', 20, 'RN'),
(3719, 'Equador', 20, 'RN'),
(3720, 'Espírito Santo', 20, 'RN'),
(3721, 'Extremoz', 20, 'RN'),
(3722, 'Felipe Guerra', 20, 'RN'),
(3723, 'Fernando Pedroza', 20, 'RN'),
(3724, 'Florânia', 20, 'RN'),
(3725, 'Francisco Dantas', 20, 'RN'),
(3726, 'Frutuoso Gomes', 20, 'RN'),
(3727, 'Galinhos', 20, 'RN'),
(3728, 'Goianinha', 20, 'RN'),
(3729, 'Governador Dix-Sept Rosado', 20, 'RN'),
(3730, 'Grossos', 20, 'RN'),
(3731, 'Guamaré', 20, 'RN'),
(3732, 'Ielmo Marinho', 20, 'RN'),
(3733, 'Ipanguaçu', 20, 'RN'),
(3734, 'Ipueira', 20, 'RN'),
(3735, 'Itajá', 20, 'RN'),
(3736, 'Itaú', 20, 'RN'),
(3737, 'Jaçanã', 20, 'RN'),
(3738, 'Jandaíra', 20, 'RN'),
(3739, 'Janduís', 20, 'RN'),
(3740, 'Januário Cicco', 20, 'RN'),
(3741, 'Japi', 20, 'RN'),
(3742, 'Jardim de Angicos', 20, 'RN'),
(3743, 'Jardim de Piranhas', 20, 'RN'),
(3744, 'Jardim do Seridó', 20, 'RN'),
(3745, 'João Câmara', 20, 'RN'),
(3746, 'João Dias', 20, 'RN'),
(3747, 'José da Penha', 20, 'RN'),
(3748, 'Jucurutu', 20, 'RN'),
(3749, 'Jundiá', 20, 'RN'),
(3750, 'Lagoa d`Anta', 20, 'RN'),
(3751, 'Lagoa de Pedras', 20, 'RN'),
(3752, 'Lagoa de Velhos', 20, 'RN'),
(3753, 'Lagoa Nova', 20, 'RN'),
(3754, 'Lagoa Salgada', 20, 'RN'),
(3755, 'Lajes', 20, 'RN'),
(3756, 'Lajes Pintadas', 20, 'RN'),
(3757, 'Lucrécia', 20, 'RN'),
(3758, 'Luís Gomes', 20, 'RN'),
(3759, 'Macaíba', 20, 'RN'),
(3760, 'Macau', 20, 'RN'),
(3761, 'Major Sales', 20, 'RN'),
(3762, 'Marcelino Vieira', 20, 'RN'),
(3763, 'Martins', 20, 'RN'),
(3764, 'Maxaranguape', 20, 'RN'),
(3765, 'Messias Targino', 20, 'RN'),
(3766, 'Montanhas', 20, 'RN'),
(3767, 'Monte Alegre', 20, 'RN'),
(3768, 'Monte das Gameleiras', 20, 'RN'),
(3769, 'Mossoró', 20, 'RN'),
(3770, 'Natal', 20, 'RN'),
(3771, 'Nísia Floresta', 20, 'RN'),
(3772, 'Nova Cruz', 20, 'RN'),
(3773, 'Olho-d`Água do Borges', 20, 'RN'),
(3774, 'Ouro Branco', 20, 'RN'),
(3775, 'Paraná', 20, 'RN'),
(3776, 'Paraú', 20, 'RN'),
(3777, 'Parazinho', 20, 'RN'),
(3778, 'Parelhas', 20, 'RN'),
(3779, 'Parnamirim', 20, 'RN'),
(3780, 'Passa e Fica', 20, 'RN'),
(3781, 'Passagem', 20, 'RN'),
(3782, 'Patu', 20, 'RN'),
(3783, 'Pau dos Ferros', 20, 'RN'),
(3784, 'Pedra Grande', 20, 'RN'),
(3785, 'Pedra Preta', 20, 'RN'),
(3786, 'Pedro Avelino', 20, 'RN'),
(3787, 'Pedro Velho', 20, 'RN'),
(3788, 'Pendências', 20, 'RN'),
(3789, 'Pilões', 20, 'RN'),
(3790, 'Poço Branco', 20, 'RN'),
(3791, 'Portalegre', 20, 'RN'),
(3792, 'Porto do Mangue', 20, 'RN'),
(3793, 'Presidente Juscelino', 20, 'RN'),
(3794, 'Pureza', 20, 'RN'),
(3795, 'Rafael Fernandes', 20, 'RN'),
(3796, 'Rafael Godeiro', 20, 'RN'),
(3797, 'Riacho da Cruz', 20, 'RN'),
(3798, 'Riacho de Santana', 20, 'RN'),
(3799, 'Riachuelo', 20, 'RN'),
(3800, 'Rio do Fogo', 20, 'RN'),
(3801, 'Rodolfo Fernandes', 20, 'RN'),
(3802, 'Ruy Barbosa', 20, 'RN'),
(3803, 'Santa Cruz', 20, 'RN'),
(3804, 'Santa Maria', 20, 'RN'),
(3805, 'Santana do Matos', 20, 'RN'),
(3806, 'Santana do Seridó', 20, 'RN'),
(3807, 'Santo Antônio', 20, 'RN'),
(3808, 'São Bento do Norte', 20, 'RN'),
(3809, 'São Bento do Trairí', 20, 'RN'),
(3810, 'São Fernando', 20, 'RN'),
(3811, 'São Francisco do Oeste', 20, 'RN'),
(3812, 'São Gonçalo do Amarante', 20, 'RN'),
(3813, 'São João do Sabugi', 20, 'RN'),
(3814, 'São José de Mipibu', 20, 'RN'),
(3815, 'São José do Campestre', 20, 'RN'),
(3816, 'São José do Seridó', 20, 'RN'),
(3817, 'São Miguel', 20, 'RN'),
(3818, 'São Miguel do Gostoso', 20, 'RN'),
(3819, 'São Paulo do Potengi', 20, 'RN'),
(3820, 'São Pedro', 20, 'RN'),
(3821, 'São Rafael', 20, 'RN'),
(3822, 'São Tomé', 20, 'RN'),
(3823, 'São Vicente', 20, 'RN'),
(3824, 'Senador Elói de Souza', 20, 'RN'),
(3825, 'Senador Georgino Avelino', 20, 'RN'),
(3826, 'Serra de São Bento', 20, 'RN'),
(3827, 'Serra do Mel', 20, 'RN'),
(3828, 'Serra Negra do Norte', 20, 'RN'),
(3829, 'Serrinha', 20, 'RN'),
(3830, 'Serrinha dos Pintos', 20, 'RN'),
(3831, 'Severiano Melo', 20, 'RN'),
(3832, 'Sítio Novo', 20, 'RN'),
(3833, 'Taboleiro Grande', 20, 'RN'),
(3834, 'Taipu', 20, 'RN'),
(3835, 'Tangará', 20, 'RN'),
(3836, 'Tenente Ananias', 20, 'RN'),
(3837, 'Tenente Laurentino Cruz', 20, 'RN'),
(3838, 'Tibau', 20, 'RN'),
(3839, 'Tibau do Sul', 20, 'RN'),
(3840, 'Timbaúba dos Batistas', 20, 'RN'),
(3841, 'Touros', 20, 'RN'),
(3842, 'Triunfo Potiguar', 20, 'RN'),
(3843, 'Umarizal', 20, 'RN'),
(3844, 'Upanema', 20, 'RN'),
(3845, 'Várzea', 20, 'RN'),
(3846, 'Venha-Ver', 20, 'RN'),
(3847, 'Vera Cruz', 20, 'RN'),
(3848, 'Viçosa', 20, 'RN'),
(3849, 'Vila Flor', 20, 'RN'),
(3850, 'Aceguá', 23, 'RS'),
(3851, 'Água Santa', 23, 'RS'),
(3852, 'Agudo', 23, 'RS'),
(3853, 'Ajuricaba', 23, 'RS'),
(3854, 'Alecrim', 23, 'RS'),
(3855, 'Alegrete', 23, 'RS'),
(3856, 'Alegria', 23, 'RS'),
(3857, 'Almirante Tamandaré do Sul', 23, 'RS'),
(3858, 'Alpestre', 23, 'RS'),
(3859, 'Alto Alegre', 23, 'RS'),
(3860, 'Alto Feliz', 23, 'RS'),
(3861, 'Alvorada', 23, 'RS'),
(3862, 'Amaral Ferrador', 23, 'RS'),
(3863, 'Ametista do Sul', 23, 'RS'),
(3864, 'André da Rocha', 23, 'RS'),
(3865, 'Anta Gorda', 23, 'RS'),
(3866, 'Antônio Prado', 23, 'RS'),
(3867, 'Arambaré', 23, 'RS'),
(3868, 'Araricá', 23, 'RS'),
(3869, 'Aratiba', 23, 'RS'),
(3870, 'Arroio do Meio', 23, 'RS'),
(3871, 'Arroio do Padre', 23, 'RS'),
(3872, 'Arroio do Sal', 23, 'RS'),
(3873, 'Arroio do Tigre', 23, 'RS'),
(3874, 'Arroio dos Ratos', 23, 'RS'),
(3875, 'Arroio Grande', 23, 'RS'),
(3876, 'Arvorezinha', 23, 'RS'),
(3877, 'Augusto Pestana', 23, 'RS'),
(3878, 'Áurea', 23, 'RS'),
(3879, 'Bagé', 23, 'RS'),
(3880, 'Balneário Pinhal', 23, 'RS'),
(3881, 'Barão', 23, 'RS'),
(3882, 'Barão de Cotegipe', 23, 'RS'),
(3883, 'Barão do Triunfo', 23, 'RS'),
(3884, 'Barra do Guarita', 23, 'RS'),
(3885, 'Barra do Quaraí', 23, 'RS'),
(3886, 'Barra do Ribeiro', 23, 'RS'),
(3887, 'Barra do Rio Azul', 23, 'RS'),
(3888, 'Barra Funda', 23, 'RS'),
(3889, 'Barracão', 23, 'RS'),
(3890, 'Barros Cassal', 23, 'RS'),
(3891, 'Benjamin Constant do Sul', 23, 'RS'),
(3892, 'Bento Gonçalves', 23, 'RS'),
(3893, 'Boa Vista das Missões', 23, 'RS'),
(3894, 'Boa Vista do Buricá', 23, 'RS'),
(3895, 'Boa Vista do Cadeado', 23, 'RS'),
(3896, 'Boa Vista do Incra', 23, 'RS'),
(3897, 'Boa Vista do Sul', 23, 'RS'),
(3898, 'Bom Jesus', 23, 'RS'),
(3899, 'Bom Princípio', 23, 'RS'),
(3900, 'Bom Progresso', 23, 'RS'),
(3901, 'Bom Retiro do Sul', 23, 'RS'),
(3902, 'Boqueirão do Leão', 23, 'RS'),
(3903, 'Bossoroca', 23, 'RS'),
(3904, 'Bozano', 23, 'RS'),
(3905, 'Braga', 23, 'RS'),
(3906, 'Brochier', 23, 'RS'),
(3907, 'Butiá', 23, 'RS'),
(3908, 'Caçapava do Sul', 23, 'RS'),
(3909, 'Cacequi', 23, 'RS'),
(3910, 'Cachoeira do Sul', 23, 'RS'),
(3911, 'Cachoeirinha', 23, 'RS'),
(3912, 'Cacique Doble', 23, 'RS'),
(3913, 'Caibaté', 23, 'RS'),
(3914, 'Caiçara', 23, 'RS'),
(3915, 'Camaquã', 23, 'RS'),
(3916, 'Camargo', 23, 'RS'),
(3917, 'Cambará do Sul', 23, 'RS'),
(3918, 'Campestre da Serra', 23, 'RS'),
(3919, 'Campina das Missões', 23, 'RS'),
(3920, 'Campinas do Sul', 23, 'RS'),
(3921, 'Campo Bom', 23, 'RS'),
(3922, 'Campo Novo', 23, 'RS'),
(3923, 'Campos Borges', 23, 'RS'),
(3924, 'Candelária', 23, 'RS'),
(3925, 'Cândido Godói', 23, 'RS'),
(3926, 'Candiota', 23, 'RS'),
(3927, 'Canela', 23, 'RS'),
(3928, 'Canguçu', 23, 'RS'),
(3929, 'Canoas', 23, 'RS'),
(3930, 'Canudos do Vale', 23, 'RS'),
(3931, 'Capão Bonito do Sul', 23, 'RS'),
(3932, 'Capão da Canoa', 23, 'RS'),
(3933, 'Capão do Cipó', 23, 'RS'),
(3934, 'Capão do Leão', 23, 'RS'),
(3935, 'Capela de Santana', 23, 'RS'),
(3936, 'Capitão', 23, 'RS'),
(3937, 'Capivari do Sul', 23, 'RS'),
(3938, 'Caraá', 23, 'RS'),
(3939, 'Carazinho', 23, 'RS'),
(3940, 'Carlos Barbosa', 23, 'RS'),
(3941, 'Carlos Gomes', 23, 'RS'),
(3942, 'Casca', 23, 'RS'),
(3943, 'Caseiros', 23, 'RS'),
(3944, 'Catuípe', 23, 'RS'),
(3945, 'Caxias do Sul', 23, 'RS'),
(3946, 'Centenário', 23, 'RS'),
(3947, 'Cerrito', 23, 'RS'),
(3948, 'Cerro Branco', 23, 'RS'),
(3949, 'Cerro Grande', 23, 'RS'),
(3950, 'Cerro Grande do Sul', 23, 'RS'),
(3951, 'Cerro Largo', 23, 'RS'),
(3952, 'Chapada', 23, 'RS'),
(3953, 'Charqueadas', 23, 'RS'),
(3954, 'Charrua', 23, 'RS'),
(3955, 'Chiapeta', 23, 'RS'),
(3956, 'Chuí', 23, 'RS'),
(3957, 'Chuvisca', 23, 'RS'),
(3958, 'Cidreira', 23, 'RS'),
(3959, 'Ciríaco', 23, 'RS'),
(3960, 'Colinas', 23, 'RS'),
(3961, 'Colorado', 23, 'RS'),
(3962, 'Condor', 23, 'RS'),
(3963, 'Constantina', 23, 'RS'),
(3964, 'Coqueiro Baixo', 23, 'RS'),
(3965, 'Coqueiros do Sul', 23, 'RS'),
(3966, 'Coronel Barros', 23, 'RS'),
(3967, 'Coronel Bicaco', 23, 'RS'),
(3968, 'Coronel Pilar', 23, 'RS'),
(3969, 'Cotiporã', 23, 'RS'),
(3970, 'Coxilha', 23, 'RS'),
(3971, 'Crissiumal', 23, 'RS'),
(3972, 'Cristal', 23, 'RS'),
(3973, 'Cristal do Sul', 23, 'RS'),
(3974, 'Cruz Alta', 23, 'RS'),
(3975, 'Cruzaltense', 23, 'RS'),
(3976, 'Cruzeiro do Sul', 23, 'RS'),
(3977, 'David Canabarro', 23, 'RS'),
(3978, 'Derrubadas', 23, 'RS'),
(3979, 'Dezesseis de Novembro', 23, 'RS'),
(3980, 'Dilermando de Aguiar', 23, 'RS'),
(3981, 'Dois Irmãos', 23, 'RS'),
(3982, 'Dois Irmãos das Missões', 23, 'RS'),
(3983, 'Dois Lajeados', 23, 'RS'),
(3984, 'Dom Feliciano', 23, 'RS'),
(3985, 'Dom Pedrito', 23, 'RS'),
(3986, 'Dom Pedro de Alcântara', 23, 'RS'),
(3987, 'Dona Francisca', 23, 'RS'),
(3988, 'Doutor Maurício Cardoso', 23, 'RS'),
(3989, 'Doutor Ricardo', 23, 'RS'),
(3990, 'Eldorado do Sul', 23, 'RS'),
(3991, 'Encantado', 23, 'RS'),
(3992, 'Encruzilhada do Sul', 23, 'RS'),
(3993, 'Engenho Velho', 23, 'RS'),
(3994, 'Entre Rios do Sul', 23, 'RS'),
(3995, 'Entre-Ijuís', 23, 'RS'),
(3996, 'Erebango', 23, 'RS'),
(3997, 'Erechim', 23, 'RS'),
(3998, 'Ernestina', 23, 'RS'),
(3999, 'Erval Grande', 23, 'RS'),
(4000, 'Erval Seco', 23, 'RS'),
(4001, 'Esmeralda', 23, 'RS'),
(4002, 'Esperança do Sul', 23, 'RS'),
(4003, 'Espumoso', 23, 'RS'),
(4004, 'Estação', 23, 'RS'),
(4005, 'Estância Velha', 23, 'RS'),
(4006, 'Esteio', 23, 'RS'),
(4007, 'Estrela', 23, 'RS'),
(4008, 'Estrela Velha', 23, 'RS'),
(4009, 'Eugênio de Castro', 23, 'RS'),
(4010, 'Fagundes Varela', 23, 'RS'),
(4011, 'Farroupilha', 23, 'RS'),
(4012, 'Faxinal do Soturno', 23, 'RS'),
(4013, 'Faxinalzinho', 23, 'RS'),
(4014, 'Fazenda Vilanova', 23, 'RS'),
(4015, 'Feliz', 23, 'RS'),
(4016, 'Flores da Cunha', 23, 'RS'),
(4017, 'Floriano Peixoto', 23, 'RS'),
(4018, 'Fontoura Xavier', 23, 'RS'),
(4019, 'Formigueiro', 23, 'RS'),
(4020, 'Forquetinha', 23, 'RS'),
(4021, 'Fortaleza dos Valos', 23, 'RS'),
(4022, 'Frederico Westphalen', 23, 'RS'),
(4023, 'Garibaldi', 23, 'RS'),
(4024, 'Garruchos', 23, 'RS'),
(4025, 'Gaurama', 23, 'RS'),
(4026, 'General Câmara', 23, 'RS'),
(4027, 'Gentil', 23, 'RS'),
(4028, 'Getúlio Vargas', 23, 'RS'),
(4029, 'Giruá', 23, 'RS'),
(4030, 'Glorinha', 23, 'RS'),
(4031, 'Gramado', 23, 'RS'),
(4032, 'Gramado dos Loureiros', 23, 'RS'),
(4033, 'Gramado Xavier', 23, 'RS'),
(4034, 'Gravataí', 23, 'RS'),
(4035, 'Guabiju', 23, 'RS'),
(4036, 'Guaíba', 23, 'RS'),
(4037, 'Guaporé', 23, 'RS'),
(4038, 'Guarani das Missões', 23, 'RS'),
(4039, 'Harmonia', 23, 'RS'),
(4040, 'Herval', 23, 'RS'),
(4041, 'Herveiras', 23, 'RS'),
(4042, 'Horizontina', 23, 'RS'),
(4043, 'Hulha Negra', 23, 'RS'),
(4044, 'Humaitá', 23, 'RS'),
(4045, 'Ibarama', 23, 'RS'),
(4046, 'Ibiaçá', 23, 'RS'),
(4047, 'Ibiraiaras', 23, 'RS'),
(4048, 'Ibirapuitã', 23, 'RS'),
(4049, 'Ibirubá', 23, 'RS'),
(4050, 'Igrejinha', 23, 'RS'),
(4051, 'Ijuí', 23, 'RS'),
(4052, 'Ilópolis', 23, 'RS'),
(4053, 'Imbé', 23, 'RS'),
(4054, 'Imigrante', 23, 'RS'),
(4055, 'Independência', 23, 'RS'),
(4056, 'Inhacorá', 23, 'RS'),
(4057, 'Ipê', 23, 'RS'),
(4058, 'Ipiranga do Sul', 23, 'RS'),
(4059, 'Iraí', 23, 'RS'),
(4060, 'Itaara', 23, 'RS'),
(4061, 'Itacurubi', 23, 'RS'),
(4062, 'Itapuca', 23, 'RS'),
(4063, 'Itaqui', 23, 'RS'),
(4064, 'Itati', 23, 'RS'),
(4065, 'Itatiba do Sul', 23, 'RS'),
(4066, 'Ivorá', 23, 'RS'),
(4067, 'Ivoti', 23, 'RS'),
(4068, 'Jaboticaba', 23, 'RS'),
(4069, 'Jacuizinho', 23, 'RS'),
(4070, 'Jacutinga', 23, 'RS'),
(4071, 'Jaguarão', 23, 'RS'),
(4072, 'Jaguari', 23, 'RS'),
(4073, 'Jaquirana', 23, 'RS'),
(4074, 'Jari', 23, 'RS'),
(4075, 'Jóia', 23, 'RS'),
(4076, 'Júlio de Castilhos', 23, 'RS'),
(4077, 'Lagoa Bonita do Sul', 23, 'RS'),
(4078, 'Lagoa dos Três Cantos', 23, 'RS'),
(4079, 'Lagoa Vermelha', 23, 'RS'),
(4080, 'Lagoão', 23, 'RS'),
(4081, 'Lajeado', 23, 'RS'),
(4082, 'Lajeado do Bugre', 23, 'RS'),
(4083, 'Lavras do Sul', 23, 'RS'),
(4084, 'Liberato Salzano', 23, 'RS'),
(4085, 'Lindolfo Collor', 23, 'RS'),
(4086, 'Linha Nova', 23, 'RS'),
(4087, 'Maçambara', 23, 'RS'),
(4088, 'Machadinho', 23, 'RS'),
(4089, 'Mampituba', 23, 'RS'),
(4090, 'Manoel Viana', 23, 'RS'),
(4091, 'Maquiné', 23, 'RS'),
(4092, 'Maratá', 23, 'RS'),
(4093, 'Marau', 23, 'RS'),
(4094, 'Marcelino Ramos', 23, 'RS'),
(4095, 'Mariana Pimentel', 23, 'RS'),
(4096, 'Mariano Moro', 23, 'RS'),
(4097, 'Marques de Souza', 23, 'RS'),
(4098, 'Mata', 23, 'RS'),
(4099, 'Mato Castelhano', 23, 'RS'),
(4100, 'Mato Leitão', 23, 'RS'),
(4101, 'Mato Queimado', 23, 'RS'),
(4102, 'Maximiliano de Almeida', 23, 'RS'),
(4103, 'Minas do Leão', 23, 'RS'),
(4104, 'Miraguaí', 23, 'RS'),
(4105, 'Montauri', 23, 'RS'),
(4106, 'Monte Alegre dos Campos', 23, 'RS'),
(4107, 'Monte Belo do Sul', 23, 'RS'),
(4108, 'Montenegro', 23, 'RS'),
(4109, 'Mormaço', 23, 'RS'),
(4110, 'Morrinhos do Sul', 23, 'RS'),
(4111, 'Morro Redondo', 23, 'RS'),
(4112, 'Morro Reuter', 23, 'RS'),
(4113, 'Mostardas', 23, 'RS'),
(4114, 'Muçum', 23, 'RS'),
(4115, 'Muitos Capões', 23, 'RS'),
(4116, 'Muliterno', 23, 'RS'),
(4117, 'Não-Me-Toque', 23, 'RS'),
(4118, 'Nicolau Vergueiro', 23, 'RS'),
(4119, 'Nonoai', 23, 'RS'),
(4120, 'Nova Alvorada', 23, 'RS'),
(4121, 'Nova Araçá', 23, 'RS'),
(4122, 'Nova Bassano', 23, 'RS'),
(4123, 'Nova Boa Vista', 23, 'RS'),
(4124, 'Nova Bréscia', 23, 'RS'),
(4125, 'Nova Candelária', 23, 'RS'),
(4126, 'Nova Esperança do Sul', 23, 'RS'),
(4127, 'Nova Hartz', 23, 'RS'),
(4128, 'Nova Pádua', 23, 'RS'),
(4129, 'Nova Palma', 23, 'RS'),
(4130, 'Nova Petrópolis', 23, 'RS'),
(4131, 'Nova Prata', 23, 'RS'),
(4132, 'Nova Ramada', 23, 'RS'),
(4133, 'Nova Roma do Sul', 23, 'RS'),
(4134, 'Nova Santa Rita', 23, 'RS'),
(4135, 'Novo Barreiro', 23, 'RS'),
(4136, 'Novo Cabrais', 23, 'RS'),
(4137, 'Novo Hamburgo', 23, 'RS'),
(4138, 'Novo Machado', 23, 'RS'),
(4139, 'Novo Tiradentes', 23, 'RS'),
(4140, 'Novo Xingu', 23, 'RS'),
(4141, 'Osório', 23, 'RS'),
(4142, 'Paim Filho', 23, 'RS'),
(4143, 'Palmares do Sul', 23, 'RS'),
(4144, 'Palmeira das Missões', 23, 'RS'),
(4145, 'Palmitinho', 23, 'RS'),
(4146, 'Panambi', 23, 'RS'),
(4147, 'Pantano Grande', 23, 'RS'),
(4148, 'Paraí', 23, 'RS'),
(4149, 'Paraíso do Sul', 23, 'RS'),
(4150, 'Pareci Novo', 23, 'RS'),
(4151, 'Parobé', 23, 'RS'),
(4152, 'Passa Sete', 23, 'RS'),
(4153, 'Passo do Sobrado', 23, 'RS'),
(4154, 'Passo Fundo', 23, 'RS'),
(4155, 'Paulo Bento', 23, 'RS'),
(4156, 'Paverama', 23, 'RS'),
(4157, 'Pedras Altas', 23, 'RS'),
(4158, 'Pedro Osório', 23, 'RS'),
(4159, 'Pejuçara', 23, 'RS'),
(4160, 'Pelotas', 23, 'RS'),
(4161, 'Picada Café', 23, 'RS'),
(4162, 'Pinhal', 23, 'RS'),
(4163, 'Pinhal da Serra', 23, 'RS'),
(4164, 'Pinhal Grande', 23, 'RS'),
(4165, 'Pinheirinho do Vale', 23, 'RS'),
(4166, 'Pinheiro Machado', 23, 'RS'),
(4167, 'Pirapó', 23, 'RS'),
(4168, 'Piratini', 23, 'RS'),
(4169, 'Planalto', 23, 'RS'),
(4170, 'Poço das Antas', 23, 'RS'),
(4171, 'Pontão', 23, 'RS'),
(4172, 'Ponte Preta', 23, 'RS'),
(4173, 'Portão', 23, 'RS'),
(4174, 'Porto Alegre', 23, 'RS'),
(4175, 'Porto Lucena', 23, 'RS'),
(4176, 'Porto Mauá', 23, 'RS'),
(4177, 'Porto Vera Cruz', 23, 'RS'),
(4178, 'Porto Xavier', 23, 'RS'),
(4179, 'Pouso Novo', 23, 'RS'),
(4180, 'Presidente Lucena', 23, 'RS'),
(4181, 'Progresso', 23, 'RS'),
(4182, 'Protásio Alves', 23, 'RS'),
(4183, 'Putinga', 23, 'RS'),
(4184, 'Quaraí', 23, 'RS'),
(4185, 'Quatro Irmãos', 23, 'RS'),
(4186, 'Quevedos', 23, 'RS'),
(4187, 'Quinze de Novembro', 23, 'RS'),
(4188, 'Redentora', 23, 'RS'),
(4189, 'Relvado', 23, 'RS'),
(4190, 'Restinga Seca', 23, 'RS'),
(4191, 'Rio dos Índios', 23, 'RS'),
(4192, 'Rio Grande', 23, 'RS'),
(4193, 'Rio Pardo', 23, 'RS'),
(4194, 'Riozinho', 23, 'RS'),
(4195, 'Roca Sales', 23, 'RS'),
(4196, 'Rodeio Bonito', 23, 'RS'),
(4197, 'Rolador', 23, 'RS'),
(4198, 'Rolante', 23, 'RS'),
(4199, 'Ronda Alta', 23, 'RS'),
(4200, 'Rondinha', 23, 'RS'),
(4201, 'Roque Gonzales', 23, 'RS'),
(4202, 'Rosário do Sul', 23, 'RS'),
(4203, 'Sagrada Família', 23, 'RS'),
(4204, 'Saldanha Marinho', 23, 'RS'),
(4205, 'Salto do Jacuí', 23, 'RS'),
(4206, 'Salvador das Missões', 23, 'RS'),
(4207, 'Salvador do Sul', 23, 'RS'),
(4208, 'Sananduva', 23, 'RS'),
(4209, 'Santa Bárbara do Sul', 23, 'RS'),
(4210, 'Santa Cecília do Sul', 23, 'RS'),
(4211, 'Santa Clara do Sul', 23, 'RS'),
(4212, 'Santa Cruz do Sul', 23, 'RS'),
(4213, 'Santa Margarida do Sul', 23, 'RS'),
(4214, 'Santa Maria', 23, 'RS'),
(4215, 'Santa Maria do Herval', 23, 'RS'),
(4216, 'Santa Rosa', 23, 'RS'),
(4217, 'Santa Tereza', 23, 'RS'),
(4218, 'Santa Vitória do Palmar', 23, 'RS'),
(4219, 'Santana da Boa Vista', 23, 'RS'),
(4220, 'Santana do Livramento', 23, 'RS'),
(4221, 'Santiago', 23, 'RS'),
(4222, 'Santo Ângelo', 23, 'RS'),
(4223, 'Santo Antônio da Patrulha', 23, 'RS'),
(4224, 'Santo Antônio das Missões', 23, 'RS'),
(4225, 'Santo Antônio do Palma', 23, 'RS'),
(4226, 'Santo Antônio do Planalto', 23, 'RS'),
(4227, 'Santo Augusto', 23, 'RS'),
(4228, 'Santo Cristo', 23, 'RS'),
(4229, 'Santo Expedito do Sul', 23, 'RS'),
(4230, 'São Borja', 23, 'RS'),
(4231, 'São Domingos do Sul', 23, 'RS'),
(4232, 'São Francisco de Assis', 23, 'RS'),
(4233, 'São Francisco de Paula', 23, 'RS'),
(4234, 'São Gabriel', 23, 'RS'),
(4235, 'São Jerônimo', 23, 'RS'),
(4236, 'São João da Urtiga', 23, 'RS'),
(4237, 'São João do Polêsine', 23, 'RS'),
(4238, 'São Jorge', 23, 'RS'),
(4239, 'São José das Missões', 23, 'RS'),
(4240, 'São José do Herval', 23, 'RS'),
(4241, 'São José do Hortêncio', 23, 'RS'),
(4242, 'São José do Inhacorá', 23, 'RS'),
(4243, 'São José do Norte', 23, 'RS'),
(4244, 'São José do Ouro', 23, 'RS'),
(4245, 'São José do Sul', 23, 'RS'),
(4246, 'São José dos Ausentes', 23, 'RS'),
(4247, 'São Leopoldo', 23, 'RS'),
(4248, 'São Lourenço do Sul', 23, 'RS'),
(4249, 'São Luiz Gonzaga', 23, 'RS'),
(4250, 'São Marcos', 23, 'RS'),
(4251, 'São Martinho', 23, 'RS'),
(4252, 'São Martinho da Serra', 23, 'RS'),
(4253, 'São Miguel das Missões', 23, 'RS'),
(4254, 'São Nicolau', 23, 'RS'),
(4255, 'São Paulo das Missões', 23, 'RS'),
(4256, 'São Pedro da Serra', 23, 'RS'),
(4257, 'São Pedro das Missões', 23, 'RS'),
(4258, 'São Pedro do Butiá', 23, 'RS'),
(4259, 'São Pedro do Sul', 23, 'RS'),
(4260, 'São Sebastião do Caí', 23, 'RS'),
(4261, 'São Sepé', 23, 'RS'),
(4262, 'São Valentim', 23, 'RS'),
(4263, 'São Valentim do Sul', 23, 'RS'),
(4264, 'São Valério do Sul', 23, 'RS'),
(4265, 'São Vendelino', 23, 'RS'),
(4266, 'São Vicente do Sul', 23, 'RS'),
(4267, 'Sapiranga', 23, 'RS'),
(4268, 'Sapucaia do Sul', 23, 'RS'),
(4269, 'Sarandi', 23, 'RS'),
(4270, 'Seberi', 23, 'RS'),
(4271, 'Sede Nova', 23, 'RS'),
(4272, 'Segredo', 23, 'RS'),
(4273, 'Selbach', 23, 'RS'),
(4274, 'Senador Salgado Filho', 23, 'RS'),
(4275, 'Sentinela do Sul', 23, 'RS'),
(4276, 'Serafina Corrêa', 23, 'RS'),
(4277, 'Sério', 23, 'RS'),
(4278, 'Sertão', 23, 'RS'),
(4279, 'Sertão Santana', 23, 'RS'),
(4280, 'Sete de Setembro', 23, 'RS'),
(4281, 'Severiano de Almeida', 23, 'RS'),
(4282, 'Silveira Martins', 23, 'RS'),
(4283, 'Sinimbu', 23, 'RS'),
(4284, 'Sobradinho', 23, 'RS'),
(4285, 'Soledade', 23, 'RS'),
(4286, 'Tabaí', 23, 'RS'),
(4287, 'Tapejara', 23, 'RS'),
(4288, 'Tapera', 23, 'RS'),
(4289, 'Tapes', 23, 'RS'),
(4290, 'Taquara', 23, 'RS'),
(4291, 'Taquari', 23, 'RS'),
(4292, 'Taquaruçu do Sul', 23, 'RS'),
(4293, 'Tavares', 23, 'RS'),
(4294, 'Tenente Portela', 23, 'RS'),
(4295, 'Terra de Areia', 23, 'RS'),
(4296, 'Teutônia', 23, 'RS'),
(4297, 'Tio Hugo', 23, 'RS'),
(4298, 'Tiradentes do Sul', 23, 'RS'),
(4299, 'Toropi', 23, 'RS'),
(4300, 'Torres', 23, 'RS'),
(4301, 'Tramandaí', 23, 'RS'),
(4302, 'Travesseiro', 23, 'RS'),
(4303, 'Três Arroios', 23, 'RS'),
(4304, 'Três Cachoeiras', 23, 'RS'),
(4305, 'Três Coroas', 23, 'RS'),
(4306, 'Três de Maio', 23, 'RS'),
(4307, 'Três Forquilhas', 23, 'RS'),
(4308, 'Três Palmeiras', 23, 'RS'),
(4309, 'Três Passos', 23, 'RS'),
(4310, 'Trindade do Sul', 23, 'RS'),
(4311, 'Triunfo', 23, 'RS'),
(4312, 'Tucunduva', 23, 'RS'),
(4313, 'Tunas', 23, 'RS'),
(4314, 'Tupanci do Sul', 23, 'RS'),
(4315, 'Tupanciretã', 23, 'RS'),
(4316, 'Tupandi', 23, 'RS'),
(4317, 'Tuparendi', 23, 'RS'),
(4318, 'Turuçu', 23, 'RS'),
(4319, 'Ubiretama', 23, 'RS'),
(4320, 'União da Serra', 23, 'RS'),
(4321, 'Unistalda', 23, 'RS'),
(4322, 'Uruguaiana', 23, 'RS'),
(4323, 'Vacaria', 23, 'RS'),
(4324, 'Vale do Sol', 23, 'RS'),
(4325, 'Vale Real', 23, 'RS'),
(4326, 'Vale Verde', 23, 'RS'),
(4327, 'Vanini', 23, 'RS'),
(4328, 'Venâncio Aires', 23, 'RS'),
(4329, 'Vera Cruz', 23, 'RS'),
(4330, 'Veranópolis', 23, 'RS'),
(4331, 'Vespasiano Correa', 23, 'RS'),
(4332, 'Viadutos', 23, 'RS'),
(4333, 'Viamão', 23, 'RS'),
(4334, 'Vicente Dutra', 23, 'RS'),
(4335, 'Victor Graeff', 23, 'RS'),
(4336, 'Vila Flores', 23, 'RS'),
(4337, 'Vila Lângaro', 23, 'RS'),
(4338, 'Vila Maria', 23, 'RS'),
(4339, 'Vila Nova do Sul', 23, 'RS'),
(4340, 'Vista Alegre', 23, 'RS'),
(4341, 'Vista Alegre do Prata', 23, 'RS'),
(4342, 'Vista Gaúcha', 23, 'RS'),
(4343, 'Vitória das Missões', 23, 'RS'),
(4344, 'Westfália', 23, 'RS'),
(4345, 'Xangri-lá', 23, 'RS'),
(4346, 'Alta Floresta d`Oeste', 21, 'RO'),
(4347, 'Alto Alegre dos Parecis', 21, 'RO'),
(4348, 'Alto Paraíso', 21, 'RO'),
(4349, 'Alvorada d`Oeste', 21, 'RO'),
(4350, 'Ariquemes', 21, 'RO'),
(4351, 'Buritis', 21, 'RO'),
(4352, 'Cabixi', 21, 'RO'),
(4353, 'Cacaulândia', 21, 'RO'),
(4354, 'Cacoal', 21, 'RO'),
(4355, 'Campo Novo de Rondônia', 21, 'RO'),
(4356, 'Candeias do Jamari', 21, 'RO'),
(4357, 'Castanheiras', 21, 'RO'),
(4358, 'Cerejeiras', 21, 'RO'),
(4359, 'Chupinguaia', 21, 'RO'),
(4360, 'Colorado do Oeste', 21, 'RO'),
(4361, 'Corumbiara', 21, 'RO'),
(4362, 'Costa Marques', 21, 'RO'),
(4363, 'Cujubim', 21, 'RO'),
(4364, 'Espigão d`Oeste', 21, 'RO'),
(4365, 'Governador Jorge Teixeira', 21, 'RO'),
(4366, 'Guajará-Mirim', 21, 'RO'),
(4367, 'Itapuã do Oeste', 21, 'RO'),
(4368, 'Jaru', 21, 'RO'),
(4369, 'Ji-Paraná', 21, 'RO'),
(4370, 'Machadinho d`Oeste', 21, 'RO'),
(4371, 'Ministro Andreazza', 21, 'RO'),
(4372, 'Mirante da Serra', 21, 'RO'),
(4373, 'Monte Negro', 21, 'RO'),
(4374, 'Nova Brasilândia d`Oeste', 21, 'RO'),
(4375, 'Nova Mamoré', 21, 'RO'),
(4376, 'Nova União', 21, 'RO'),
(4377, 'Novo Horizonte do Oeste', 21, 'RO'),
(4378, 'Ouro Preto do Oeste', 21, 'RO'),
(4379, 'Parecis', 21, 'RO'),
(4380, 'Pimenta Bueno', 21, 'RO'),
(4381, 'Pimenteiras do Oeste', 21, 'RO'),
(4382, 'Porto Velho', 21, 'RO'),
(4383, 'Presidente Médici', 21, 'RO'),
(4384, 'Primavera de Rondônia', 21, 'RO'),
(4385, 'Rio Crespo', 21, 'RO'),
(4386, 'Rolim de Moura', 21, 'RO'),
(4387, 'Santa Luzia d`Oeste', 21, 'RO'),
(4388, 'São Felipe d`Oeste', 21, 'RO'),
(4389, 'São Francisco do Guaporé', 21, 'RO'),
(4390, 'São Miguel do Guaporé', 21, 'RO'),
(4391, 'Seringueiras', 21, 'RO'),
(4392, 'Teixeirópolis', 21, 'RO'),
(4393, 'Theobroma', 21, 'RO'),
(4394, 'Urupá', 21, 'RO'),
(4395, 'Vale do Anari', 21, 'RO'),
(4396, 'Vale do Paraíso', 21, 'RO'),
(4397, 'Vilhena', 21, 'RO'),
(4398, 'Alto Alegre', 22, 'RR'),
(4399, 'Amajari', 22, 'RR'),
(4400, 'Boa Vista', 22, 'RR'),
(4401, 'Bonfim', 22, 'RR'),
(4402, 'Cantá', 22, 'RR'),
(4403, 'Caracaraí', 22, 'RR'),
(4404, 'Caroebe', 22, 'RR'),
(4405, 'Iracema', 22, 'RR'),
(4406, 'Mucajaí', 22, 'RR'),
(4407, 'Normandia', 22, 'RR'),
(4408, 'Pacaraima', 22, 'RR'),
(4409, 'Rorainópolis', 22, 'RR'),
(4410, 'São João da Baliza', 22, 'RR'),
(4411, 'São Luiz', 22, 'RR'),
(4412, 'Uiramutã', 22, 'RR'),
(4413, 'Abdon Batista', 24, 'SC'),
(4414, 'Abelardo Luz', 24, 'SC'),
(4415, 'Agrolândia', 24, 'SC'),
(4416, 'Agronômica', 24, 'SC'),
(4417, 'Água Doce', 24, 'SC'),
(4418, 'Águas de Chapecó', 24, 'SC'),
(4419, 'Águas Frias', 24, 'SC'),
(4420, 'Águas Mornas', 24, 'SC'),
(4421, 'Alfredo Wagner', 24, 'SC'),
(4422, 'Alto Bela Vista', 24, 'SC'),
(4423, 'Anchieta', 24, 'SC'),
(4424, 'Angelina', 24, 'SC'),
(4425, 'Anita Garibaldi', 24, 'SC'),
(4426, 'Anitápolis', 24, 'SC'),
(4427, 'Antônio Carlos', 24, 'SC'),
(4428, 'Apiúna', 24, 'SC'),
(4429, 'Arabutã', 24, 'SC'),
(4430, 'Araquari', 24, 'SC'),
(4431, 'Araranguá', 24, 'SC'),
(4432, 'Armazém', 24, 'SC'),
(4433, 'Arroio Trinta', 24, 'SC'),
(4434, 'Arvoredo', 24, 'SC'),
(4435, 'Ascurra', 24, 'SC'),
(4436, 'Atalanta', 24, 'SC'),
(4437, 'Aurora', 24, 'SC'),
(4438, 'Balneário Arroio do Silva', 24, 'SC'),
(4439, 'Balneário Barra do Sul', 24, 'SC'),
(4440, 'Balneário Camboriú', 24, 'SC'),
(4441, 'Balneário Gaivota', 24, 'SC'),
(4442, 'Bandeirante', 24, 'SC'),
(4443, 'Barra Bonita', 24, 'SC'),
(4444, 'Barra Velha', 24, 'SC'),
(4445, 'Bela Vista do Toldo', 24, 'SC'),
(4446, 'Belmonte', 24, 'SC'),
(4447, 'Benedito Novo', 24, 'SC'),
(4448, 'Biguaçu', 24, 'SC'),
(4449, 'Blumenau', 24, 'SC'),
(4450, 'Bocaina do Sul', 24, 'SC'),
(4451, 'Bom Jardim da Serra', 24, 'SC'),
(4452, 'Bom Jesus', 24, 'SC'),
(4453, 'Bom Jesus do Oeste', 24, 'SC'),
(4454, 'Bom Retiro', 24, 'SC'),
(4455, 'Bombinhas', 24, 'SC'),
(4456, 'Botuverá', 24, 'SC'),
(4457, 'Braço do Norte', 24, 'SC'),
(4458, 'Braço do Trombudo', 24, 'SC'),
(4459, 'Brunópolis', 24, 'SC'),
(4460, 'Brusque', 24, 'SC'),
(4461, 'Caçador', 24, 'SC'),
(4462, 'Caibi', 24, 'SC'),
(4463, 'Calmon', 24, 'SC'),
(4464, 'Camboriú', 24, 'SC'),
(4465, 'Campo Alegre', 24, 'SC'),
(4466, 'Campo Belo do Sul', 24, 'SC'),
(4467, 'Campo Erê', 24, 'SC'),
(4468, 'Campos Novos', 24, 'SC'),
(4469, 'Canelinha', 24, 'SC'),
(4470, 'Canoinhas', 24, 'SC'),
(4471, 'Capão Alto', 24, 'SC'),
(4472, 'Capinzal', 24, 'SC'),
(4473, 'Capivari de Baixo', 24, 'SC'),
(4474, 'Catanduvas', 24, 'SC'),
(4475, 'Caxambu do Sul', 24, 'SC'),
(4476, 'Celso Ramos', 24, 'SC'),
(4477, 'Cerro Negro', 24, 'SC'),
(4478, 'Chapadão do Lageado', 24, 'SC'),
(4479, 'Chapecó', 24, 'SC'),
(4480, 'Cocal do Sul', 24, 'SC'),
(4481, 'Concórdia', 24, 'SC'),
(4482, 'Cordilheira Alta', 24, 'SC'),
(4483, 'Coronel Freitas', 24, 'SC'),
(4484, 'Coronel Martins', 24, 'SC'),
(4485, 'Correia Pinto', 24, 'SC'),
(4486, 'Corupá', 24, 'SC'),
(4487, 'Criciúma', 24, 'SC'),
(4488, 'Cunha Porã', 24, 'SC'),
(4489, 'Cunhataí', 24, 'SC'),
(4490, 'Curitibanos', 24, 'SC'),
(4491, 'Descanso', 24, 'SC'),
(4492, 'Dionísio Cerqueira', 24, 'SC'),
(4493, 'Dona Emma', 24, 'SC'),
(4494, 'Doutor Pedrinho', 24, 'SC'),
(4495, 'Entre Rios', 24, 'SC'),
(4496, 'Ermo', 24, 'SC'),
(4497, 'Erval Velho', 24, 'SC'),
(4498, 'Faxinal dos Guedes', 24, 'SC'),
(4499, 'Flor do Sertão', 24, 'SC'),
(4500, 'Florianópolis', 24, 'SC'),
(4501, 'Formosa do Sul', 24, 'SC'),
(4502, 'Forquilhinha', 24, 'SC'),
(4503, 'Fraiburgo', 24, 'SC'),
(4504, 'Frei Rogério', 24, 'SC'),
(4505, 'Galvão', 24, 'SC'),
(4506, 'Garopaba', 24, 'SC'),
(4507, 'Garuva', 24, 'SC'),
(4508, 'Gaspar', 24, 'SC'),
(4509, 'Governador Celso Ramos', 24, 'SC'),
(4510, 'Grão Pará', 24, 'SC'),
(4511, 'Gravatal', 24, 'SC'),
(4512, 'Guabiruba', 24, 'SC'),
(4513, 'Guaraciaba', 24, 'SC'),
(4514, 'Guaramirim', 24, 'SC'),
(4515, 'Guarujá do Sul', 24, 'SC'),
(4516, 'Guatambú', 24, 'SC'),
(4517, 'Herval d`Oeste', 24, 'SC'),
(4518, 'Ibiam', 24, 'SC'),
(4519, 'Ibicaré', 24, 'SC'),
(4520, 'Ibirama', 24, 'SC'),
(4521, 'Içara', 24, 'SC'),
(4522, 'Ilhota', 24, 'SC'),
(4523, 'Imaruí', 24, 'SC'),
(4524, 'Imbituba', 24, 'SC'),
(4525, 'Imbuia', 24, 'SC'),
(4526, 'Indaial', 24, 'SC'),
(4527, 'Iomerê', 24, 'SC'),
(4528, 'Ipira', 24, 'SC'),
(4529, 'Iporã do Oeste', 24, 'SC'),
(4530, 'Ipuaçu', 24, 'SC'),
(4531, 'Ipumirim', 24, 'SC'),
(4532, 'Iraceminha', 24, 'SC'),
(4533, 'Irani', 24, 'SC'),
(4534, 'Irati', 24, 'SC'),
(4535, 'Irineópolis', 24, 'SC'),
(4536, 'Itá', 24, 'SC'),
(4537, 'Itaiópolis', 24, 'SC'),
(4538, 'Itajaí', 24, 'SC'),
(4539, 'Itapema', 24, 'SC'),
(4540, 'Itapiranga', 24, 'SC'),
(4541, 'Itapoá', 24, 'SC'),
(4542, 'Ituporanga', 24, 'SC'),
(4543, 'Jaborá', 24, 'SC'),
(4544, 'Jacinto Machado', 24, 'SC'),
(4545, 'Jaguaruna', 24, 'SC'),
(4546, 'Jaraguá do Sul', 24, 'SC'),
(4547, 'Jardinópolis', 24, 'SC'),
(4548, 'Joaçaba', 24, 'SC'),
(4549, 'Joinville', 24, 'SC'),
(4550, 'José Boiteux', 24, 'SC'),
(4551, 'Jupiá', 24, 'SC'),
(4552, 'Lacerdópolis', 24, 'SC'),
(4553, 'Lages', 24, 'SC'),
(4554, 'Laguna', 24, 'SC'),
(4555, 'Lajeado Grande', 24, 'SC'),
(4556, 'Laurentino', 24, 'SC'),
(4557, 'Lauro Muller', 24, 'SC'),
(4558, 'Lebon Régis', 24, 'SC'),
(4559, 'Leoberto Leal', 24, 'SC'),
(4560, 'Lindóia do Sul', 24, 'SC'),
(4561, 'Lontras', 24, 'SC'),
(4562, 'Luiz Alves', 24, 'SC'),
(4563, 'Luzerna', 24, 'SC'),
(4564, 'Macieira', 24, 'SC'),
(4565, 'Mafra', 24, 'SC'),
(4566, 'Major Gercino', 24, 'SC'),
(4567, 'Major Vieira', 24, 'SC'),
(4568, 'Maracajá', 24, 'SC'),
(4569, 'Maravilha', 24, 'SC'),
(4570, 'Marema', 24, 'SC'),
(4571, 'Massaranduba', 24, 'SC'),
(4572, 'Matos Costa', 24, 'SC'),
(4573, 'Meleiro', 24, 'SC'),
(4574, 'Mirim Doce', 24, 'SC'),
(4575, 'Modelo', 24, 'SC'),
(4576, 'Mondaí', 24, 'SC'),
(4577, 'Monte Carlo', 24, 'SC'),
(4578, 'Monte Castelo', 24, 'SC'),
(4579, 'Morro da Fumaça', 24, 'SC'),
(4580, 'Morro Grande', 24, 'SC'),
(4581, 'Navegantes', 24, 'SC'),
(4582, 'Nova Erechim', 24, 'SC'),
(4583, 'Nova Itaberaba', 24, 'SC'),
(4584, 'Nova Trento', 24, 'SC'),
(4585, 'Nova Veneza', 24, 'SC'),
(4586, 'Novo Horizonte', 24, 'SC'),
(4587, 'Orleans', 24, 'SC'),
(4588, 'Otacílio Costa', 24, 'SC'),
(4589, 'Ouro', 24, 'SC'),
(4590, 'Ouro Verde', 24, 'SC'),
(4591, 'Paial', 24, 'SC'),
(4592, 'Painel', 24, 'SC'),
(4593, 'Palhoça', 24, 'SC'),
(4594, 'Palma Sola', 24, 'SC'),
(4595, 'Palmeira', 24, 'SC'),
(4596, 'Palmitos', 24, 'SC'),
(4597, 'Papanduva', 24, 'SC'),
(4598, 'Paraíso', 24, 'SC'),
(4599, 'Passo de Torres', 24, 'SC'),
(4600, 'Passos Maia', 24, 'SC'),
(4601, 'Paulo Lopes', 24, 'SC'),
(4602, 'Pedras Grandes', 24, 'SC'),
(4603, 'Penha', 24, 'SC'),
(4604, 'Peritiba', 24, 'SC'),
(4605, 'Petrolândia', 24, 'SC'),
(4606, 'Piçarras', 24, 'SC'),
(4607, 'Pinhalzinho', 24, 'SC'),
(4608, 'Pinheiro Preto', 24, 'SC'),
(4609, 'Piratuba', 24, 'SC'),
(4610, 'Planalto Alegre', 24, 'SC'),
(4611, 'Pomerode', 24, 'SC'),
(4612, 'Ponte Alta', 24, 'SC'),
(4613, 'Ponte Alta do Norte', 24, 'SC'),
(4614, 'Ponte Serrada', 24, 'SC'),
(4615, 'Porto Belo', 24, 'SC'),
(4616, 'Porto União', 24, 'SC'),
(4617, 'Pouso Redondo', 24, 'SC'),
(4618, 'Praia Grande', 24, 'SC'),
(4619, 'Presidente Castelo Branco', 24, 'SC'),
(4620, 'Presidente Getúlio', 24, 'SC'),
(4621, 'Presidente Nereu', 24, 'SC'),
(4622, 'Princesa', 24, 'SC'),
(4623, 'Quilombo', 24, 'SC'),
(4624, 'Rancho Queimado', 24, 'SC'),
(4625, 'Rio das Antas', 24, 'SC'),
(4626, 'Rio do Campo', 24, 'SC'),
(4627, 'Rio do Oeste', 24, 'SC'),
(4628, 'Rio do Sul', 24, 'SC'),
(4629, 'Rio dos Cedros', 24, 'SC'),
(4630, 'Rio Fortuna', 24, 'SC'),
(4631, 'Rio Negrinho', 24, 'SC'),
(4632, 'Rio Rufino', 24, 'SC'),
(4633, 'Riqueza', 24, 'SC'),
(4634, 'Rodeio', 24, 'SC'),
(4635, 'Romelândia', 24, 'SC'),
(4636, 'Salete', 24, 'SC'),
(4637, 'Saltinho', 24, 'SC'),
(4638, 'Salto Veloso', 24, 'SC'),
(4639, 'Sangão', 24, 'SC'),
(4640, 'Santa Cecília', 24, 'SC'),
(4641, 'Santa Helena', 24, 'SC'),
(4642, 'Santa Rosa de Lima', 24, 'SC'),
(4643, 'Santa Rosa do Sul', 24, 'SC'),
(4644, 'Santa Terezinha', 24, 'SC'),
(4645, 'Santa Terezinha do Progresso', 24, 'SC'),
(4646, 'Santiago do Sul', 24, 'SC'),
(4647, 'Santo Amaro da Imperatriz', 24, 'SC'),
(4648, 'São Bento do Sul', 24, 'SC'),
(4649, 'São Bernardino', 24, 'SC'),
(4650, 'São Bonifácio', 24, 'SC'),
(4651, 'São Carlos', 24, 'SC'),
(4652, 'São Cristovão do Sul', 24, 'SC'),
(4653, 'São Domingos', 24, 'SC'),
(4654, 'São Francisco do Sul', 24, 'SC'),
(4655, 'São João Batista', 24, 'SC'),
(4656, 'São João do Itaperiú', 24, 'SC'),
(4657, 'São João do Oeste', 24, 'SC'),
(4658, 'São João do Sul', 24, 'SC'),
(4659, 'São Joaquim', 24, 'SC'),
(4660, 'São José', 24, 'SC'),
(4661, 'São José do Cedro', 24, 'SC'),
(4662, 'São José do Cerrito', 24, 'SC'),
(4663, 'São Lourenço do Oeste', 24, 'SC'),
(4664, 'São Ludgero', 24, 'SC'),
(4665, 'São Martinho', 24, 'SC'),
(4666, 'São Miguel da Boa Vista', 24, 'SC'),
(4667, 'São Miguel do Oeste', 24, 'SC'),
(4668, 'São Pedro de Alcântara', 24, 'SC'),
(4669, 'Saudades', 24, 'SC'),
(4670, 'Schroeder', 24, 'SC'),
(4671, 'Seara', 24, 'SC'),
(4672, 'Serra Alta', 24, 'SC'),
(4673, 'Siderópolis', 24, 'SC'),
(4674, 'Sombrio', 24, 'SC'),
(4675, 'Sul Brasil', 24, 'SC'),
(4676, 'Taió', 24, 'SC'),
(4677, 'Tangará', 24, 'SC'),
(4678, 'Tigrinhos', 24, 'SC'),
(4679, 'Tijucas', 24, 'SC'),
(4680, 'Timbé do Sul', 24, 'SC'),
(4681, 'Timbó', 24, 'SC'),
(4682, 'Timbó Grande', 24, 'SC'),
(4683, 'Três Barras', 24, 'SC'),
(4684, 'Treviso', 24, 'SC'),
(4685, 'Treze de Maio', 24, 'SC'),
(4686, 'Treze Tílias', 24, 'SC'),
(4687, 'Trombudo Central', 24, 'SC'),
(4688, 'Tubarão', 24, 'SC'),
(4689, 'Tunápolis', 24, 'SC'),
(4690, 'Turvo', 24, 'SC'),
(4691, 'União do Oeste', 24, 'SC'),
(4692, 'Urubici', 24, 'SC'),
(4693, 'Urupema', 24, 'SC'),
(4694, 'Urussanga', 24, 'SC'),
(4695, 'Vargeão', 24, 'SC'),
(4696, 'Vargem', 24, 'SC'),
(4697, 'Vargem Bonita', 24, 'SC'),
(4698, 'Vidal Ramos', 24, 'SC'),
(4699, 'Videira', 24, 'SC'),
(4700, 'Vitor Meireles', 24, 'SC'),
(4701, 'Witmarsum', 24, 'SC'),
(4702, 'Xanxerê', 24, 'SC'),
(4703, 'Xavantina', 24, 'SC'),
(4704, 'Xaxim', 24, 'SC'),
(4705, 'Zortéa', 24, 'SC'),
(4706, 'Adamantina', 26, 'SP'),
(4707, 'Adolfo', 26, 'SP'),
(4708, 'Aguaí', 26, 'SP'),
(4709, 'Águas da Prata', 26, 'SP'),
(4710, 'Águas de Lindóia', 26, 'SP'),
(4711, 'Águas de Santa Bárbara', 26, 'SP'),
(4712, 'Águas de São Pedro', 26, 'SP'),
(4713, 'Agudos', 26, 'SP'),
(4714, 'Alambari', 26, 'SP'),
(4715, 'Alfredo Marcondes', 26, 'SP'),
(4716, 'Altair', 26, 'SP'),
(4717, 'Altinópolis', 26, 'SP'),
(4718, 'Alto Alegre', 26, 'SP'),
(4719, 'Alumínio', 26, 'SP'),
(4720, 'Álvares Florence', 26, 'SP'),
(4721, 'Álvares Machado', 26, 'SP'),
(4722, 'Álvaro de Carvalho', 26, 'SP'),
(4723, 'Alvinlândia', 26, 'SP'),
(4724, 'Americana', 26, 'SP'),
(4725, 'Américo Brasiliense', 26, 'SP'),
(4726, 'Américo de Campos', 26, 'SP'),
(4727, 'Amparo', 26, 'SP'),
(4728, 'Analândia', 26, 'SP'),
(4729, 'Andradina', 26, 'SP'),
(4730, 'Angatuba', 26, 'SP'),
(4731, 'Anhembi', 26, 'SP'),
(4732, 'Anhumas', 26, 'SP'),
(4733, 'Aparecida', 26, 'SP'),
(4734, 'Aparecida d`Oeste', 26, 'SP'),
(4735, 'Apiaí', 26, 'SP'),
(4736, 'Araçariguama', 26, 'SP'),
(4737, 'Araçatuba', 26, 'SP'),
(4738, 'Araçoiaba da Serra', 26, 'SP'),
(4739, 'Aramina', 26, 'SP'),
(4740, 'Arandu', 26, 'SP'),
(4741, 'Arapeí', 26, 'SP'),
(4742, 'Araraquara', 26, 'SP'),
(4743, 'Araras', 26, 'SP'),
(4744, 'Arco-Íris', 26, 'SP'),
(4745, 'Arealva', 26, 'SP'),
(4746, 'Areias', 26, 'SP'),
(4747, 'Areiópolis', 26, 'SP'),
(4748, 'Ariranha', 26, 'SP'),
(4749, 'Artur Nogueira', 26, 'SP'),
(4750, 'Arujá', 26, 'SP'),
(4751, 'Aspásia', 26, 'SP'),
(4752, 'Assis', 26, 'SP'),
(4753, 'Atibaia', 26, 'SP'),
(4754, 'Auriflama', 26, 'SP'),
(4755, 'Avaí', 26, 'SP'),
(4756, 'Avanhandava', 26, 'SP'),
(4757, 'Avaré', 26, 'SP'),
(4758, 'Bady Bassitt', 26, 'SP'),
(4759, 'Balbinos', 26, 'SP'),
(4760, 'Bálsamo', 26, 'SP'),
(4761, 'Bananal', 26, 'SP'),
(4762, 'Barão de Antonina', 26, 'SP'),
(4763, 'Barbosa', 26, 'SP'),
(4764, 'Bariri', 26, 'SP'),
(4765, 'Barra Bonita', 26, 'SP'),
(4766, 'Barra do Chapéu', 26, 'SP'),
(4767, 'Barra do Turvo', 26, 'SP'),
(4768, 'Barretos', 26, 'SP'),
(4769, 'Barrinha', 26, 'SP'),
(4770, 'Barueri', 26, 'SP'),
(4771, 'Bastos', 26, 'SP'),
(4772, 'Batatais', 26, 'SP'),
(4773, 'Bauru', 26, 'SP'),
(4774, 'Bebedouro', 26, 'SP'),
(4775, 'Bento de Abreu', 26, 'SP'),
(4776, 'Bernardino de Campos', 26, 'SP'),
(4777, 'Bertioga', 26, 'SP'),
(4778, 'Bilac', 26, 'SP'),
(4779, 'Birigui', 26, 'SP'),
(4780, 'Biritiba-Mirim', 26, 'SP'),
(4781, 'Boa Esperança do Sul', 26, 'SP'),
(4782, 'Bocaina', 26, 'SP'),
(4783, 'Bofete', 26, 'SP'),
(4784, 'Boituva', 26, 'SP'),
(4785, 'Bom Jesus dos Perdões', 26, 'SP'),
(4786, 'Bom Sucesso de Itararé', 26, 'SP'),
(4787, 'Borá', 26, 'SP'),
(4788, 'Boracéia', 26, 'SP'),
(4789, 'Borborema', 26, 'SP'),
(4790, 'Borebi', 26, 'SP'),
(4791, 'Botucatu', 26, 'SP'),
(4792, 'Bragança Paulista', 26, 'SP'),
(4793, 'Braúna', 26, 'SP'),
(4794, 'Brejo Alegre', 26, 'SP'),
(4795, 'Brodowski', 26, 'SP'),
(4796, 'Brotas', 26, 'SP'),
(4797, 'Buri', 26, 'SP'),
(4798, 'Buritama', 26, 'SP'),
(4799, 'Buritizal', 26, 'SP'),
(4800, 'Cabrália Paulista', 26, 'SP'),
(4801, 'Cabreúva', 26, 'SP'),
(4802, 'Caçapava', 26, 'SP'),
(4803, 'Cachoeira Paulista', 26, 'SP'),
(4804, 'Caconde', 26, 'SP');
INSERT INTO `cidade` (`id`, `nome`, `estado`, `uf`) VALUES
(4805, 'Cafelândia', 26, 'SP'),
(4806, 'Caiabu', 26, 'SP'),
(4807, 'Caieiras', 26, 'SP'),
(4808, 'Caiuá', 26, 'SP'),
(4809, 'Cajamar', 26, 'SP'),
(4810, 'Cajati', 26, 'SP'),
(4811, 'Cajobi', 26, 'SP'),
(4812, 'Cajuru', 26, 'SP'),
(4813, 'Campina do Monte Alegre', 26, 'SP'),
(4814, 'Campinas', 26, 'SP'),
(4815, 'Campo Limpo Paulista', 26, 'SP'),
(4816, 'Campos do Jordão', 26, 'SP'),
(4817, 'Campos Novos Paulista', 26, 'SP'),
(4818, 'Cananéia', 26, 'SP'),
(4819, 'Canas', 26, 'SP'),
(4820, 'Cândido Mota', 26, 'SP'),
(4821, 'Cândido Rodrigues', 26, 'SP'),
(4822, 'Canitar', 26, 'SP'),
(4823, 'Capão Bonito', 26, 'SP'),
(4824, 'Capela do Alto', 26, 'SP'),
(4825, 'Capivari', 26, 'SP'),
(4826, 'Caraguatatuba', 26, 'SP'),
(4827, 'Carapicuíba', 26, 'SP'),
(4828, 'Cardoso', 26, 'SP'),
(4829, 'Casa Branca', 26, 'SP'),
(4830, 'Cássia dos Coqueiros', 26, 'SP'),
(4831, 'Castilho', 26, 'SP'),
(4832, 'Catanduva', 26, 'SP'),
(4833, 'Catiguá', 26, 'SP'),
(4834, 'Cedral', 26, 'SP'),
(4835, 'Cerqueira César', 26, 'SP'),
(4836, 'Cerquilho', 26, 'SP'),
(4837, 'Cesário Lange', 26, 'SP'),
(4838, 'Charqueada', 26, 'SP'),
(4839, 'Chavantes', 26, 'SP'),
(4840, 'Clementina', 26, 'SP'),
(4841, 'Colina', 26, 'SP'),
(4842, 'Colômbia', 26, 'SP'),
(4843, 'Conchal', 26, 'SP'),
(4844, 'Conchas', 26, 'SP'),
(4845, 'Cordeirópolis', 26, 'SP'),
(4846, 'Coroados', 26, 'SP'),
(4847, 'Coronel Macedo', 26, 'SP'),
(4848, 'Corumbataí', 26, 'SP'),
(4849, 'Cosmópolis', 26, 'SP'),
(4850, 'Cosmorama', 26, 'SP'),
(4851, 'Cotia', 26, 'SP'),
(4852, 'Cravinhos', 26, 'SP'),
(4853, 'Cristais Paulista', 26, 'SP'),
(4854, 'Cruzália', 26, 'SP'),
(4855, 'Cruzeiro', 26, 'SP'),
(4856, 'Cubatão', 26, 'SP'),
(4857, 'Cunha', 26, 'SP'),
(4858, 'Descalvado', 26, 'SP'),
(4859, 'Diadema', 26, 'SP'),
(4860, 'Dirce Reis', 26, 'SP'),
(4861, 'Divinolândia', 26, 'SP'),
(4862, 'Dobrada', 26, 'SP'),
(4863, 'Dois Córregos', 26, 'SP'),
(4864, 'Dolcinópolis', 26, 'SP'),
(4865, 'Dourado', 26, 'SP'),
(4866, 'Dracena', 26, 'SP'),
(4867, 'Duartina', 26, 'SP'),
(4868, 'Dumont', 26, 'SP'),
(4869, 'Echaporã', 26, 'SP'),
(4870, 'Eldorado', 26, 'SP'),
(4871, 'Elias Fausto', 26, 'SP'),
(4872, 'Elisiário', 26, 'SP'),
(4873, 'Embaúba', 26, 'SP'),
(4874, 'Embu', 26, 'SP'),
(4875, 'Embu-Guaçu', 26, 'SP'),
(4876, 'Emilianópolis', 26, 'SP'),
(4877, 'Engenheiro Coelho', 26, 'SP'),
(4878, 'Espírito Santo do Pinhal', 26, 'SP'),
(4879, 'Espírito Santo do Turvo', 26, 'SP'),
(4880, 'Estiva Gerbi', 26, 'SP'),
(4881, 'Estrela d`Oeste', 26, 'SP'),
(4882, 'Estrela do Norte', 26, 'SP'),
(4883, 'Euclides da Cunha Paulista', 26, 'SP'),
(4884, 'Fartura', 26, 'SP'),
(4885, 'Fernando Prestes', 26, 'SP'),
(4886, 'Fernandópolis', 26, 'SP'),
(4887, 'Fernão', 26, 'SP'),
(4888, 'Ferraz de Vasconcelos', 26, 'SP'),
(4889, 'Flora Rica', 26, 'SP'),
(4890, 'Floreal', 26, 'SP'),
(4891, 'Flórida Paulista', 26, 'SP'),
(4892, 'Florínia', 26, 'SP'),
(4893, 'Franca', 26, 'SP'),
(4894, 'Francisco Morato', 26, 'SP'),
(4895, 'Franco da Rocha', 26, 'SP'),
(4896, 'Gabriel Monteiro', 26, 'SP'),
(4897, 'Gália', 26, 'SP'),
(4898, 'Garça', 26, 'SP'),
(4899, 'Gastão Vidigal', 26, 'SP'),
(4900, 'Gavião Peixoto', 26, 'SP'),
(4901, 'General Salgado', 26, 'SP'),
(4902, 'Getulina', 26, 'SP'),
(4903, 'Glicério', 26, 'SP'),
(4904, 'Guaiçara', 26, 'SP'),
(4905, 'Guaimbê', 26, 'SP'),
(4906, 'Guaíra', 26, 'SP'),
(4907, 'Guapiaçu', 26, 'SP'),
(4908, 'Guapiara', 26, 'SP'),
(4909, 'Guará', 26, 'SP'),
(4910, 'Guaraçaí', 26, 'SP'),
(4911, 'Guaraci', 26, 'SP'),
(4912, 'Guarani d`Oeste', 26, 'SP'),
(4913, 'Guarantã', 26, 'SP'),
(4914, 'Guararapes', 26, 'SP'),
(4915, 'Guararema', 26, 'SP'),
(4916, 'Guaratinguetá', 26, 'SP'),
(4917, 'Guareí', 26, 'SP'),
(4918, 'Guariba', 26, 'SP'),
(4919, 'Guarujá', 26, 'SP'),
(4920, 'Guarulhos', 26, 'SP'),
(4921, 'Guatapará', 26, 'SP'),
(4922, 'Guzolândia', 26, 'SP'),
(4923, 'Herculândia', 26, 'SP'),
(4924, 'Holambra', 26, 'SP'),
(4925, 'Hortolândia', 26, 'SP'),
(4926, 'Iacanga', 26, 'SP'),
(4927, 'Iacri', 26, 'SP'),
(4928, 'Iaras', 26, 'SP'),
(4929, 'Ibaté', 26, 'SP'),
(4930, 'Ibirá', 26, 'SP'),
(4931, 'Ibirarema', 26, 'SP'),
(4932, 'Ibitinga', 26, 'SP'),
(4933, 'Ibiúna', 26, 'SP'),
(4934, 'Icém', 26, 'SP'),
(4935, 'Iepê', 26, 'SP'),
(4936, 'Igaraçu do Tietê', 26, 'SP'),
(4937, 'Igarapava', 26, 'SP'),
(4938, 'Igaratá', 26, 'SP'),
(4939, 'Iguape', 26, 'SP'),
(4940, 'Ilha Comprida', 26, 'SP'),
(4941, 'Ilha Solteira', 26, 'SP'),
(4942, 'Ilhabela', 26, 'SP'),
(4943, 'Indaiatuba', 26, 'SP'),
(4944, 'Indiana', 26, 'SP'),
(4945, 'Indiaporã', 26, 'SP'),
(4946, 'Inúbia Paulista', 26, 'SP'),
(4947, 'Ipaussu', 26, 'SP'),
(4948, 'Iperó', 26, 'SP'),
(4949, 'Ipeúna', 26, 'SP'),
(4950, 'Ipiguá', 26, 'SP'),
(4951, 'Iporanga', 26, 'SP'),
(4952, 'Ipuã', 26, 'SP'),
(4953, 'Iracemápolis', 26, 'SP'),
(4954, 'Irapuã', 26, 'SP'),
(4955, 'Irapuru', 26, 'SP'),
(4956, 'Itaberá', 26, 'SP'),
(4957, 'Itaí', 26, 'SP'),
(4958, 'Itajobi', 26, 'SP'),
(4959, 'Itaju', 26, 'SP'),
(4960, 'Itanhaém', 26, 'SP'),
(4961, 'Itaóca', 26, 'SP'),
(4962, 'Itapecerica da Serra', 26, 'SP'),
(4963, 'Itapetininga', 26, 'SP'),
(4964, 'Itapeva', 26, 'SP'),
(4965, 'Itapevi', 26, 'SP'),
(4966, 'Itapira', 26, 'SP'),
(4967, 'Itapirapuã Paulista', 26, 'SP'),
(4968, 'Itápolis', 26, 'SP'),
(4969, 'Itaporanga', 26, 'SP'),
(4970, 'Itapuí', 26, 'SP'),
(4971, 'Itapura', 26, 'SP'),
(4972, 'Itaquaquecetuba', 26, 'SP'),
(4973, 'Itararé', 26, 'SP'),
(4974, 'Itariri', 26, 'SP'),
(4975, 'Itatiba', 26, 'SP'),
(4976, 'Itatinga', 26, 'SP'),
(4977, 'Itirapina', 26, 'SP'),
(4978, 'Itirapuã', 26, 'SP'),
(4979, 'Itobi', 26, 'SP'),
(4980, 'Itu', 26, 'SP'),
(4981, 'Itupeva', 26, 'SP'),
(4982, 'Ituverava', 26, 'SP'),
(4983, 'Jaborandi', 26, 'SP'),
(4984, 'Jaboticabal', 26, 'SP'),
(4985, 'Jacareí', 26, 'SP'),
(4986, 'Jaci', 26, 'SP'),
(4987, 'Jacupiranga', 26, 'SP'),
(4988, 'Jaguariúna', 26, 'SP'),
(4989, 'Jales', 26, 'SP'),
(4990, 'Jambeiro', 26, 'SP'),
(4991, 'Jandira', 26, 'SP'),
(4992, 'Jardinópolis', 26, 'SP'),
(4993, 'Jarinu', 26, 'SP'),
(4994, 'Jaú', 26, 'SP'),
(4995, 'Jeriquara', 26, 'SP'),
(4996, 'Joanópolis', 26, 'SP'),
(4997, 'João Ramalho', 26, 'SP'),
(4998, 'José Bonifácio', 26, 'SP'),
(4999, 'Júlio Mesquita', 26, 'SP'),
(5000, 'Jumirim', 26, 'SP'),
(5001, 'Jundiaí', 26, 'SP'),
(5002, 'Junqueirópolis', 26, 'SP'),
(5003, 'Juquiá', 26, 'SP'),
(5004, 'Juquitiba', 26, 'SP'),
(5005, 'Lagoinha', 26, 'SP'),
(5006, 'Laranjal Paulista', 26, 'SP'),
(5007, 'Lavínia', 26, 'SP'),
(5008, 'Lavrinhas', 26, 'SP'),
(5009, 'Leme', 26, 'SP'),
(5010, 'Lençóis Paulista', 26, 'SP'),
(5011, 'Limeira', 26, 'SP'),
(5012, 'Lindóia', 26, 'SP'),
(5013, 'Lins', 26, 'SP'),
(5014, 'Lorena', 26, 'SP'),
(5015, 'Lourdes', 26, 'SP'),
(5016, 'Louveira', 26, 'SP'),
(5017, 'Lucélia', 26, 'SP'),
(5018, 'Lucianópolis', 26, 'SP'),
(5019, 'Luís Antônio', 26, 'SP'),
(5020, 'Luiziânia', 26, 'SP'),
(5021, 'Lupércio', 26, 'SP'),
(5022, 'Lutécia', 26, 'SP'),
(5023, 'Macatuba', 26, 'SP'),
(5024, 'Macaubal', 26, 'SP'),
(5025, 'Macedônia', 26, 'SP'),
(5026, 'Magda', 26, 'SP'),
(5027, 'Mairinque', 26, 'SP'),
(5028, 'Mairiporã', 26, 'SP'),
(5029, 'Manduri', 26, 'SP'),
(5030, 'Marabá Paulista', 26, 'SP'),
(5031, 'Maracaí', 26, 'SP'),
(5032, 'Marapoama', 26, 'SP'),
(5033, 'Mariápolis', 26, 'SP'),
(5034, 'Marília', 26, 'SP'),
(5035, 'Marinópolis', 26, 'SP'),
(5036, 'Martinópolis', 26, 'SP'),
(5037, 'Matão', 26, 'SP'),
(5038, 'Mauá', 26, 'SP'),
(5039, 'Mendonça', 26, 'SP'),
(5040, 'Meridiano', 26, 'SP'),
(5041, 'Mesópolis', 26, 'SP'),
(5042, 'Miguelópolis', 26, 'SP'),
(5043, 'Mineiros do Tietê', 26, 'SP'),
(5044, 'Mira Estrela', 26, 'SP'),
(5045, 'Miracatu', 26, 'SP'),
(5046, 'Mirandópolis', 26, 'SP'),
(5047, 'Mirante do Paranapanema', 26, 'SP'),
(5048, 'Mirassol', 26, 'SP'),
(5049, 'Mirassolândia', 26, 'SP'),
(5050, 'Mococa', 26, 'SP'),
(5051, 'Mogi das Cruzes', 26, 'SP'),
(5052, 'Mogi Guaçu', 26, 'SP'),
(5053, 'Moji Mirim', 26, 'SP'),
(5054, 'Mombuca', 26, 'SP'),
(5055, 'Monções', 26, 'SP'),
(5056, 'Mongaguá', 26, 'SP'),
(5057, 'Monte Alegre do Sul', 26, 'SP'),
(5058, 'Monte Alto', 26, 'SP'),
(5059, 'Monte Aprazível', 26, 'SP'),
(5060, 'Monte Azul Paulista', 26, 'SP'),
(5061, 'Monte Castelo', 26, 'SP'),
(5062, 'Monte Mor', 26, 'SP'),
(5063, 'Monteiro Lobato', 26, 'SP'),
(5064, 'Morro Agudo', 26, 'SP'),
(5065, 'Morungaba', 26, 'SP'),
(5066, 'Motuca', 26, 'SP'),
(5067, 'Murutinga do Sul', 26, 'SP'),
(5068, 'Nantes', 26, 'SP'),
(5069, 'Narandiba', 26, 'SP'),
(5070, 'Natividade da Serra', 26, 'SP'),
(5071, 'Nazaré Paulista', 26, 'SP'),
(5072, 'Neves Paulista', 26, 'SP'),
(5073, 'Nhandeara', 26, 'SP'),
(5074, 'Nipoã', 26, 'SP'),
(5075, 'Nova Aliança', 26, 'SP'),
(5076, 'Nova Campina', 26, 'SP'),
(5077, 'Nova Canaã Paulista', 26, 'SP'),
(5078, 'Nova Castilho', 26, 'SP'),
(5079, 'Nova Europa', 26, 'SP'),
(5080, 'Nova Granada', 26, 'SP'),
(5081, 'Nova Guataporanga', 26, 'SP'),
(5082, 'Nova Independência', 26, 'SP'),
(5083, 'Nova Luzitânia', 26, 'SP'),
(5084, 'Nova Odessa', 26, 'SP'),
(5085, 'Novais', 26, 'SP'),
(5086, 'Novo Horizonte', 26, 'SP'),
(5087, 'Nuporanga', 26, 'SP'),
(5088, 'Ocauçu', 26, 'SP'),
(5089, 'Óleo', 26, 'SP'),
(5090, 'Olímpia', 26, 'SP'),
(5091, 'Onda Verde', 26, 'SP'),
(5092, 'Oriente', 26, 'SP'),
(5093, 'Orindiúva', 26, 'SP'),
(5094, 'Orlândia', 26, 'SP'),
(5095, 'Osasco', 26, 'SP'),
(5096, 'Oscar Bressane', 26, 'SP'),
(5097, 'Osvaldo Cruz', 26, 'SP'),
(5098, 'Ourinhos', 26, 'SP'),
(5099, 'Ouro Verde', 26, 'SP'),
(5100, 'Ouroeste', 26, 'SP'),
(5101, 'Pacaembu', 26, 'SP'),
(5102, 'Palestina', 26, 'SP'),
(5103, 'Palmares Paulista', 26, 'SP'),
(5104, 'Palmeira d`Oeste', 26, 'SP'),
(5105, 'Palmital', 26, 'SP'),
(5106, 'Panorama', 26, 'SP'),
(5107, 'Paraguaçu Paulista', 26, 'SP'),
(5108, 'Paraibuna', 26, 'SP'),
(5109, 'Paraíso', 26, 'SP'),
(5110, 'Paranapanema', 26, 'SP'),
(5111, 'Paranapuã', 26, 'SP'),
(5112, 'Parapuã', 26, 'SP'),
(5113, 'Pardinho', 26, 'SP'),
(5114, 'Pariquera-Açu', 26, 'SP'),
(5115, 'Parisi', 26, 'SP'),
(5116, 'Patrocínio Paulista', 26, 'SP'),
(5117, 'Paulicéia', 26, 'SP'),
(5118, 'Paulínia', 26, 'SP'),
(5119, 'Paulistânia', 26, 'SP'),
(5120, 'Paulo de Faria', 26, 'SP'),
(5121, 'Pederneiras', 26, 'SP'),
(5122, 'Pedra Bela', 26, 'SP'),
(5123, 'Pedranópolis', 26, 'SP'),
(5124, 'Pedregulho', 26, 'SP'),
(5125, 'Pedreira', 26, 'SP'),
(5126, 'Pedrinhas Paulista', 26, 'SP'),
(5127, 'Pedro de Toledo', 26, 'SP'),
(5128, 'Penápolis', 26, 'SP'),
(5129, 'Pereira Barreto', 26, 'SP'),
(5130, 'Pereiras', 26, 'SP'),
(5131, 'Peruíbe', 26, 'SP'),
(5132, 'Piacatu', 26, 'SP'),
(5133, 'Piedade', 26, 'SP'),
(5134, 'Pilar do Sul', 26, 'SP'),
(5135, 'Pindamonhangaba', 26, 'SP'),
(5136, 'Pindorama', 26, 'SP'),
(5137, 'Pinhalzinho', 26, 'SP'),
(5138, 'Piquerobi', 26, 'SP'),
(5139, 'Piquete', 26, 'SP'),
(5140, 'Piracaia', 26, 'SP'),
(5141, 'Piracicaba', 26, 'SP'),
(5142, 'Piraju', 26, 'SP'),
(5143, 'Pirajuí', 26, 'SP'),
(5144, 'Pirangi', 26, 'SP'),
(5145, 'Pirapora do Bom Jesus', 26, 'SP'),
(5146, 'Pirapozinho', 26, 'SP'),
(5147, 'Pirassununga', 26, 'SP'),
(5148, 'Piratininga', 26, 'SP'),
(5149, 'Pitangueiras', 26, 'SP'),
(5150, 'Planalto', 26, 'SP'),
(5151, 'Platina', 26, 'SP'),
(5152, 'Poá', 26, 'SP'),
(5153, 'Poloni', 26, 'SP'),
(5154, 'Pompéia', 26, 'SP'),
(5155, 'Pongaí', 26, 'SP'),
(5156, 'Pontal', 26, 'SP'),
(5157, 'Pontalinda', 26, 'SP'),
(5158, 'Pontes Gestal', 26, 'SP'),
(5159, 'Populina', 26, 'SP'),
(5160, 'Porangaba', 26, 'SP'),
(5161, 'Porto Feliz', 26, 'SP'),
(5162, 'Porto Ferreira', 26, 'SP'),
(5163, 'Potim', 26, 'SP'),
(5164, 'Potirendaba', 26, 'SP'),
(5165, 'Pracinha', 26, 'SP'),
(5166, 'Pradópolis', 26, 'SP'),
(5167, 'Praia Grande', 26, 'SP'),
(5168, 'Pratânia', 26, 'SP'),
(5169, 'Presidente Alves', 26, 'SP'),
(5170, 'Presidente Bernardes', 26, 'SP'),
(5171, 'Presidente Epitácio', 26, 'SP'),
(5172, 'Presidente Prudente', 26, 'SP'),
(5173, 'Presidente Venceslau', 26, 'SP'),
(5174, 'Promissão', 26, 'SP'),
(5175, 'Quadra', 26, 'SP'),
(5176, 'Quatá', 26, 'SP'),
(5177, 'Queiroz', 26, 'SP'),
(5178, 'Queluz', 26, 'SP'),
(5179, 'Quintana', 26, 'SP'),
(5180, 'Rafard', 26, 'SP'),
(5181, 'Rancharia', 26, 'SP'),
(5182, 'Redenção da Serra', 26, 'SP'),
(5183, 'Regente Feijó', 26, 'SP'),
(5184, 'Reginópolis', 26, 'SP'),
(5185, 'Registro', 26, 'SP'),
(5186, 'Restinga', 26, 'SP'),
(5187, 'Ribeira', 26, 'SP'),
(5188, 'Ribeirão Bonito', 26, 'SP'),
(5189, 'Ribeirão Branco', 26, 'SP'),
(5190, 'Ribeirão Corrente', 26, 'SP'),
(5191, 'Ribeirão do Sul', 26, 'SP'),
(5192, 'Ribeirão dos Índios', 26, 'SP'),
(5193, 'Ribeirão Grande', 26, 'SP'),
(5194, 'Ribeirão Pires', 26, 'SP'),
(5195, 'Ribeirão Preto', 26, 'SP'),
(5196, 'Rifaina', 26, 'SP'),
(5197, 'Rincão', 26, 'SP'),
(5198, 'Rinópolis', 26, 'SP'),
(5199, 'Rio Claro', 26, 'SP'),
(5200, 'Rio das Pedras', 26, 'SP'),
(5201, 'Rio Grande da Serra', 26, 'SP'),
(5202, 'Riolândia', 26, 'SP'),
(5203, 'Riversul', 26, 'SP'),
(5204, 'Rosana', 26, 'SP'),
(5205, 'Roseira', 26, 'SP'),
(5206, 'Rubiácea', 26, 'SP'),
(5207, 'Rubinéia', 26, 'SP'),
(5208, 'Sabino', 26, 'SP'),
(5209, 'Sagres', 26, 'SP'),
(5210, 'Sales', 26, 'SP'),
(5211, 'Sales Oliveira', 26, 'SP'),
(5212, 'Salesópolis', 26, 'SP'),
(5213, 'Salmourão', 26, 'SP'),
(5214, 'Saltinho', 26, 'SP'),
(5215, 'Salto', 26, 'SP'),
(5216, 'Salto de Pirapora', 26, 'SP'),
(5217, 'Salto Grande', 26, 'SP'),
(5218, 'Sandovalina', 26, 'SP'),
(5219, 'Santa Adélia', 26, 'SP'),
(5220, 'Santa Albertina', 26, 'SP'),
(5221, 'Santa Bárbara d`Oeste', 26, 'SP'),
(5222, 'Santa Branca', 26, 'SP'),
(5223, 'Santa Clara d`Oeste', 26, 'SP'),
(5224, 'Santa Cruz da Conceição', 26, 'SP'),
(5225, 'Santa Cruz da Esperança', 26, 'SP'),
(5226, 'Santa Cruz das Palmeiras', 26, 'SP'),
(5227, 'Santa Cruz do Rio Pardo', 26, 'SP'),
(5228, 'Santa Ernestina', 26, 'SP'),
(5229, 'Santa Fé do Sul', 26, 'SP'),
(5230, 'Santa Gertrudes', 26, 'SP'),
(5231, 'Santa Isabel', 26, 'SP'),
(5232, 'Santa Lúcia', 26, 'SP'),
(5233, 'Santa Maria da Serra', 26, 'SP'),
(5234, 'Santa Mercedes', 26, 'SP'),
(5235, 'Santa Rita d`Oeste', 26, 'SP'),
(5236, 'Santa Rita do Passa Quatro', 26, 'SP'),
(5237, 'Santa Rosa de Viterbo', 26, 'SP'),
(5238, 'Santa Salete', 26, 'SP'),
(5239, 'Santana da Ponte Pensa', 26, 'SP'),
(5240, 'Santana de Parnaíba', 26, 'SP'),
(5241, 'Santo Anastácio', 26, 'SP'),
(5242, 'Santo André', 26, 'SP'),
(5243, 'Santo Antônio da Alegria', 26, 'SP'),
(5244, 'Santo Antônio de Posse', 26, 'SP'),
(5245, 'Santo Antônio do Aracanguá', 26, 'SP'),
(5246, 'Santo Antônio do Jardim', 26, 'SP'),
(5247, 'Santo Antônio do Pinhal', 26, 'SP'),
(5248, 'Santo Expedito', 26, 'SP'),
(5249, 'Santópolis do Aguapeí', 26, 'SP'),
(5250, 'Santos', 26, 'SP'),
(5251, 'São Bento do Sapucaí', 26, 'SP'),
(5252, 'São Bernardo do Campo', 26, 'SP'),
(5253, 'São Caetano do Sul', 26, 'SP'),
(5254, 'São Carlos', 26, 'SP'),
(5255, 'São Francisco', 26, 'SP'),
(5256, 'São João da Boa Vista', 26, 'SP'),
(5257, 'São João das Duas Pontes', 26, 'SP'),
(5258, 'São João de Iracema', 26, 'SP'),
(5259, 'São João do Pau d`Alho', 26, 'SP'),
(5260, 'São Joaquim da Barra', 26, 'SP'),
(5261, 'São José da Bela Vista', 26, 'SP'),
(5262, 'São José do Barreiro', 26, 'SP'),
(5263, 'São José do Rio Pardo', 26, 'SP'),
(5264, 'São José do Rio Preto', 26, 'SP'),
(5265, 'São José dos Campos', 26, 'SP'),
(5266, 'São Lourenço da Serra', 26, 'SP'),
(5267, 'São Luís do Paraitinga', 26, 'SP'),
(5268, 'São Manuel', 26, 'SP'),
(5269, 'São Miguel Arcanjo', 26, 'SP'),
(5270, 'São Paulo', 26, 'SP'),
(5271, 'São Pedro', 26, 'SP'),
(5272, 'São Pedro do Turvo', 26, 'SP'),
(5273, 'São Roque', 26, 'SP'),
(5274, 'São Sebastião', 26, 'SP'),
(5275, 'São Sebastião da Grama', 26, 'SP'),
(5276, 'São Simão', 26, 'SP'),
(5277, 'São Vicente', 26, 'SP'),
(5278, 'Sarapuí', 26, 'SP'),
(5279, 'Sarutaiá', 26, 'SP'),
(5280, 'Sebastianópolis do Sul', 26, 'SP'),
(5281, 'Serra Azul', 26, 'SP'),
(5282, 'Serra Negra', 26, 'SP'),
(5283, 'Serrana', 26, 'SP'),
(5284, 'Sertãozinho', 26, 'SP'),
(5285, 'Sete Barras', 26, 'SP'),
(5286, 'Severínia', 26, 'SP'),
(5287, 'Silveiras', 26, 'SP'),
(5288, 'Socorro', 26, 'SP'),
(5289, 'Sorocaba', 26, 'SP'),
(5290, 'Sud Mennucci', 26, 'SP'),
(5291, 'Sumaré', 26, 'SP'),
(5292, 'Suzanápolis', 26, 'SP'),
(5293, 'Suzano', 26, 'SP'),
(5294, 'Tabapuã', 26, 'SP'),
(5295, 'Tabatinga', 26, 'SP'),
(5296, 'Taboão da Serra', 26, 'SP'),
(5297, 'Taciba', 26, 'SP'),
(5298, 'Taguaí', 26, 'SP'),
(5299, 'Taiaçu', 26, 'SP'),
(5300, 'Taiúva', 26, 'SP'),
(5301, 'Tambaú', 26, 'SP'),
(5302, 'Tanabi', 26, 'SP'),
(5303, 'Tapiraí', 26, 'SP'),
(5304, 'Tapiratiba', 26, 'SP'),
(5305, 'Taquaral', 26, 'SP'),
(5306, 'Taquaritinga', 26, 'SP'),
(5307, 'Taquarituba', 26, 'SP'),
(5308, 'Taquarivaí', 26, 'SP'),
(5309, 'Tarabai', 26, 'SP'),
(5310, 'Tarumã', 26, 'SP'),
(5311, 'Tatuí', 26, 'SP'),
(5312, 'Taubaté', 26, 'SP'),
(5313, 'Tejupá', 26, 'SP'),
(5314, 'Teodoro Sampaio', 26, 'SP'),
(5315, 'Terra Roxa', 26, 'SP'),
(5316, 'Tietê', 26, 'SP'),
(5317, 'Timburi', 26, 'SP'),
(5318, 'Torre de Pedra', 26, 'SP'),
(5319, 'Torrinha', 26, 'SP'),
(5320, 'Trabiju', 26, 'SP'),
(5321, 'Tremembé', 26, 'SP'),
(5322, 'Três Fronteiras', 26, 'SP'),
(5323, 'Tuiuti', 26, 'SP'),
(5324, 'Tupã', 26, 'SP'),
(5325, 'Tupi Paulista', 26, 'SP'),
(5326, 'Turiúba', 26, 'SP'),
(5327, 'Turmalina', 26, 'SP'),
(5328, 'Ubarana', 26, 'SP'),
(5329, 'Ubatuba', 26, 'SP'),
(5330, 'Ubirajara', 26, 'SP'),
(5331, 'Uchoa', 26, 'SP'),
(5332, 'União Paulista', 26, 'SP'),
(5333, 'Urânia', 26, 'SP'),
(5334, 'Uru', 26, 'SP'),
(5335, 'Urupês', 26, 'SP'),
(5336, 'Valentim Gentil', 26, 'SP'),
(5337, 'Valinhos', 26, 'SP'),
(5338, 'Valparaíso', 26, 'SP'),
(5339, 'Vargem', 26, 'SP'),
(5340, 'Vargem Grande do Sul', 26, 'SP'),
(5341, 'Vargem Grande Paulista', 26, 'SP'),
(5342, 'Várzea Paulista', 26, 'SP'),
(5343, 'Vera Cruz', 26, 'SP'),
(5344, 'Vinhedo', 26, 'SP'),
(5345, 'Viradouro', 26, 'SP'),
(5346, 'Vista Alegre do Alto', 26, 'SP'),
(5347, 'Vitória Brasil', 26, 'SP'),
(5348, 'Votorantim', 26, 'SP'),
(5349, 'Votuporanga', 26, 'SP'),
(5350, 'Zacarias', 26, 'SP'),
(5351, 'Amparo de São Francisco', 25, 'SE'),
(5352, 'Aquidabã', 25, 'SE'),
(5353, 'Aracaju', 25, 'SE'),
(5354, 'Arauá', 25, 'SE'),
(5355, 'Areia Branca', 25, 'SE'),
(5356, 'Barra dos Coqueiros', 25, 'SE'),
(5357, 'Boquim', 25, 'SE'),
(5358, 'Brejo Grande', 25, 'SE'),
(5359, 'Campo do Brito', 25, 'SE'),
(5360, 'Canhoba', 25, 'SE'),
(5361, 'Canindé de São Francisco', 25, 'SE'),
(5362, 'Capela', 25, 'SE'),
(5363, 'Carira', 25, 'SE'),
(5364, 'Carmópolis', 25, 'SE'),
(5365, 'Cedro de São João', 25, 'SE'),
(5366, 'Cristinápolis', 25, 'SE'),
(5367, 'Cumbe', 25, 'SE'),
(5368, 'Divina Pastora', 25, 'SE'),
(5369, 'Estância', 25, 'SE'),
(5370, 'Feira Nova', 25, 'SE'),
(5371, 'Frei Paulo', 25, 'SE'),
(5372, 'Gararu', 25, 'SE'),
(5373, 'General Maynard', 25, 'SE'),
(5374, 'Gracho Cardoso', 25, 'SE'),
(5375, 'Ilha das Flores', 25, 'SE'),
(5376, 'Indiaroba', 25, 'SE'),
(5377, 'Itabaiana', 25, 'SE'),
(5378, 'Itabaianinha', 25, 'SE'),
(5379, 'Itabi', 25, 'SE'),
(5380, 'Itaporanga d`Ajuda', 25, 'SE'),
(5381, 'Japaratuba', 25, 'SE'),
(5382, 'Japoatã', 25, 'SE'),
(5383, 'Lagarto', 25, 'SE'),
(5384, 'Laranjeiras', 25, 'SE'),
(5385, 'Macambira', 25, 'SE'),
(5386, 'Malhada dos Bois', 25, 'SE'),
(5387, 'Malhador', 25, 'SE'),
(5388, 'Maruim', 25, 'SE'),
(5389, 'Moita Bonita', 25, 'SE'),
(5390, 'Monte Alegre de Sergipe', 25, 'SE'),
(5391, 'Muribeca', 25, 'SE'),
(5392, 'Neópolis', 25, 'SE'),
(5393, 'Nossa Senhora Aparecida', 25, 'SE'),
(5394, 'Nossa Senhora da Glória', 25, 'SE'),
(5395, 'Nossa Senhora das Dores', 25, 'SE'),
(5396, 'Nossa Senhora de Lourdes', 25, 'SE'),
(5397, 'Nossa Senhora do Socorro', 25, 'SE'),
(5398, 'Pacatuba', 25, 'SE'),
(5399, 'Pedra Mole', 25, 'SE'),
(5400, 'Pedrinhas', 25, 'SE'),
(5401, 'Pinhão', 25, 'SE'),
(5402, 'Pirambu', 25, 'SE'),
(5403, 'Poço Redondo', 25, 'SE'),
(5404, 'Poço Verde', 25, 'SE'),
(5405, 'Porto da Folha', 25, 'SE'),
(5406, 'Propriá', 25, 'SE'),
(5407, 'Riachão do Dantas', 25, 'SE'),
(5408, 'Riachuelo', 25, 'SE'),
(5409, 'Ribeirópolis', 25, 'SE'),
(5410, 'Rosário do Catete', 25, 'SE'),
(5411, 'Salgado', 25, 'SE'),
(5412, 'Santa Luzia do Itanhy', 25, 'SE'),
(5413, 'Santa Rosa de Lima', 25, 'SE'),
(5414, 'Santana do São Francisco', 25, 'SE'),
(5415, 'Santo Amaro das Brotas', 25, 'SE'),
(5416, 'São Cristóvão', 25, 'SE'),
(5417, 'São Domingos', 25, 'SE'),
(5418, 'São Francisco', 25, 'SE'),
(5419, 'São Miguel do Aleixo', 25, 'SE'),
(5420, 'Simão Dias', 25, 'SE'),
(5421, 'Siriri', 25, 'SE'),
(5422, 'Telha', 25, 'SE'),
(5423, 'Tobias Barreto', 25, 'SE'),
(5424, 'Tomar do Geru', 25, 'SE'),
(5425, 'Umbaúba', 25, 'SE'),
(5426, 'Abreulândia', 27, 'TO'),
(5427, 'Aguiarnópolis', 27, 'TO'),
(5428, 'Aliança do Tocantins', 27, 'TO'),
(5429, 'Almas', 27, 'TO'),
(5430, 'Alvorada', 27, 'TO'),
(5431, 'Ananás', 27, 'TO'),
(5432, 'Angico', 27, 'TO'),
(5433, 'Aparecida do Rio Negro', 27, 'TO'),
(5434, 'Aragominas', 27, 'TO'),
(5435, 'Araguacema', 27, 'TO'),
(5436, 'Araguaçu', 27, 'TO'),
(5437, 'Araguaína', 27, 'TO'),
(5438, 'Araguanã', 27, 'TO'),
(5439, 'Araguatins', 27, 'TO'),
(5440, 'Arapoema', 27, 'TO'),
(5441, 'Arraias', 27, 'TO'),
(5442, 'Augustinópolis', 27, 'TO'),
(5443, 'Aurora do Tocantins', 27, 'TO'),
(5444, 'Axixá do Tocantins', 27, 'TO'),
(5445, 'Babaçulândia', 27, 'TO'),
(5446, 'Bandeirantes do Tocantins', 27, 'TO'),
(5447, 'Barra do Ouro', 27, 'TO'),
(5448, 'Barrolândia', 27, 'TO'),
(5449, 'Bernardo Sayão', 27, 'TO'),
(5450, 'Bom Jesus do Tocantins', 27, 'TO'),
(5451, 'Brasilândia do Tocantins', 27, 'TO'),
(5452, 'Brejinho de Nazaré', 27, 'TO'),
(5453, 'Buriti do Tocantins', 27, 'TO'),
(5454, 'Cachoeirinha', 27, 'TO'),
(5455, 'Campos Lindos', 27, 'TO'),
(5456, 'Cariri do Tocantins', 27, 'TO'),
(5457, 'Carmolândia', 27, 'TO'),
(5458, 'Carrasco Bonito', 27, 'TO'),
(5459, 'Caseara', 27, 'TO'),
(5460, 'Centenário', 27, 'TO'),
(5461, 'Chapada da Natividade', 27, 'TO'),
(5462, 'Chapada de Areia', 27, 'TO'),
(5463, 'Colinas do Tocantins', 27, 'TO'),
(5464, 'Colméia', 27, 'TO'),
(5465, 'Combinado', 27, 'TO'),
(5466, 'Conceição do Tocantins', 27, 'TO'),
(5467, 'Couto de Magalhães', 27, 'TO'),
(5468, 'Cristalândia', 27, 'TO'),
(5469, 'Crixás do Tocantins', 27, 'TO'),
(5470, 'Darcinópolis', 27, 'TO'),
(5471, 'Dianópolis', 27, 'TO'),
(5472, 'Divinópolis do Tocantins', 27, 'TO'),
(5473, 'Dois Irmãos do Tocantins', 27, 'TO'),
(5474, 'Dueré', 27, 'TO'),
(5475, 'Esperantina', 27, 'TO'),
(5476, 'Fátima', 27, 'TO'),
(5477, 'Figueirópolis', 27, 'TO'),
(5478, 'Filadélfia', 27, 'TO'),
(5479, 'Formoso do Araguaia', 27, 'TO'),
(5480, 'Fortaleza do Tabocão', 27, 'TO'),
(5481, 'Goianorte', 27, 'TO'),
(5482, 'Goiatins', 27, 'TO'),
(5483, 'Guaraí', 27, 'TO'),
(5484, 'Gurupi', 27, 'TO'),
(5485, 'Ipueiras', 27, 'TO'),
(5486, 'Itacajá', 27, 'TO'),
(5487, 'Itaguatins', 27, 'TO'),
(5488, 'Itapiratins', 27, 'TO'),
(5489, 'Itaporã do Tocantins', 27, 'TO'),
(5490, 'Jaú do Tocantins', 27, 'TO'),
(5491, 'Juarina', 27, 'TO'),
(5492, 'Lagoa da Confusão', 27, 'TO'),
(5493, 'Lagoa do Tocantins', 27, 'TO'),
(5494, 'Lajeado', 27, 'TO'),
(5495, 'Lavandeira', 27, 'TO'),
(5496, 'Lizarda', 27, 'TO'),
(5497, 'Luzinópolis', 27, 'TO'),
(5498, 'Marianópolis do Tocantins', 27, 'TO'),
(5499, 'Mateiros', 27, 'TO'),
(5500, 'Maurilândia do Tocantins', 27, 'TO'),
(5501, 'Miracema do Tocantins', 27, 'TO'),
(5502, 'Miranorte', 27, 'TO'),
(5503, 'Monte do Carmo', 27, 'TO'),
(5504, 'Monte Santo do Tocantins', 27, 'TO'),
(5505, 'Muricilândia', 27, 'TO'),
(5506, 'Natividade', 27, 'TO'),
(5507, 'Nazaré', 27, 'TO'),
(5508, 'Nova Olinda', 27, 'TO'),
(5509, 'Nova Rosalândia', 27, 'TO'),
(5510, 'Novo Acordo', 27, 'TO'),
(5511, 'Novo Alegre', 27, 'TO'),
(5512, 'Novo Jardim', 27, 'TO'),
(5513, 'Oliveira de Fátima', 27, 'TO'),
(5514, 'Palmas', 27, 'TO'),
(5515, 'Palmeirante', 27, 'TO'),
(5516, 'Palmeiras do Tocantins', 27, 'TO'),
(5517, 'Palmeirópolis', 27, 'TO'),
(5518, 'Paraíso do Tocantins', 27, 'TO'),
(5519, 'Paranã', 27, 'TO'),
(5520, 'Pau d`Arco', 27, 'TO'),
(5521, 'Pedro Afonso', 27, 'TO'),
(5522, 'Peixe', 27, 'TO'),
(5523, 'Pequizeiro', 27, 'TO'),
(5524, 'Pindorama do Tocantins', 27, 'TO'),
(5525, 'Piraquê', 27, 'TO'),
(5526, 'Pium', 27, 'TO'),
(5527, 'Ponte Alta do Bom Jesus', 27, 'TO'),
(5528, 'Ponte Alta do Tocantins', 27, 'TO'),
(5529, 'Porto Alegre do Tocantins', 27, 'TO'),
(5530, 'Porto Nacional', 27, 'TO'),
(5531, 'Praia Norte', 27, 'TO'),
(5532, 'Presidente Kennedy', 27, 'TO'),
(5533, 'Pugmil', 27, 'TO'),
(5534, 'Recursolândia', 27, 'TO'),
(5535, 'Riachinho', 27, 'TO'),
(5536, 'Rio da Conceição', 27, 'TO'),
(5537, 'Rio dos Bois', 27, 'TO'),
(5538, 'Rio Sono', 27, 'TO'),
(5539, 'Sampaio', 27, 'TO'),
(5540, 'Sandolândia', 27, 'TO'),
(5541, 'Santa Fé do Araguaia', 27, 'TO'),
(5542, 'Santa Maria do Tocantins', 27, 'TO'),
(5543, 'Santa Rita do Tocantins', 27, 'TO'),
(5544, 'Santa Rosa do Tocantins', 27, 'TO'),
(5545, 'Santa Tereza do Tocantins', 27, 'TO'),
(5546, 'Santa Terezinha do Tocantins', 27, 'TO'),
(5547, 'São Bento do Tocantins', 27, 'TO'),
(5548, 'São Félix do Tocantins', 27, 'TO'),
(5549, 'São Miguel do Tocantins', 27, 'TO'),
(5550, 'São Salvador do Tocantins', 27, 'TO'),
(5551, 'São Sebastião do Tocantins', 27, 'TO'),
(5552, 'São Valério da Natividade', 27, 'TO'),
(5553, 'Silvanópolis', 27, 'TO'),
(5554, 'Sítio Novo do Tocantins', 27, 'TO'),
(5555, 'Sucupira', 27, 'TO'),
(5556, 'Taguatinga', 27, 'TO'),
(5557, 'Taipas do Tocantins', 27, 'TO'),
(5558, 'Talismã', 27, 'TO'),
(5559, 'Tocantínia', 27, 'TO'),
(5560, 'Tocantinópolis', 27, 'TO'),
(5561, 'Tupirama', 27, 'TO'),
(5562, 'Tupiratins', 27, 'TO'),
(5563, 'Wanderlândia', 27, 'TO'),
(5564, 'Xambioá', 27, 'TO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contador`
--

CREATE TABLE `contador` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL,
  `valor` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contador_grupos`
--

CREATE TABLE `contador_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contador_ordem`
--

CREATE TABLE `contador_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `contato`
--

INSERT INTO `contato` (`id`, `codigo`, `grupo`, `titulo`, `email`) VALUES
(142, '159500552132226', '159434592337144', 'Atendimento ou Orçamento', 'contato@scriptlivre.top'),
(144, '163235328798012', '159434592337144', 'Instalação  em Hospedagem  Cpanel', 'contato@scriptlivre.top'),
(145, '163235334862938', '159434592337144', 'Instalação  em Hospedagem que não usa Cpanel', 'contato@scriptlivre.top');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_grupos`
--

CREATE TABLE `contato_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '1',
  `tipo_envio` varchar(100) DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `contato_grupos`
--

INSERT INTO `contato_grupos` (`id`, `codigo`, `titulo`, `mostrar_titulo`, `tipo_envio`, `descricao`) VALUES
(30, '159434592337144', 'ENTRE EM CONTATO', 1, 'individual', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato_ordem`
--

CREATE TABLE `contato_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `contato_ordem`
--

INSERT INTO `contato_ordem` (`id`, `grupo`, `data`) VALUES
(39, '159434592337144', '142,143'),
(40, '159434592337144', '142,143,144'),
(41, '159434592337144', '142,143,144,145');

-- --------------------------------------------------------

--
-- Estrutura para tabela `conteudos`
--

CREATE TABLE `conteudos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL,
  `conteudo` text,
  `bloqueio` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `conteudos`
--

INSERT INTO `conteudos` (`id`, `codigo`, `titulo`, `conteudo`, `bloqueio`) VALUES
(60, '150432279044656', 'E-mail - Nova mensagem no Pedido', '<p>Voc&ecirc; recebeu uma nova mensagem acesse a &aacute;rea de cliente da loja para ler!</p>\r\n', 1),
(61, '150457686833612', 'E-mail  - Compra Efetuda (cliente)', '<p>Ol&aacute;, recebemos seu pedido com sucesso!</p>\r\n\r\n<p>Voc&ecirc; receber&aacute; um e-mail da nossa equipe logo ap&oacute;s a confirma&ccedil;&atilde;o do pagamento.</p>\r\n', 1),
(54, '146172119158298', 'E-mail - Cadastro Boas Vindas', '<p><span style=\"font-size:14px\">Seja bem-vindo ao&nbsp;nosso website!</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Esperamos que encontre tudo o que voc&ecirc; deseja, com os melhores pre&ccedil;os e condi&ccedil;&otilde;es.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Em caso de d&uacute;vidas entre em contato com nosso atendimento.</span></p>\r\n', 1),
(55, '146177966276191', 'E-mail - Recuperação de Senha', '<p><strong>Prezado Cliente,&nbsp;</strong></p>\r\n\r\n<p><span style=\"font-size:14px\">Voc&ecirc; solicitou&nbsp;uma nova senha da sua conta atrav&eacute;s de nossa Loja Virtual,&nbsp;</span><br />\r\n<span style=\"font-size:14px\">acesse sua conta com o usu&aacute;rio e senha abaixo:</span></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(56, '149001371567620', 'Pedido Concluido', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:20px\"><strong>Obrigado!</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:20px\"><strong><span style=\"font-size:18px\">Recebemos seu pedido com sucesso!</span></strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:18px\"><strong>Nossa equipe j&aacute; est&aacute; conferindo seu pedido, aguarde nosso contato por e-mail.</strong></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n', 1),
(62, '151686145575257', 'Termos e Política de Uso', '', 1),
(65, '152788484254018', 'Política de Privacidade e Segurança', '', 0),
(66, '153176050883058', 'Como Comprar', '', 0),
(69, '153202885839517', 'Trocas e Devoluções', '', 0),
(68, '153194281584850', 'Formas de Pagamento', '', 0),
(70, '153202916456139', 'Política de Entrega', '', 0),
(73, '157609094736033', 'E-mail - Alteração de status', '<p>O status do seu pedido foi alterado.</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `desconto_fixo` double DEFAULT NULL,
  `desconto_porc` double DEFAULT NULL,
  `cadastro` int DEFAULT NULL,
  `prefixo` varchar(255) DEFAULT NULL,
  `valor_minimo` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupom_lista`
--

CREATE TABLE `cupom_lista` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `cupom` varchar(100) DEFAULT NULL,
  `utilizado` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id` int UNSIGNED NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `nome` char(240) DEFAULT NULL,
  `email` char(240) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL,
  `bloqueio` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `depoimentos_grupos`
--

CREATE TABLE `depoimentos_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text,
  `mostrar_titulo` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `destaques`
--

CREATE TABLE `destaques` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `grupo_produtos` varchar(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `destaques_grupos`
--

CREATE TABLE `destaques_grupos` (
  `id` int UNSIGNED NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT '3',
  `descricao` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `destaques_grupos`
--

INSERT INTO `destaques_grupos` (`id`, `codigo`, `titulo`, `mostrar_titulo`, `itens_por_linha`, `descricao`) VALUES
(7, '161488810494187', 'Destaque', 0, 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `destaques_ordem`
--

CREATE TABLE `destaques_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `destaques_ordem`
--

INSERT INTO `destaques_ordem` (`id`, `codigo`, `data`) VALUES
(12, '159434970815143', '2,1,3,4,5,6,7,8,9,10,11'),
(18, '160493962249595', '13,12,15,14'),
(22, '161478436184621', '16,17,18,19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `duvidas`
--

CREATE TABLE `duvidas` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `resposta` text,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `duvidas`
--

INSERT INTO `duvidas` (`id`, `codigo`, `grupo`, `titulo`, `resposta`, `imagem`) VALUES
(139, '162776224048999', '162776219074288', 'Oque é site pronto ?', 'A Internet mudou o mercado, e continua mudando.\r\n\r\nAtualmente, ter um Site deixou de ser um privilégio de poucos e tornou-se essencial para qualquer empresa e profissional\r\nliberal destacar seus serviços e diferenciais.\r\nPágina Virtual Dinâmica ou estática, que tem como principal objetivo fazer a divulgação da empresa, sendo o cartão de visitas\r\nno mundo virtual e a porta de entrada para bons negócios.\r\nPortanto fazer um Site Funcional e que atenda tantos as necessidades do cliente quanto do seu público-alvo é primordial para\r\nmanter o bom relacionamento e na conquista de novos clientes.', NULL),
(140, '162776225484822', '162776219074288', 'Como Funciona ?', 'Simples assim, compre o script que deseja para montar sua loja, Advogado, Autoescola, Chat, Flux Shop, Guia Comercial, Joomla, Loja Virtual, Script, Script Php, Site Institucional, Tema Opencart, Web Rádio, passe todos os dados para a instalação e pronto..', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `duvidas_grupos`
--

CREATE TABLE `duvidas_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `duvidas_grupos`
--

INSERT INTO `duvidas_grupos` (`id`, `codigo`, `titulo`, `mostrar_titulo`) VALUES
(3, '162776219074288', 'Dúvidas Frequentes', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `duvidas_ordem`
--

CREATE TABLE `duvidas_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `duvidas_ordem`
--

INSERT INTO `duvidas_ordem` (`id`, `grupo`, `data`) VALUES
(31, '162776219074288', '139'),
(32, '162776219074288', '139,140');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enquete`
--

CREATE TABLE `enquete` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '1',
  `enquete` text,
  `status` int DEFAULT '0',
  `imagem` varchar(255) DEFAULT NULL,
  `posicao_img` int DEFAULT '0',
  `botao_titulo` varchar(255) DEFAULT NULL,
  `endereco_padrao` varchar(255) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `descricao` text,
  `posicao_enquete` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enquete_resposta`
--

CREATE TABLE `enquete_resposta` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `enquete_codigo` varchar(255) NOT NULL,
  `resposta` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `enquete_resposta`
--

INSERT INTO `enquete_resposta` (`id`, `codigo`, `enquete_codigo`, `resposta`) VALUES
(1, '158529244573731', '158529244166997', 'nada'),
(2, '158529244866351', '158529244166997', 'seila'),
(3, '158529245260614', '158529244166997', 'nada a ver'),
(4, '159439240440531', '159439238414126', 'Por que sim'),
(5, '159439241341597', '159439238414126', 'Não sei do que esta falando'),
(6, '159439242619497', '159439238414126', 'E por que não'),
(7, '159439243220795', '159439238414126', 'To nem ai'),
(9, '159439267284538', '159439266330603', 'Resposta 2'),
(10, '159439267718290', '159439266330603', 'Resposta 3'),
(11, '159441846290527', '159439266330603', 'Resposta 1'),
(13, '159666049818507', '159666046972143', 'Bom'),
(14, '159666050451276', '159666046972143', 'Muito Bom'),
(15, '159666050851545', '159666046972143', 'Perfeito'),
(16, '160010534352850', '160010533610381', 'Resposta 1'),
(17, '160010534646873', '160010533610381', 'Resposta 2'),
(18, '160010535061051', '160010533610381', 'Resposta 3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enquete_voto`
--

CREATE TABLE `enquete_voto` (
  `id` int NOT NULL,
  `data` int NOT NULL,
  `codigo_enquete` varchar(100) DEFAULT NULL,
  `codigo_resposta` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `enquete_voto`
--

INSERT INTO `enquete_voto` (`id`, `data`, `codigo_enquete`, `codigo_resposta`, `ip`) VALUES
(38, 1596725594, '159666046972143', '159666050451276', '::1'),
(39, 1600105615, '160010533610381', '160010534646873', '::1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_grupos`
--

CREATE TABLE `equipe_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_ordem`
--

CREATE TABLE `equipe_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` int NOT NULL,
  `nome` varchar(75) DEFAULT NULL,
  `uf` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`, `uf`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amazonas', 'AM'),
(4, 'Amapá', 'AP'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Minas Gerais', 'MG'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Mato Grosso', 'MT'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Pernambuco', 'PE'),
(17, 'Piauí', 'PI'),
(18, 'Paraná', 'PR'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rondônia', 'RO'),
(22, 'Roraima', 'RR'),
(23, 'Rio Grande do Sul', 'RS'),
(24, 'Santa Catarina', 'SC'),
(25, 'Sergipe', 'SE'),
(26, 'São Paulo', 'SP'),
(27, 'Tocantins', 'TO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais`
--

CREATE TABLE `filiais` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `previa` text,
  `conteudo` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais_grupos`
--

CREATE TABLE `filiais_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais_imagem`
--

CREATE TABLE `filiais_imagem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais_imagem_legenda`
--

CREATE TABLE `filiais_imagem_legenda` (
  `id` int NOT NULL,
  `id_img` varchar(100) DEFAULT NULL,
  `legenda` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `filiais_imagem_legenda`
--

INSERT INTO `filiais_imagem_legenda` (`id`, `id_img`, `legenda`) VALUES
(6, '32', 'bbbbbbbb');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais_imagem_ordem`
--

CREATE TABLE `filiais_imagem_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `filiais_imagem_ordem`
--

INSERT INTO `filiais_imagem_ordem` (`id`, `codigo`, `data`) VALUES
(39, '159467171656866', '32'),
(40, '159467171656866', '32,33'),
(41, '159467171656866', '33,32'),
(42, '159467171656866', '32,33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filiais_ordem`
--

CREATE TABLE `filiais_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos`
--

CREATE TABLE `fotos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `ordem` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `fotos`
--

INSERT INTO `fotos` (`id`, `codigo`, `categoria`, `titulo`, `previa`, `conteudo`, `ordem`) VALUES
(26, '158563131481344', '158499041979107', '222Album 1', 'teste222', '<p>asdasddd</p>\r\n', NULL),
(27, '159440478147253', '158499041979107', 'teste', 'sss', '<p>ss</p>\r\n', NULL),
(32, '159676600529409', '159674963467186', 'teste 2', 'teste', '<p>sdfsdf</p>\r\n', NULL),
(34, '159976878738647', '159674962557012', 'teste', 'sdfsadfasdfasd', '<p>fasdfadsfasdf</p>\r\n', NULL),
(38, '160495157771103', '159976972041262', 'Casa Bege 175', '', '', NULL),
(36, '159976975595313', '159976972580418', 'teste 2', 'sdfasdf', '<p>asdfasdf</p>\r\n', NULL),
(41, '160502916299689', '160502914778939', 'Casa Amarela 58', '', '', NULL),
(42, '160502932319869', '160502930986601', 'Casa 53', '', '', NULL),
(43, '160502957214917', '160502955670689', 'Mini Condominio', '', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_categorias`
--

CREATE TABLE `fotos_categorias` (
  `id` int NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_grupos`
--

CREATE TABLE `fotos_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `formato` varchar(100) DEFAULT NULL,
  `mostrar_categorias` int DEFAULT '0',
  `ordem` varchar(100) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '1',
  `itens_por_linha` int DEFAULT '3',
  `max_itens` int DEFAULT '0',
  `tipo_menu` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_imagem`
--

CREATE TABLE `fotos_imagem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `fotos_imagem`
--

INSERT INTO `fotos_imagem` (`id`, `codigo`, `imagem`) VALUES
(15, '158563131481344', 'linda-arvore-excelente-vista-walpaper-[31-03-20][02-08-41].jpg'),
(13, '158563131481344', 'walpaper-tre-arvore-09-[31-03-20][02-08-39].jpg'),
(14, '158563131481344', 'outono-arvores-walpaper-[31-03-20][02-08-40].jpg'),
(17, '158563131481344', '4-[10-07-20][14-42-47].jpg'),
(18, '158563131481344', '5-[10-07-20][14-42-48].jpg'),
(19, '158563131481344', '6-[10-07-20][14-42-49].jpeg'),
(29, '159676600529409', '1-[06-08-20][23-06-56].jpg'),
(30, '159676600529409', '2-[06-08-20][23-06-57].jpg'),
(31, '159676600529409', '3-[06-08-20][23-06-58].jpg'),
(32, '159676600529409', '4-[06-08-20][23-06-59].jpg'),
(33, '159676600529409', '5-[06-08-20][23-07-00].jpg'),
(38, '159976878738647', '10-[10-09-20][17-13-12].jpg'),
(39, '159976878738647', '9-[10-09-20][17-13-13].jpg'),
(40, '159976878738647', '8-[10-09-20][17-13-14].jpg'),
(41, '159976878738647', '7-[10-09-20][17-13-15].jpg'),
(42, '159976878738647', '6-[10-09-20][17-13-16].jpg'),
(43, '159976878738647', '6-[10-09-20][17-13-18].jpeg'),
(44, '159976878738647', '5-[10-09-20][17-13-19].jpg'),
(81, '160495157771103', '13-[09-11-20][16-53-55].jpg'),
(80, '160495157771103', '12-[09-11-20][16-53-51].jpg'),
(49, '159976975595313', '4-[10-09-20][17-29-19].jpg'),
(50, '159976975595313', '3-[10-09-20][17-29-21].jpg'),
(51, '159976975595313', '2-[10-09-20][17-29-23].jpg'),
(52, '159976975595313', '1-[10-09-20][17-29-24].jpg'),
(79, '160495157771103', '1-[09-11-20][16-53-47].jpg'),
(78, '160495157771103', '10-[09-11-20][16-53-44].jpg'),
(77, '160495157771103', '9-[09-11-20][16-53-41].jpg'),
(76, '160495157771103', '8-[09-11-20][16-53-37].jpg'),
(75, '160495157771103', '7-[09-11-20][16-53-34].jpg'),
(74, '160495157771103', '6-[09-11-20][16-53-30].jpg'),
(73, '160495157771103', '5-[09-11-20][16-53-26].jpg'),
(72, '160495157771103', '4-[09-11-20][16-53-22].jpg'),
(71, '160495157771103', '3-[09-11-20][16-53-17].jpg'),
(70, '160495157771103', '2-[09-11-20][16-53-12].jpg'),
(69, '160495157771103', '1-[09-11-20][16-53-06].jpg'),
(82, '160495157771103', '14-[09-11-20][16-53-58].jpg'),
(83, '160495157771103', '15-[09-11-20][16-54-00].jpg'),
(84, '160495157771103', '16-[09-11-20][16-54-03].jpg'),
(91, '160502932319869', '2-[10-11-20][14-29-04].jpg'),
(90, '160502932319869', '1-[10-11-20][14-29-01].jpg'),
(89, '160502916299689', '1-[10-11-20][14-26-10].jpg'),
(92, '160502932319869', '3-[10-11-20][14-29-08].jpg'),
(93, '160502932319869', '4-[10-11-20][14-29-11].jpg'),
(94, '160502932319869', '5-[10-11-20][14-29-14].jpg'),
(95, '160502932319869', '6-[10-11-20][14-29-18].jpg'),
(96, '160502932319869', '7-[10-11-20][14-29-21].jpg'),
(97, '160502932319869', '8-[10-11-20][14-29-24].jpg'),
(98, '160502932319869', '9-[10-11-20][14-29-27].jpg'),
(99, '160502932319869', '10-[10-11-20][14-29-31].jpg'),
(100, '160502932319869', '1-[10-11-20][14-29-34].jpg'),
(101, '160502932319869', '12-[10-11-20][14-29-37].jpg'),
(102, '160502932319869', '13-[10-11-20][14-29-41].jpg'),
(103, '160502957214917', '1-[10-11-20][14-33-09].jpg'),
(104, '160502957214917', '2-[10-11-20][14-33-14].jpg'),
(105, '160502957214917', '3-[10-11-20][14-33-21].jpg'),
(106, '160502957214917', '4-[10-11-20][14-33-29].jpg'),
(107, '160502957214917', '5-[10-11-20][14-33-36].jpg'),
(108, '160502957214917', '6-[10-11-20][14-33-39].jpg'),
(109, '160502957214917', '7-[10-11-20][14-33-43].jpg'),
(110, '160502957214917', '8-[10-11-20][14-33-47].jpg'),
(111, '160502957214917', '9-[10-11-20][14-33-51].jpg'),
(112, '160502957214917', '10-[10-11-20][14-33-54].jpg'),
(113, '160502957214917', '1-[10-11-20][14-33-57].jpg'),
(114, '160502957214917', '12-[10-11-20][14-34-00].jpg'),
(115, '160502957214917', '13-[10-11-20][14-34-03].jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_imagem_legenda`
--

CREATE TABLE `fotos_imagem_legenda` (
  `id` int NOT NULL,
  `id_img` varchar(100) DEFAULT NULL,
  `legenda` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `fotos_imagem_legenda`
--

INSERT INTO `fotos_imagem_legenda` (`id`, `id_img`, `legenda`) VALUES
(5, '8', 'fghfghjfghjfghjhfg'),
(6, '14', ''),
(7, '29', 'aaaaaaaaaa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_imagem_ordem`
--

CREATE TABLE `fotos_imagem_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `fotos_imagem_ordem`
--

INSERT INTO `fotos_imagem_ordem` (`id`, `codigo`, `data`) VALUES
(11, '158499043043960', '6'),
(12, '158499043043960', '6,7'),
(13, '158499043043960', '6,7,8'),
(14, '158499043043960', '6,7,8,9'),
(15, '158499043043960', '6,7,8,9,10'),
(16, '158499043043960', '6,7,8,9,10,11'),
(17, '158499043043960', '6,7,8,9,10,11,12'),
(18, '158499043043960', '6,8,7,9,10,11,12'),
(19, '158499043043960', '8,6,7,9,10,11,12'),
(20, '158563131481344', '13'),
(21, '158563131481344', '13,14'),
(22, '158563131481344', '13,14,15'),
(23, '158563131481344', '14,13,15'),
(24, '158563131481344', '15,14,13'),
(25, '158563131481344', '15,14,13,16'),
(26, '158563131481344', '15,14,13,16,17'),
(27, '158563131481344', '15,14,13,16,17,18'),
(28, '158563131481344', '15,14,13,16,17,18,19'),
(29, '159441082730886', '20'),
(30, '159441082730886', '20,21'),
(31, '159441082730886', '20,21,22'),
(32, '159441082730886', '20,21,22,23'),
(33, '159441082730886', '20,21,22,23,24'),
(34, '159441082730886', '21,20,22,23,24'),
(35, '159674968476134', '25'),
(36, '159674968476134', '25,26'),
(37, '159674968476134', '25,26,27'),
(38, '159674968476134', '25,26,27,28'),
(39, '159676600529409', '29'),
(40, '159676600529409', '29,30'),
(41, '159676600529409', '29,30,31'),
(42, '159676600529409', '29,30,31,32'),
(43, '159676600529409', '29,30,31,32,33'),
(44, '159676945575461', '34'),
(45, '159676945575461', '34,35'),
(46, '159676945575461', '34,35,36'),
(47, '159676945575461', '34,35,36,37'),
(48, '159976878738647', '38'),
(49, '159976878738647', '38,39'),
(50, '159976878738647', '38,39,40'),
(51, '159976878738647', '38,39,40,41'),
(52, '159976878738647', '38,39,40,41,42'),
(53, '159976878738647', '38,39,40,41,42,43'),
(54, '159976878738647', '38,39,40,41,42,43,44'),
(55, '159976973939388', '45'),
(56, '159976973939388', '45,46'),
(57, '159976973939388', '45,46,47'),
(58, '159976973939388', '45,46,47,48'),
(59, '159976975595313', '49'),
(60, '159976975595313', '49,50'),
(61, '159976975595313', '49,50,51'),
(62, '159976975595313', '49,50,51,52'),
(63, '160495097598933', '53'),
(64, '160495097598933', '53,54'),
(65, '160495097598933', '53,54,55'),
(66, '160495097598933', '53,54,55,56'),
(67, '160495097598933', '53,54,55,56,57'),
(68, '160495097598933', '53,54,55,56,57,58'),
(69, '160495097598933', '53,54,55,56,57,58,59'),
(70, '160495097598933', '53,54,55,56,57,58,59,60'),
(71, '160495097598933', '53,54,55,56,57,58,59,60,61'),
(72, '160495097598933', '53,54,55,56,57,58,59,60,61,62'),
(73, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63'),
(74, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63,64'),
(75, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63,64,65'),
(76, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63,64,65,66'),
(77, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63,64,65,66,67'),
(78, '160495097598933', '53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68'),
(79, '160495157771103', '69'),
(80, '160495157771103', '69,70'),
(81, '160495157771103', '69,70,71'),
(82, '160495157771103', '69,70,71,72'),
(83, '160495157771103', '69,70,71,72,73'),
(84, '160495157771103', '69,70,71,72,73,74'),
(85, '160495157771103', '69,70,71,72,73,74,75'),
(86, '160495157771103', '69,70,71,72,73,74,75,76'),
(87, '160495157771103', '69,70,71,72,73,74,75,76,77'),
(88, '160495157771103', '69,70,71,72,73,74,75,76,77,78'),
(89, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79'),
(90, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79,80'),
(91, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79,80,81'),
(92, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79,80,81,82'),
(93, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79,80,81,82,83'),
(94, '160495157771103', '69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84'),
(95, '160502795712990', '85'),
(96, '160502795712990', '85,86'),
(97, '160502795712990', '85,86,87'),
(98, '160502881492465', '88'),
(99, '160502916299689', '89'),
(100, '160502932319869', '90'),
(101, '160502932319869', '90,91'),
(102, '160502932319869', '90,91,92'),
(103, '160502932319869', '90,91,92,93'),
(104, '160502932319869', '90,91,92,93,94'),
(105, '160502932319869', '90,91,92,93,94,95'),
(106, '160502932319869', '90,91,92,93,94,95,96'),
(107, '160502932319869', '90,91,92,93,94,95,96,97'),
(108, '160502932319869', '90,91,92,93,94,95,96,97,98'),
(109, '160502932319869', '90,91,92,93,94,95,96,97,98,99'),
(110, '160502932319869', '90,91,92,93,94,95,96,97,98,99,100'),
(111, '160502932319869', '90,91,92,93,94,95,96,97,98,99,100,101'),
(112, '160502932319869', '90,91,92,93,94,95,96,97,98,99,100,101,102'),
(113, '160502957214917', '103'),
(114, '160502957214917', '103,104'),
(115, '160502957214917', '103,104,105'),
(116, '160502957214917', '103,104,105,106'),
(117, '160502957214917', '103,104,105,106,107'),
(118, '160502957214917', '103,104,105,106,107,108'),
(119, '160502957214917', '103,104,105,106,107,108,109'),
(120, '160502957214917', '103,104,105,106,107,108,109,110'),
(121, '160502957214917', '103,104,105,106,107,108,109,110,111'),
(122, '160502957214917', '103,104,105,106,107,108,109,110,111,112'),
(123, '160502957214917', '103,104,105,106,107,108,109,110,111,112,113'),
(124, '160502957214917', '103,104,105,106,107,108,109,110,111,112,113,114'),
(125, '160502957214917', '103,104,105,106,107,108,109,110,111,112,113,114,115');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_marcadagua`
--

CREATE TABLE `fotos_marcadagua` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `fotos_marcadagua`
--

INSERT INTO `fotos_marcadagua` (`id`, `codigo`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_ordem`
--

CREATE TABLE `fotos_ordem` (
  `id` int NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `fotos_ordem`
--

INSERT INTO `fotos_ordem` (`id`, `categoria`, `data`) VALUES
(17, '158499041979107', '24'),
(18, '158499041979107', '24,25'),
(19, '158499041979107', '25,24'),
(20, '158499041979107', '24,25'),
(21, '158499041979107', '24,25,26'),
(22, '158499041979107', '24,25,26,27'),
(23, '158499041979107', '27,26'),
(24, '159440768612087', '28'),
(25, '159440768066250', '29'),
(26, '159440768612087', '28,30'),
(27, '159440768612087', '30,28'),
(28, '159674962557012', '31'),
(29, '159674963467186', '32'),
(30, '159674962557012', '31,33'),
(31, '159674962557012', '31,33,34'),
(32, '159976972041262', '35'),
(33, '159976972580418', '36'),
(34, '159976972041262', '35,37'),
(35, '159976972041262', '35,37,38'),
(36, '159976972041262', '35,37,38,39'),
(37, '159976972041262', '35,37,38,39,40'),
(38, '160502914778939', '41'),
(39, '160502930986601', '42'),
(40, '160502955670689', '43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `frete`
--

CREATE TABLE `frete` (
  `id` int NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `titulo_exibicao` varchar(255) DEFAULT NULL,
  `cep` varchar(30) DEFAULT NULL,
  `acrescimo_fixo` double DEFAULT NULL,
  `acrescimo_porc` double DEFAULT NULL,
  `ativo` int DEFAULT NULL,
  `gratis_acima_de` double DEFAULT NULL,
  `estado_tipo_AC` int DEFAULT NULL,
  `estado_fixo_AC` double DEFAULT NULL,
  `estado_tipo_AL` int DEFAULT NULL,
  `estado_fixo_AL` double DEFAULT NULL,
  `estado_tipo_AP` int DEFAULT NULL,
  `estado_fixo_AP` double DEFAULT NULL,
  `estado_tipo_AM` int DEFAULT NULL,
  `estado_fixo_AM` double DEFAULT NULL,
  `estado_tipo_BA` int DEFAULT NULL,
  `estado_fixo_BA` double DEFAULT NULL,
  `estado_tipo_CE` int DEFAULT NULL,
  `estado_fixo_CE` double DEFAULT NULL,
  `estado_tipo_DF` int DEFAULT NULL,
  `estado_fixo_DF` double DEFAULT NULL,
  `estado_tipo_ES` int DEFAULT NULL,
  `estado_fixo_ES` double DEFAULT NULL,
  `estado_tipo_GO` int DEFAULT NULL,
  `estado_fixo_GO` double DEFAULT NULL,
  `estado_tipo_MA` int DEFAULT NULL,
  `estado_fixo_MA` double DEFAULT NULL,
  `estado_tipo_MT` int DEFAULT NULL,
  `estado_fixo_MT` double DEFAULT NULL,
  `estado_tipo_MS` int DEFAULT NULL,
  `estado_fixo_MS` double DEFAULT NULL,
  `estado_tipo_MG` int DEFAULT NULL,
  `estado_fixo_MG` double DEFAULT NULL,
  `estado_tipo_PA` int DEFAULT NULL,
  `estado_fixo_PA` double DEFAULT NULL,
  `estado_tipo_PB` int DEFAULT NULL,
  `estado_fixo_PB` double DEFAULT NULL,
  `estado_tipo_PR` int DEFAULT NULL,
  `estado_fixo_PR` double DEFAULT NULL,
  `estado_tipo_PE` int DEFAULT NULL,
  `estado_fixo_PE` double DEFAULT NULL,
  `estado_tipo_PI` int DEFAULT NULL,
  `estado_fixo_PI` double DEFAULT NULL,
  `estado_tipo_RJ` int DEFAULT NULL,
  `estado_fixo_RJ` double DEFAULT NULL,
  `estado_tipo_RN` int DEFAULT NULL,
  `estado_fixo_RN` double DEFAULT NULL,
  `estado_tipo_RS` int DEFAULT NULL,
  `estado_fixo_RS` double DEFAULT NULL,
  `estado_tipo_RO` int DEFAULT NULL,
  `estado_fixo_RO` double DEFAULT NULL,
  `estado_tipo_RR` int DEFAULT NULL,
  `estado_fixo_RR` double DEFAULT NULL,
  `estado_tipo_SC` int DEFAULT NULL,
  `estado_fixo_SC` double DEFAULT NULL,
  `estado_tipo_SP` int DEFAULT NULL,
  `estado_fixo_SP` double DEFAULT NULL,
  `estado_tipo_SE` int DEFAULT NULL,
  `estado_fixo_SE` double DEFAULT NULL,
  `estado_tipo_TO` int DEFAULT NULL,
  `estado_fixo_TO` double DEFAULT NULL,
  `proximidade_cidade` varchar(255) DEFAULT NULL,
  `proximidade_estado` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `frete`
--

INSERT INTO `frete` (`id`, `titulo`, `titulo_exibicao`, `cep`, `acrescimo_fixo`, `acrescimo_porc`, `ativo`, `gratis_acima_de`, `estado_tipo_AC`, `estado_fixo_AC`, `estado_tipo_AL`, `estado_fixo_AL`, `estado_tipo_AP`, `estado_fixo_AP`, `estado_tipo_AM`, `estado_fixo_AM`, `estado_tipo_BA`, `estado_fixo_BA`, `estado_tipo_CE`, `estado_fixo_CE`, `estado_tipo_DF`, `estado_fixo_DF`, `estado_tipo_ES`, `estado_fixo_ES`, `estado_tipo_GO`, `estado_fixo_GO`, `estado_tipo_MA`, `estado_fixo_MA`, `estado_tipo_MT`, `estado_fixo_MT`, `estado_tipo_MS`, `estado_fixo_MS`, `estado_tipo_MG`, `estado_fixo_MG`, `estado_tipo_PA`, `estado_fixo_PA`, `estado_tipo_PB`, `estado_fixo_PB`, `estado_tipo_PR`, `estado_fixo_PR`, `estado_tipo_PE`, `estado_fixo_PE`, `estado_tipo_PI`, `estado_fixo_PI`, `estado_tipo_RJ`, `estado_fixo_RJ`, `estado_tipo_RN`, `estado_fixo_RN`, `estado_tipo_RS`, `estado_fixo_RS`, `estado_tipo_RO`, `estado_fixo_RO`, `estado_tipo_RR`, `estado_fixo_RR`, `estado_tipo_SC`, `estado_fixo_SC`, `estado_tipo_SP`, `estado_fixo_SP`, `estado_tipo_SE`, `estado_fixo_SE`, `estado_tipo_TO`, `estado_fixo_TO`, `proximidade_cidade`, `proximidade_estado`) VALUES
(1, 'Correios PAC', 'Correios Pac', '85501320', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(2, 'Correios Sedex', 'Correios Sedex', '000000123', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(3, 'Retirar no Local', 'Retirar no local', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(4, 'Transportadora Padrão', 'Transportadora Padrão', '', 10, 15, 1, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `imagem` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `imagem`
--

INSERT INTO `imagem` (`id`, `codigo`, `titulo`, `imagem`) VALUES
(39, '147193111415927', 'Favicon', 'favicon-fw-[02-08-21][18-51-39]-[20-11-21][14-57-51].png'),
(50, '147796771992551', 'Logo', 'Crafted-[21-01-24][01-22-13].png'),
(77, '159432484772768', 'Logo - Rodapé', 'Crafted-[01-02-24][16-38-19].png'),
(80, '159432484772771', 'Bandeira de Pagamentos', 'EyCibP-[20-11-21][16-06-08].png'),
(78, '159432484772769', 'WhatsApp Flu', 'whatsap-fw-[20-11-21][16-18-51].png'),
(79, '159432484772770', 'Perfil What', 'cata-[26-01-24][22-15-01].png'),
(81, '159432484772772', 'Selo de segurança Safe-Browsing', 'gogle-safe-browsing-[20-11-21][18-58-35].png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem_enviadas`
--

CREATE TABLE `imagem_enviadas` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `imagem` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_cores`
--

CREATE TABLE `layout_cores` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `pagina` varchar(100) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_cores`
--

INSERT INTO `layout_cores` (`id`, `codigo`, `titulo`, `pagina`, `cor`) VALUES
(1, '1', 'Fundo', '1', '#9a17b8'),
(7, '1', 'Fundo', '159432711498994', '#ffffff'),
(9, '1', 'Fundo', '159432834361363', '#ffffff'),
(12, '1', 'Fundo', '159464046749138', '#ffffff'),
(13, '1', 'Fundo', '159473224464997', '#ffffff'),
(14, '1', 'Fundo', '159473524448449', '#ffffff'),
(15, '1', 'Fundo', '159474583078334', '#ffffff'),
(30, '1', 'Fundo', '162776217124831', '#d91616'),
(31, '1', 'Fundo', '162776239072846', '#530488'),
(32, '1', 'Fundo', '163743874887618', '#530488'),
(33, '1', 'Fundo', '164795548738456', '#530488');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_itens`
--

CREATE TABLE `layout_itens` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `pagina` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ativo` int DEFAULT NULL,
  `fixo` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_itens`
--

INSERT INTO `layout_itens` (`id`, `codigo`, `pagina`, `tipo`, `titulo`, `ativo`, `fixo`) VALUES
(79, '159426563224767', '1', 'topo', 'Topo - Topo', 1, 0),
(92, '159426563224767', '159432711498994', 'topo', 'Topo - Principal', 1, 0),
(108, '159426563224767', '159432834361363', 'topo', 'Topo - Principal', 1, 0),
(112, '2', '159432834361363', 'produto_fixo', 'Produtos - Conteúdo', 1, 1),
(157, '159434592337144', '159432834361363', 'contato', 'Contato - Principal', 0, 0),
(158, '159434592337144', '159432711498994', 'contato', 'Contato - Principal', 0, 0),
(387, '159434592337144', '159464046749138', 'contato', 'Contato - Principal', 0, 0),
(160, '159434592337144', '1', 'contato', 'Contato - ENTRE EM CONTATO', 0, 0),
(381, '159426563224767', '159464046749138', 'topo', 'Topo - Principal', 1, 0),
(534, '159426563224767', '159473224464997', 'topo', 'Topo - Principal', 1, 0),
(541, '159434592337144', '159473224464997', 'contato', 'Contato - Principal', 0, 0),
(398, '3', '159464046749138', 'blog_fixo', 'Blog - Conteúdo', 1, 1),
(553, '4', '159473224464997', 'cadastro_fixo', 'Cadastro - Conteúdo', 1, 1),
(557, '159426563224767', '159473524448449', 'topo', 'Topo - Principal', 1, 0),
(564, '159434592337144', '159473524448449', 'contato', 'Contato - Principal', 0, 0),
(576, '5', '159473524448449', 'fotos', 'Galeria de Fotos - Conteúdo', 1, 1),
(580, '159426563224767', '159474583078334', 'topo', 'Topo - Principal', 0, 0),
(587, '159434592337144', '159474583078334', 'contato', 'Contato - Principal', 0, 0),
(1113, '162775444249736', '1', 'blocos', 'Bloco Informativo - Topo Inicial', 1, 0),
(1115, '162775766818789', '1', 'blocos', 'Bloco Informativo - Topo Inicial 2', 1, 0),
(1139, '162776234739093', '162776239072846', 'blocos', 'Bloco Informativo - Topo Modelos de Sites', 1, 0),
(1117, '162775812958229', '1', 'blocos', 'Bloco Informativo - A Internet mudou o Mercado. E continua mudando.', 0, 0),
(1138, '162776219074288', '162776239072846', 'duvidas', 'Dúvidas - Dúvidas Frequentes', 0, 0),
(1119, '162775883089827', '1', 'planos', 'Planos - MAIS VENDIDOS', 1, 0),
(1081, '162136095864203', '1', 'rodape', 'Rodapé - Principal', 1, 0),
(1120, '159426563224767', '162776217124831', 'topo', 'Topo - Topo', 1, 0),
(1121, '162775444249736', '162776217124831', 'blocos', 'Bloco Informativo - Topo Inicial', 0, 0),
(1122, '162775766818789', '162776217124831', 'blocos', 'Bloco Informativo - Topo Inicial 2', 0, 0),
(1123, '162775812958229', '162776217124831', 'blocos', 'Bloco Informativo - A Internet mudou o Mercado. E continua mudando.', 0, 0),
(1124, '162775883089827', '162776217124831', 'planos', 'Planos - MAIS VENDIDOS', 0, 0),
(1125, '159434592337144', '162776217124831', 'contato', 'Contato - ENTRE EM CONTATO', 0, 0),
(1126, '162136095864203', '162776217124831', 'rodape', 'Rodapé - Principal', 1, 0),
(1127, '162776219074288', '162776217124831', 'duvidas', 'Dúvidas - Dúvidas Frequentes', 1, 0),
(1128, '162776219074288', '1', 'duvidas', 'Dúvidas - Dúvidas Frequentes', 0, 0),
(1129, '162776234739093', '162776217124831', 'blocos', 'Bloco Informativo - Topo Modelos de Sites', 0, 0),
(1130, '162776234739093', '1', 'blocos', 'Bloco Informativo - Topo Modelos de Sites', 0, 0),
(1131, '159426563224767', '162776239072846', 'topo', 'Topo - Topo', 1, 0),
(1132, '162775444249736', '162776239072846', 'blocos', 'Bloco Informativo - Topo Inicial', 0, 0),
(1133, '162775766818789', '162776239072846', 'blocos', 'Bloco Informativo - Topo Inicial 2', 0, 0),
(1134, '162775812958229', '162776239072846', 'blocos', 'Bloco Informativo - A Internet mudou o Mercado. E continua mudando.', 0, 0),
(1135, '162775883089827', '162776239072846', 'planos', 'Planos - MAIS VENDIDOS', 1, 0),
(1136, '159434592337144', '162776239072846', 'contato', 'Contato - ENTRE EM CONTATO', 0, 0),
(1137, '162136095864203', '162776239072846', 'rodape', 'Rodapé - Principal', 1, 0),
(1143, '163736726328918', '162776239072846', 'blocos', 'Bloco Informativo - Instalação Grátis via Cpanel', 0, 0),
(1144, '163736726328918', '162776217124831', 'blocos', 'Bloco Informativo - Instalação Grátis via Cpanel', 0, 0),
(1145, '163736726328918', '1', 'blocos', 'Bloco Informativo - Instalação Grátis via Cpanel', 1, 0),
(1146, '163736854395321', '162776239072846', 'blocos', 'Bloco Informativo - Pagamento por PIX', 0, 0),
(1147, '163736854395321', '162776217124831', 'blocos', 'Bloco Informativo - Pagamento por PIX', 0, 0),
(1148, '163736854395321', '1', 'blocos', 'Bloco Informativo - Pagamento por PIX', 1, 0),
(1149, '159426563224767', '163743874887618', 'topo', 'Topo - Topo', 1, 0),
(1150, '162775444249736', '163743874887618', 'blocos', 'Bloco Informativo - Topo Inicial', 0, 0),
(1151, '162775766818789', '163743874887618', 'blocos', 'Bloco Informativo - Topo Inicial 2', 0, 0),
(1152, '163736854395321', '163743874887618', 'blocos', 'Bloco Informativo - Pagamento por PIX', 0, 0),
(1153, '162775812958229', '163743874887618', 'blocos', 'Bloco Informativo - A Internet mudou o Mercado. E continua mudando.', 0, 0),
(1154, '162775883089827', '163743874887618', 'planos', 'Planos - MAIS VENDIDOS', 0, 0),
(1155, '163736726328918', '163743874887618', 'blocos', 'Bloco Informativo - Instalação Grátis via Cpanel', 0, 0),
(1156, '159434592337144', '163743874887618', 'contato', 'Contato - ENTRE EM CONTATO', 0, 0),
(1157, '162136095864203', '163743874887618', 'rodape', 'Rodapé - Principal', 1, 0),
(1158, '162776219074288', '163743874887618', 'duvidas', 'Dúvidas - Dúvidas Frequentes', 0, 0),
(1159, '162776234739093', '163743874887618', 'blocos', 'Bloco Informativo - Topo Modelos de Sites', 0, 0),
(1160, '163743932087538', '163743874887618', 'blocos', 'Bloco Informativo - Instalação  via Cpanel', 1, 0),
(1161, '163743932087538', '162776239072846', 'blocos', 'Bloco Informativo - Instalação  via Cpanel', 0, 0),
(1162, '163743932087538', '162776217124831', 'blocos', 'Bloco Informativo - Instalação  via Cpanel', 0, 0),
(1163, '163743932087538', '1', 'blocos', 'Bloco Informativo - Instalação  via Cpanel', 0, 0),
(1172, '164626484342197', '163743874887618', 'planos', 'Planos - DELIVERY', 0, 0),
(1173, '164626484342197', '162776239072846', 'planos', 'Planos - DELIVERY', 0, 0),
(1174, '164626484342197', '162776217124831', 'planos', 'Planos - DELIVERY', 0, 0),
(1175, '164626484342197', '1', 'planos', 'Planos - DELIVERY', 0, 0),
(1180, '164639672617272', '163743874887618', 'planos', 'Planos - LOJA VIRTUAL / WOOCOMMERCE', 0, 0),
(1181, '164639672617272', '162776239072846', 'planos', 'Planos - LOJA VIRTUAL / WOOCOMMERCE', 0, 0),
(1182, '164639672617272', '162776217124831', 'planos', 'Planos - LOJA VIRTUAL / WOOCOMMERCE', 0, 0),
(1183, '164639672617272', '1', 'planos', 'Planos - LOJA VIRTUAL / WOOCOMMERCE', 1, 0),
(1184, '164639679980918', '163743874887618', 'planos', 'Planos - PORTAL DE NOTÍCIAS', 0, 0),
(1185, '164639679980918', '162776239072846', 'planos', 'Planos - PORTAL DE NOTÍCIAS', 0, 0),
(1186, '164639679980918', '162776217124831', 'planos', 'Planos - PORTAL DE NOTÍCIAS', 0, 0),
(1187, '164639679980918', '1', 'planos', 'Planos - PORTAL DE NOTÍCIAS', 0, 0),
(1188, '164639681116192', '163743874887618', 'planos', 'Planos - RÁDIO &amp; WEB TV', 0, 0),
(1189, '164639681116192', '162776239072846', 'planos', 'Planos - RÁDIO &amp; WEB TV', 0, 0),
(1190, '164639681116192', '162776217124831', 'planos', 'Planos - RÁDIO &amp; WEB TV', 0, 0),
(1191, '164639681116192', '1', 'planos', 'Planos - RÁDIO &amp; WEB TV', 0, 0),
(1192, '164639682583165', '163743874887618', 'planos', 'Planos - CLASSIFICADO / IMOBILIÁRIA', 0, 0),
(1193, '164639682583165', '162776239072846', 'planos', 'Planos - CLASSIFICADO / IMOBILIÁRIA', 0, 0),
(1194, '164639682583165', '162776217124831', 'planos', 'Planos - CLASSIFICADO / IMOBILIÁRIA', 0, 0),
(1195, '164639682583165', '1', 'planos', 'Planos - CLASSIFICADO / IMOBILIÁRIA', 0, 0),
(1196, '164639684064763', '163743874887618', 'planos', 'Planos - PRESTADORES DE SERVIÇOS', 0, 0),
(1197, '164639684064763', '162776239072846', 'planos', 'Planos - PRESTADORES DE SERVIÇOS', 0, 0),
(1198, '164639684064763', '162776217124831', 'planos', 'Planos - PRESTADORES DE SERVIÇOS', 0, 0),
(1199, '164639684064763', '1', 'planos', 'Planos - PRESTADORES DE SERVIÇOS', 0, 0),
(1200, '164657016256947', '163743874887618', 'planos', 'Planos - GUIA WP / PHP', 0, 0),
(1201, '164657016256947', '162776239072846', 'planos', 'Planos - GUIA WP / PHP', 0, 0),
(1202, '164657016256947', '162776217124831', 'planos', 'Planos - GUIA WP / PHP', 0, 0),
(1203, '164657016256947', '1', 'planos', 'Planos - GUIA WP / PHP', 0, 0),
(1204, '164657225577697', '163743874887618', 'planos', 'Planos - VITRINE IPTV', 0, 0),
(1205, '164657225577697', '162776239072846', 'planos', 'Planos - VITRINE IPTV', 0, 0),
(1206, '164657225577697', '162776217124831', 'planos', 'Planos - VITRINE IPTV', 0, 0),
(1207, '164657225577697', '1', 'planos', 'Planos - VITRINE IPTV', 0, 0),
(1208, '164657348779404', '163743874887618', 'planos', 'Planos - SCRIPTS DE RIFAS ONLINE EM WP', 0, 0),
(1209, '164657348779404', '162776239072846', 'planos', 'Planos - SCRIPTS DE RIFAS ONLINE EM WP', 0, 0),
(1210, '164657348779404', '162776217124831', 'planos', 'Planos - SCRIPTS DE RIFAS ONLINE EM WP', 0, 0),
(1211, '164657348779404', '1', 'planos', 'Planos - SCRIPTS DE RIFAS ONLINE EM WP', 0, 0),
(1212, '164658072764501', '163743874887618', 'planos', 'Planos - PROMOÇAÕ DO DIA', 0, 0),
(1213, '164658072764501', '162776239072846', 'planos', 'Planos - PROMOÇAÕ DO DIA', 0, 0),
(1214, '164658072764501', '162776217124831', 'planos', 'Planos - PROMOÇAÕ DO DIA', 0, 0),
(1215, '164658072764501', '1', 'planos', 'Planos - PROMOÇAÕ DO DIA', 1, 0),
(1216, '159426563224767', '164795548738456', 'topo', 'Topo - Topo', 1, 0),
(1217, '162775444249736', '164795548738456', 'blocos', 'Bloco Informativo - Topo Inicial', 0, 0),
(1218, '162775766818789', '164795548738456', 'blocos', 'Bloco Informativo - Topo Inicial 2', 0, 0),
(1219, '163736854395321', '164795548738456', 'blocos', 'Bloco Informativo - Pagamento por PIX', 0, 0),
(1220, '162775812958229', '164795548738456', 'blocos', 'Bloco Informativo - A Internet mudou o Mercado. E continua mudando.', 0, 0),
(1221, '164658072764501', '164795548738456', 'planos', 'Planos - PROMOÇAÕ DO DIA', 0, 0),
(1222, '162775883089827', '164795548738456', 'planos', 'Planos - MAIS VENDIDOS', 0, 0),
(1223, '164639672617272', '164795548738456', 'planos', 'Planos - LOJA VIRTUAL / WOOCOMMERCE', 0, 0),
(1224, '164626484342197', '164795548738456', 'planos', 'Planos - DELIVERY', 0, 0),
(1225, '164639679980918', '164795548738456', 'planos', 'Planos - PORTAL DE NOTÍCIAS', 0, 0),
(1226, '164639682583165', '164795548738456', 'planos', 'Planos - CLASSIFICADO / IMOBILIÁRIA', 0, 0),
(1227, '164639681116192', '164795548738456', 'planos', 'Planos - RÁDIO &amp; WEB TV', 0, 0),
(1228, '164657348779404', '164795548738456', 'planos', 'Planos - SCRIPTS DE RIFAS ONLINE EM WP', 0, 0),
(1229, '164639684064763', '164795548738456', 'planos', 'Planos - PRESTADORES DE SERVIÇOS', 0, 0),
(1230, '164657225577697', '164795548738456', 'planos', 'Planos - VITRINE IPTV', 0, 0),
(1231, '164657016256947', '164795548738456', 'planos', 'Planos - GUIA WP / PHP', 0, 0),
(1232, '163736726328918', '164795548738456', 'blocos', 'Bloco Informativo - Instalação Grátis via Cpanel', 0, 0),
(1233, '159434592337144', '164795548738456', 'contato', 'Contato - ENTRE EM CONTATO', 0, 0),
(1234, '162136095864203', '164795548738456', 'rodape', 'Rodapé - Principal', 1, 0),
(1235, '162776219074288', '164795548738456', 'duvidas', 'Dúvidas - Dúvidas Frequentes', 0, 0),
(1236, '162776234739093', '164795548738456', 'blocos', 'Bloco Informativo - Topo Modelos de Sites', 0, 0),
(1237, '163743932087538', '164795548738456', 'blocos', 'Bloco Informativo - Instalação  via Cpanel', 0, 0),
(1238, '164795573441018', '164795548738456', 'blocos', 'Bloco Informativo - info-Hospedagem', 1, 0),
(1239, '164795573441018', '163743874887618', 'blocos', 'Bloco Informativo - info-Hospedagem', 0, 0),
(1240, '164795573441018', '162776239072846', 'blocos', 'Bloco Informativo - info-Hospedagem', 0, 0),
(1241, '164795573441018', '162776217124831', 'blocos', 'Bloco Informativo - info-Hospedagem', 0, 0),
(1242, '164795573441018', '1', 'blocos', 'Bloco Informativo - info-Hospedagem', 0, 0),
(1263, '164797508296440', '164795548738456', 'blocos', 'Bloco Informativo - As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 1, 0),
(1248, '164795637380668', '164795548738456', 'planos', 'Planos - PLANO DE HOSPEDAGEM', 1, 0),
(1249, '164795637380668', '163743874887618', 'planos', 'Planos - PLANO DE HOSPEDAGEM', 0, 0),
(1250, '164795637380668', '162776239072846', 'planos', 'Planos - PLANO DE HOSPEDAGEM', 0, 0),
(1251, '164795637380668', '162776217124831', 'planos', 'Planos - PLANO DE HOSPEDAGEM', 0, 0),
(1252, '164795637380668', '1', 'planos', 'Planos - PLANO DE HOSPEDAGEM', 0, 0),
(1266, '164797508296440', '162776217124831', 'blocos', 'Bloco Informativo - As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 0, 0),
(1267, '164797508296440', '1', 'blocos', 'Bloco Informativo - As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 0, 0),
(1264, '164797508296440', '163743874887618', 'blocos', 'Bloco Informativo - As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 0, 0),
(1265, '164797508296440', '162776239072846', 'blocos', 'Bloco Informativo - As Principais formas de pagamento Cartões, Pix, e Boleto Bancário', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_itens_cores`
--

CREATE TABLE `layout_itens_cores` (
  `id` int NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_itens_cores`
--

INSERT INTO `layout_itens_cores` (`id`, `tipo`, `titulo`, `cor`) VALUES
(1, 'acordeon', 'Fundo', '#fff'),
(2, 'acordeon', 'Texto', '#000'),
(3, 'acordeon', 'Botão fundo', '#000'),
(4, 'acordeon', 'Botão texto', '#fff'),
(5, 'blocos', 'Fundo', '#fff'),
(6, 'blocos', 'Texto', '#000'),
(7, 'blocos', 'Titulo', '#000'),
(8, 'blocos', 'Botão fundo', '#000'),
(9, 'blocos', 'Botão texto', '#fff'),
(10, 'cadastro_email', 'Fundo', '#f2f2f2'),
(11, 'cadastro_email', 'Textos', '#000'),
(12, 'cadastro_email', 'Botão fundo', '#000'),
(13, 'cadastro_email', 'Botão texto', '#fff'),
(14, 'cadastro_email', 'Botão fundo selecionado', '#333'),
(15, 'cadastro_email', 'Botão texto selecionado', '#fff'),
(16, 'cadastro_fone', 'Fundo', '#f2f2f2'),
(17, 'cadastro_fone', 'Texto', '#000'),
(18, 'cadastro_fone', 'Botão fundo', '#000'),
(19, 'cadastro_fone', 'Botão texto', '#fff'),
(20, 'cadastro_fone', 'Botão fundo selecionado', '#333'),
(21, 'cadastro_fone', 'Botão texto selecionado', '#fff'),
(22, 'caracteristicas', 'Fundo', '#fff'),
(23, 'caracteristicas', 'Textos', '#000'),
(24, 'contador', 'Fundo', '#fff'),
(25, 'contador', 'Textos', '#000'),
(26, 'contato', 'Fundo', '#f2f2f2'),
(27, 'contato', 'Textos', '#000'),
(28, 'contato', 'Botão fundo', '#000'),
(29, 'contato', 'Botão texto', '#fff'),
(30, 'depoimentos', 'Fundo', '#fff'),
(31, 'depoimentos', 'Texto', '#000'),
(32, 'depoimentos', 'Botão fundo', '#000'),
(33, 'depoimentos', 'Botão texto', '#fff'),
(34, 'duvidas', 'Fundo', '#fff'),
(35, 'duvidas', 'Texto', '#000'),
(36, 'enquete', 'Fundo', '#fff'),
(37, 'enquete', 'Textos', '#000'),
(38, 'equipe', 'Fundo', '#fff'),
(39, 'equipe', 'Textos', '#000'),
(40, 'fotos', 'Fundo', '#f2f2f2'),
(41, 'fotos', 'Textos', '#000'),
(42, 'parceiros', 'Fundo', '#fff'),
(43, 'parceiros', 'Textos', '#000'),
(44, 'planos', 'Fundo', '#fff'),
(45, 'planos', 'Textos', '#000'),
(46, 'postagens', 'Fundo', '#fff'),
(47, 'postagens', 'Textos', '#000'),
(48, 'produtos', 'Fundo', '#f2f2f2'),
(49, 'produtos', 'Textos', '#000'),
(50, 'revistajornal', 'Fundo', '#fff'),
(51, 'revistajornal', 'Textos', '#000'),
(52, 'servicos', 'Fundo', '#fff'),
(53, 'servicos', 'Textos', '#000'),
(54, 'filiais', 'Fundo', '#fff'),
(55, 'filiais', 'Textos', '#000'),
(56, 'videos', 'Fundo', '#fff'),
(57, 'videos', 'Textos', '#000'),
(58, 'widgets', 'Fundo', '#fff'),
(59, 'widgets', 'Titulo', '#000'),
(60, 'cadastro', 'Fundo', '#fff'),
(61, 'cadastro', 'Textos', '#000'),
(62, 'banner', 'Fundo', '#fff'),
(63, 'destaques', 'Fundo', '#fff'),
(64, 'Destaques', 'Textos', '#000'),
(65, 'destaques', 'Titulo Imagem', '#fff'),
(66, 'destaques', 'Fundo Titulo Imagem', 'rgba(0,0,0,0.60)'),
(67, 'postagens', 'Prévia', '#666'),
(68, 'postagens', 'Paginação Fundo', '#333'),
(69, 'postagens', 'Paginação Texto', '#fff'),
(70, 'postagens', 'Paginação Fundo Selecionado', '#000'),
(71, 'postagens', 'Paginação Texto Selecionado', '#fff'),
(72, 'postagens', 'Titulo', '#000'),
(73, 'postagens', 'Fundo Titulo', 'rgba(0.0.0.0,6);'),
(74, 'postagens', 'Categorias', '#333'),
(75, 'postagens', 'Categorias Selecionado', '#999'),
(76, 'planos', 'Itens inclusos', '#000'),
(77, 'planos', 'Itens não inclusos', '#999'),
(78, 'planos', 'Botão fundo', '#000'),
(79, 'planos', 'Botão textos', '#fff'),
(80, 'planos', 'Fundo Quadro', '#fff'),
(81, 'planos', 'Nome do plano', '#000'),
(82, 'planos', 'Valor', '#333'),
(83, 'depoimentos', 'Setas e Paginador', '#666'),
(84, 'depoimentos', 'Nome', '#666'),
(85, 'depoimentos', 'Depoimento', '#000'),
(86, 'cadastro', 'Botão Fundo', '#000'),
(87, 'cadastro', 'Botão texto', '#FFF'),
(88, 'duvidas', 'Perguntas Fundo', '#f2f2f2'),
(89, 'duvidas', 'Perguntas Itens', '#333'),
(90, 'enquete', 'Pergunta', '#333'),
(91, 'enquete', 'Respostas', '#000'),
(92, 'enquete', 'Fundo enquete', '#eee'),
(93, 'enquete', 'Botão Fundo', '#000'),
(94, 'enquete', 'Botão texto', '#fff'),
(95, 'videos', 'Fundo Categorias', '#eee'),
(96, 'videos', 'Categorias Texto', '#000'),
(97, 'fotos', 'Categorias Fundo', '#ddd'),
(98, 'fotos', 'Categorias Textos', '#000'),
(99, 'produtos', 'Categorias Borda', '#ccc'),
(100, 'produtos', 'Categorias Fundo', '#fff'),
(101, 'produtos', 'Categorias Itens', '#666'),
(102, 'produtos', 'Categorias subitens', '#000'),
(103, 'produtos', 'Destaques borda', '#ccc'),
(104, 'produtos', 'Destaques fundo', '#fff'),
(105, 'produtos', 'Destaques Titulo', '#000'),
(106, 'produtos', 'Destaques valor falso', '#666'),
(107, 'produtos', 'Destaques Valor', '#5c9e0d'),
(108, 'produtos', 'Destaques Botão indisponível fundo', '#999'),
(109, 'produtos', 'Destaques Botão indisponível texto', '#333'),
(110, 'produtos', 'Destaques botão comprar fundo', '#5a981c'),
(111, 'produtos', 'Destaques botão comprar texto', '#fff'),
(112, 'produtos', 'Destaques separador valor', '#f2f2f2'),
(113, 'produtos', 'Destaques sob-consulta', '#666'),
(114, 'produtos', 'Paginação Fundo', '#000'),
(115, 'produtos', 'Paginação texto', '#fff'),
(116, 'produtos', 'Paginação selecionado Fundo', '#fff'),
(117, 'produtos', 'Paginação selecionado texto', '#000'),
(118, 'produtos', 'Categorias Itens Selecionados', '#000'),
(119, 'rastreamento', 'Fundo', '#fff'),
(120, 'rastreamento', 'Texto', '#000'),
(121, 'rastreamento', 'Botão fundo', '#000'),
(122, 'rastreamento', 'Botão texto', '#fff'),
(123, 'programacao', 'Fundo', '#fff'),
(124, 'programacao', 'Textos', '#000'),
(125, 'programacao', 'Fundo Abas', '#ccc'),
(126, 'programacao', 'Abas Texto', '#000'),
(127, 'programacao', 'Aba Selecionada Fundo', '#000'),
(128, 'programacao', 'Aba Selecionada Texto', '#fff'),
(129, 'planos', 'Icone\r\n', '#666'),
(130, 'planos', 'Descrição', '#666');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_itens_cores_sel`
--

CREATE TABLE `layout_itens_cores_sel` (
  `id` int NOT NULL,
  `item_codigo` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `cor_id` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_itens_cores_sel`
--

INSERT INTO `layout_itens_cores_sel` (`id`, `item_codigo`, `tipo`, `cor_id`, `titulo`, `cor`) VALUES
(58, '159434592337144', 'contato', '28', 'Botão fundo', '#041b3b'),
(59, '159434592337144', 'contato', '29', 'Botão texto', '#ffffff'),
(60, '159434592337144', 'contato', '26', 'Fundo', '#ebebeb'),
(61, '159434592337144', 'contato', '27', 'Textos', '#041b3b'),
(148, '159466891685482', 'servicos', '52', 'Fundo', '#fff'),
(149, '159466891685482', 'servicos', '53', 'Textos', '#000'),
(150, '159466892078097', 'servicos', '52', 'Fundo', '#fff'),
(151, '159466892078097', 'servicos', '53', 'Textos', '#000'),
(152, '159466898692060', 'servicos', '52', 'Fundo', '#fff'),
(153, '159466898692060', 'servicos', '53', 'Textos', '#000'),
(183, '159467946197300', 'widgets', '58', 'Fundo', '#fff'),
(184, '159467946197300', 'widgets', '59', 'Titulo', '#000'),
(185, '159467964319973', 'widgets', '58', 'Fundo', '#fff'),
(186, '159467964319973', 'widgets', '59', 'Titulo', '#000'),
(187, '159467976820909', 'widgets', '58', 'Fundo', '#fff'),
(188, '159467976820909', 'widgets', '59', 'Titulo', '#000'),
(189, '159421755016280', 'banner', '62', 'Fundo', '#ffffff'),
(257, '159665855132999', 'parceiros', '42', 'Fundo', '#fff'),
(258, '159665855132999', 'parceiros', '43', 'Textos', '#000'),
(406, '160501805518755', 'postagens', '74', 'Categorias', '#333333'),
(407, '160501805518755', 'postagens', '75', 'Categorias Selecionado', '#999999'),
(408, '160501805518755', 'postagens', '46', 'Fundo', '#ffffff'),
(409, '160501805518755', 'postagens', '73', 'Fundo Titulo', 'rgba(0,0,0,1)'),
(410, '160501805518755', 'postagens', '68', 'Paginação Fundo', '#333333'),
(411, '160501805518755', 'postagens', '70', 'Paginação Fundo Selecionado', '#000000'),
(412, '160501805518755', 'postagens', '69', 'Paginação Texto', '#ffffff'),
(413, '160501805518755', 'postagens', '71', 'Paginação Texto Selecionado', '#ffffff'),
(414, '160501805518755', 'postagens', '67', 'Prévia', '#666666'),
(415, '160501805518755', 'postagens', '47', 'Textos', '#2b2b2b'),
(416, '160501805518755', 'postagens', '72', 'Titulo', '#333333'),
(439, '161478478131443', 'cadastro_fone', '18', 'Botão fundo', '#edb900'),
(440, '161478478131443', 'cadastro_fone', '20', 'Botão fundo selecionado', '#757575'),
(441, '161478478131443', 'cadastro_fone', '19', 'Botão texto', '#ffffff'),
(442, '161478478131443', 'cadastro_fone', '21', 'Botão texto selecionado', '#ffffff'),
(443, '161478478131443', 'cadastro_fone', '16', 'Fundo', '#000000'),
(444, '161478478131443', 'cadastro_fone', '17', 'Texto', '#ffffff'),
(445, '161488810494187', 'destaques', '63', 'Fundo', '#fff'),
(446, '161488810494187', 'destaques', '66', 'Fundo Titulo Imagem', 'rgba(0,0,0,0.60)'),
(447, '161488810494187', 'destaques', '64', 'Textos', '#000'),
(448, '161488810494187', 'destaques', '65', 'Titulo Imagem', '#fff'),
(487, '162775444249736', 'blocos', '8', 'Botão fundo', '#000000'),
(488, '162775444249736', 'blocos', '9', 'Botão texto', '#ffffff'),
(489, '162775444249736', 'blocos', '5', 'Fundo', '#ffffff'),
(490, '162775444249736', 'blocos', '6', 'Texto', '#ffffff'),
(491, '162775444249736', 'blocos', '7', 'Titulo', '#000000'),
(492, '162775766818789', 'blocos', '8', 'Botão fundo', '#000000'),
(493, '162775766818789', 'blocos', '9', 'Botão texto', '#ffffff'),
(494, '162775766818789', 'blocos', '5', 'Fundo', '#530488'),
(495, '162775766818789', 'blocos', '6', 'Texto', '#ffffff'),
(496, '162775766818789', 'blocos', '7', 'Titulo', '#000000'),
(497, '162775812958229', 'blocos', '8', 'Botão fundo', '#000'),
(498, '162775812958229', 'blocos', '9', 'Botão texto', '#fff'),
(499, '162775812958229', 'blocos', '5', 'Fundo', '#fff'),
(500, '162775812958229', 'blocos', '6', 'Texto', '#000'),
(501, '162775812958229', 'blocos', '7', 'Titulo', '#000'),
(502, '162775883089827', 'planos', '78', 'Botão fundo', '#530488'),
(503, '162775883089827', 'planos', '79', 'Botão textos', '#ffffff'),
(504, '162775883089827', 'planos', '130', 'Descrição', '#041b3b'),
(505, '162775883089827', 'planos', '44', 'Fundo', '#530488'),
(506, '162775883089827', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(507, '162775883089827', 'planos', '129', 'Icone\r\n', '#530488'),
(508, '162775883089827', 'planos', '76', 'Itens inclusos', '#404040'),
(509, '162775883089827', 'planos', '77', 'Itens não inclusos', '#bab8b8'),
(510, '162775883089827', 'planos', '81', 'Nome do plano', '#530488'),
(511, '162775883089827', 'planos', '45', 'Textos', '#ffffff'),
(512, '162775883089827', 'planos', '82', 'Valor', '#333333'),
(513, '162776219074288', 'duvidas', '34', 'Fundo', '#5a5a5a'),
(514, '162776219074288', 'duvidas', '88', 'Perguntas Fundo', '#530488'),
(515, '162776219074288', 'duvidas', '89', 'Perguntas Itens', '#ffffff'),
(516, '162776219074288', 'duvidas', '35', 'Texto', '#ffffff'),
(517, '162776234739093', 'blocos', '8', 'Botão fundo', '#000000'),
(518, '162776234739093', 'blocos', '9', 'Botão texto', '#ffffff'),
(519, '162776234739093', 'blocos', '5', 'Fundo', '#530488'),
(520, '162776234739093', 'blocos', '6', 'Texto', '#ffffff'),
(521, '162776234739093', 'blocos', '7', 'Titulo', '#000000'),
(524, '163736726328918', 'blocos', '8', 'Botão fundo', '#530488'),
(525, '163736726328918', 'blocos', '9', 'Botão texto', '#ffffff'),
(526, '163736726328918', 'blocos', '5', 'Fundo', '#530488'),
(527, '163736726328918', 'blocos', '6', 'Texto', '#ffffff'),
(528, '163736726328918', 'blocos', '7', 'Titulo', '#ffffff'),
(529, '163736854395321', 'blocos', '8', 'Botão fundo', '#530488'),
(530, '163736854395321', 'blocos', '9', 'Botão texto', '#ffffff'),
(531, '163736854395321', 'blocos', '5', 'Fundo', '#530488'),
(532, '163736854395321', 'blocos', '6', 'Texto', '#ffffff'),
(533, '163736854395321', 'blocos', '7', 'Titulo', '#ffffff'),
(534, '163743932087538', 'blocos', '8', 'Botão fundo', '#530488'),
(535, '163743932087538', 'blocos', '9', 'Botão texto', '#ffffff'),
(536, '163743932087538', 'blocos', '5', 'Fundo', '#000000'),
(537, '163743932087538', 'blocos', '6', 'Texto', '#ffffff'),
(538, '163743932087538', 'blocos', '7', 'Titulo', '#ffffff'),
(552, '164626484342197', 'planos', '78', 'Botão fundo', '#000000'),
(553, '164626484342197', 'planos', '79', 'Botão textos', '#ffffff'),
(554, '164626484342197', 'planos', '130', 'Descrição', '#666666'),
(555, '164626484342197', 'planos', '44', 'Fundo', '#000000'),
(556, '164626484342197', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(557, '164626484342197', 'planos', '129', 'Icone\r\n', '#666666'),
(558, '164626484342197', 'planos', '76', 'Itens inclusos', '#000000'),
(559, '164626484342197', 'planos', '77', 'Itens não inclusos', '#999999'),
(560, '164626484342197', 'planos', '81', 'Nome do plano', '#000000'),
(561, '164626484342197', 'planos', '45', 'Textos', '#ffffff'),
(562, '164626484342197', 'planos', '82', 'Valor', '#333333'),
(574, '164639672617272', 'planos', '78', 'Botão fundo', '#bf0612'),
(575, '164639672617272', 'planos', '79', 'Botão textos', '#ffffff'),
(576, '164639672617272', 'planos', '130', 'Descrição', '#333333'),
(577, '164639672617272', 'planos', '44', 'Fundo', '#bf0612'),
(578, '164639672617272', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(579, '164639672617272', 'planos', '129', 'Icone\r\n', '#bf0612'),
(580, '164639672617272', 'planos', '76', 'Itens inclusos', '#000000'),
(581, '164639672617272', 'planos', '77', 'Itens não inclusos', '#999999'),
(582, '164639672617272', 'planos', '81', 'Nome do plano', '#bf0612'),
(583, '164639672617272', 'planos', '45', 'Textos', '#ffffff'),
(584, '164639672617272', 'planos', '82', 'Valor', '#333333'),
(585, '164639679980918', 'planos', '78', 'Botão fundo', '#000000'),
(586, '164639679980918', 'planos', '79', 'Botão textos', '#ffffff'),
(587, '164639679980918', 'planos', '130', 'Descrição', '#666666'),
(588, '164639679980918', 'planos', '44', 'Fundo', '#ffffff'),
(589, '164639679980918', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(590, '164639679980918', 'planos', '129', 'Icone\r\n', '#666666'),
(591, '164639679980918', 'planos', '76', 'Itens inclusos', '#000000'),
(592, '164639679980918', 'planos', '77', 'Itens não inclusos', '#999999'),
(593, '164639679980918', 'planos', '81', 'Nome do plano', '#000000'),
(594, '164639679980918', 'planos', '45', 'Textos', '#000000'),
(595, '164639679980918', 'planos', '82', 'Valor', '#333333'),
(596, '164639681116192', 'planos', '78', 'Botão fundo', '#8b057a'),
(597, '164639681116192', 'planos', '79', 'Botão textos', '#ffffff'),
(598, '164639681116192', 'planos', '130', 'Descrição', '#666666'),
(599, '164639681116192', 'planos', '44', 'Fundo', '#8b057a'),
(600, '164639681116192', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(601, '164639681116192', 'planos', '129', 'Icone\r\n', '#8b057a'),
(602, '164639681116192', 'planos', '76', 'Itens inclusos', '#000000'),
(603, '164639681116192', 'planos', '77', 'Itens não inclusos', '#999999'),
(604, '164639681116192', 'planos', '81', 'Nome do plano', '#8b057a'),
(605, '164639681116192', 'planos', '45', 'Textos', '#ffffff'),
(606, '164639681116192', 'planos', '82', 'Valor', '#333333'),
(607, '164639682583165', 'planos', '78', 'Botão fundo', '#3194db'),
(608, '164639682583165', 'planos', '79', 'Botão textos', '#ffffff'),
(609, '164639682583165', 'planos', '130', 'Descrição', '#666666'),
(610, '164639682583165', 'planos', '44', 'Fundo', '#3194db'),
(611, '164639682583165', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(612, '164639682583165', 'planos', '129', 'Icone\r\n', '#3194db'),
(613, '164639682583165', 'planos', '76', 'Itens inclusos', '#000000'),
(614, '164639682583165', 'planos', '77', 'Itens não inclusos', '#999999'),
(615, '164639682583165', 'planos', '81', 'Nome do plano', '#3194db'),
(616, '164639682583165', 'planos', '45', 'Textos', '#ffffff'),
(617, '164639682583165', 'planos', '82', 'Valor', '#333333'),
(618, '164639684064763', 'planos', '78', 'Botão fundo', '#2d3194'),
(619, '164639684064763', 'planos', '79', 'Botão textos', '#ffffff'),
(620, '164639684064763', 'planos', '130', 'Descrição', '#666666'),
(621, '164639684064763', 'planos', '44', 'Fundo', '#2d3194'),
(622, '164639684064763', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(623, '164639684064763', 'planos', '129', 'Icone\r\n', '#2d3194'),
(624, '164639684064763', 'planos', '76', 'Itens inclusos', '#000000'),
(625, '164639684064763', 'planos', '77', 'Itens não inclusos', '#999999'),
(626, '164639684064763', 'planos', '81', 'Nome do plano', '#2d3194'),
(627, '164639684064763', 'planos', '45', 'Textos', '#ffffff'),
(628, '164639684064763', 'planos', '82', 'Valor', '#333333'),
(629, '164657016256947', 'planos', '78', 'Botão fundo', '#8da84d'),
(630, '164657016256947', 'planos', '79', 'Botão textos', '#ffffff'),
(631, '164657016256947', 'planos', '130', 'Descrição', '#666666'),
(632, '164657016256947', 'planos', '44', 'Fundo', '#8da84d'),
(633, '164657016256947', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(634, '164657016256947', 'planos', '129', 'Icone\r\n', '#8da84d'),
(635, '164657016256947', 'planos', '76', 'Itens inclusos', '#000000'),
(636, '164657016256947', 'planos', '77', 'Itens não inclusos', '#999999'),
(637, '164657016256947', 'planos', '81', 'Nome do plano', '#8da84d'),
(638, '164657016256947', 'planos', '45', 'Textos', '#ffffff'),
(639, '164657016256947', 'planos', '82', 'Valor', '#333333'),
(640, '164657225577697', 'planos', '78', 'Botão fundo', '#06041c'),
(641, '164657225577697', 'planos', '79', 'Botão textos', '#ffffff'),
(642, '164657225577697', 'planos', '130', 'Descrição', '#666666'),
(643, '164657225577697', 'planos', '44', 'Fundo', '#06041c'),
(644, '164657225577697', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(645, '164657225577697', 'planos', '129', 'Icone\r\n', '#06041c'),
(646, '164657225577697', 'planos', '76', 'Itens inclusos', '#000000'),
(647, '164657225577697', 'planos', '77', 'Itens não inclusos', '#999999'),
(648, '164657225577697', 'planos', '81', 'Nome do plano', '#06041c'),
(649, '164657225577697', 'planos', '45', 'Textos', '#ffffff'),
(650, '164657225577697', 'planos', '82', 'Valor', '#333333'),
(651, '164657348779404', 'planos', '78', 'Botão fundo', '#f89b02'),
(652, '164657348779404', 'planos', '79', 'Botão textos', '#ffffff'),
(653, '164657348779404', 'planos', '130', 'Descrição', '#666666'),
(654, '164657348779404', 'planos', '44', 'Fundo', '#f89b02'),
(655, '164657348779404', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(656, '164657348779404', 'planos', '129', 'Icone\r\n', '#f89b02'),
(657, '164657348779404', 'planos', '76', 'Itens inclusos', '#000000'),
(658, '164657348779404', 'planos', '77', 'Itens não inclusos', '#999999'),
(659, '164657348779404', 'planos', '81', 'Nome do plano', '#f89b02'),
(660, '164657348779404', 'planos', '45', 'Textos', '#ffffff'),
(661, '164657348779404', 'planos', '82', 'Valor', '#333333'),
(662, '164658072764501', 'planos', '78', 'Botão fundo', '#530488'),
(663, '164658072764501', 'planos', '79', 'Botão textos', '#ffffff'),
(664, '164658072764501', 'planos', '130', 'Descrição', '#666666'),
(665, '164658072764501', 'planos', '44', 'Fundo', '#530488'),
(666, '164658072764501', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(667, '164658072764501', 'planos', '129', 'Icone\r\n', '#530488'),
(668, '164658072764501', 'planos', '76', 'Itens inclusos', '#000000'),
(669, '164658072764501', 'planos', '77', 'Itens não inclusos', '#999999'),
(670, '164658072764501', 'planos', '81', 'Nome do plano', '#530488'),
(671, '164658072764501', 'planos', '45', 'Textos', '#ffffff'),
(672, '164658072764501', 'planos', '82', 'Valor', '#333333'),
(673, '164795573441018', 'blocos', '8', 'Botão fundo', '#000000'),
(674, '164795573441018', 'blocos', '9', 'Botão texto', '#ffffff'),
(675, '164795573441018', 'blocos', '5', 'Fundo', '#520487'),
(676, '164795573441018', 'blocos', '6', 'Texto', '#ffffff'),
(677, '164795573441018', 'blocos', '7', 'Titulo', '#000000'),
(683, '164795637380668', 'planos', '78', 'Botão fundo', '#000000'),
(684, '164795637380668', 'planos', '79', 'Botão textos', '#ffffff'),
(685, '164795637380668', 'planos', '130', 'Descrição', '#666666'),
(686, '164795637380668', 'planos', '44', 'Fundo', '#ffffff'),
(687, '164795637380668', 'planos', '80', 'Fundo Quadro', '#ffffff'),
(688, '164795637380668', 'planos', '129', 'Icone\r\n', '#666666'),
(689, '164795637380668', 'planos', '76', 'Itens inclusos', '#000000'),
(690, '164795637380668', 'planos', '77', 'Itens não inclusos', '#999999'),
(691, '164795637380668', 'planos', '81', 'Nome do plano', '#000000'),
(692, '164795637380668', 'planos', '45', 'Textos', '#000000'),
(693, '164795637380668', 'planos', '82', 'Valor', '#333333'),
(716, '164797508296440', 'blocos', '8', 'Botão fundo', '#000000'),
(717, '164797508296440', 'blocos', '9', 'Botão texto', '#ffffff'),
(718, '164797508296440', 'blocos', '5', 'Fundo', '#000000'),
(719, '164797508296440', 'blocos', '6', 'Texto', '#000000'),
(720, '164797508296440', 'blocos', '7', 'Titulo', '#000000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_itens_ordem`
--

CREATE TABLE `layout_itens_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_itens_ordem`
--

INSERT INTO `layout_itens_ordem` (`id`, `codigo`, `data`) VALUES
(1730, '159474583078334', ''),
(1731, '159473524448449', ''),
(1732, '159473224464997', ''),
(1735, '159432711498994', ''),
(1734, '159432834361363', ''),
(1733, '159464046749138', ''),
(1948, '164795548738456', '1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1238,1248,1263,1234,1235,1236,1237'),
(1943, '163743874887618', '1149,1150,1151,1152,1153,1160,1154,1155,1156,1157,1158,1159,1172,1180,1184,1188,1192,1196,1200,1204,1208,1212,1239,1249,1264'),
(1944, '162776239072846', '1131,1139,1135,1132,1133,1134,1136,1137,1138,1143,1146,1161,1173,1181,1185,1189,1193,1197,1201,1205,1209,1213,1240,1250,1265'),
(1945, '162776217124831', '1120,1127,1121,1122,1123,1124,1125,1126,1129,1144,1147,1162,1174,1182,1186,1190,1194,1198,1202,1206,1210,1214,1241,1251,1266'),
(1946, '1', '79,1113,1115,1148,1117,1215,1119,1183,1175,1187,1195,1191,1211,1199,1207,1203,1145,160,1081,1128,1130,1163,1242,1252,1267');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_menu`
--

CREATE TABLE `layout_menu` (
  `id` int NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `topo_codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `visivel` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `layout_menu`
--

INSERT INTO `layout_menu` (`id`, `codigo`, `topo_codigo`, `titulo`, `categoria`, `endereco`, `imagem`, `banner`, `visivel`) VALUES
(93, '159499188679502', '159426563224767', 'FUNCIONALIDADES', '', 'funcionalidades', '6-[05-01-19][19-42-24]-[29-07-20][13-53-49].png', NULL, 1),
(109, '163737067775292', '159426563224767', 'HOSPEDAGEM LINUX', '', 'hospedagem', NULL, NULL, 0),
(103, '159603647426081', '159426563224767', 'HOME', '', '', '1-[05-01-19][19-41-3]-[29-07-20][13-53-38].png', NULL, 0),
(108, '160503123528296', '159426563224767', 'DÚVIDAS FRENQUENTES', '', 'duvidas', NULL, NULL, 0),
(105, '159604166029097', '159426563224767', 'EQUIPE', '', 'equipe', NULL, NULL, 1),
(106, '159604202919239', '159426563224767', 'MODELOS DE SITES', '', 'modelosdesites', NULL, NULL, 1),
(110, '163737076763691', '159426563224767', 'ASSISTÊNCIA REMOTA', '', 'https://anydesk.pt/download', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_menu_ordem`
--

CREATE TABLE `layout_menu_ordem` (
  `id` int NOT NULL,
  `topo_codigo` varchar(100) DEFAULT NULL,
  `id_pai` int NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `layout_menu_ordem`
--

INSERT INTO `layout_menu_ordem` (`id`, `topo_codigo`, `id_pai`, `data`) VALUES
(148, '159426563224767', 0, '103,93,106,108,105,109,110');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_menu_rodape`
--

CREATE TABLE `layout_menu_rodape` (
  `id` int NOT NULL,
  `rodape_codigo` varchar(100) DEFAULT NULL,
  `codigo` varchar(100) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `endereco` text,
  `visivel` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `layout_menu_rodape`
--

INSERT INTO `layout_menu_rodape` (`id`, `rodape_codigo`, `codigo`, `titulo`, `endereco`, `visivel`) VALUES
(28, '162136095864203', '163737044513133', 'DÚVIDAS FRENQUENTES', 'duvidas', 0),
(29, '162136095864203', '163737047353635', 'PIX Celular: 11961817094', '', 0),
(25, '162136095864203', '162136101236158', 'INICIAL', 'index', 0),
(30, '162136095864203', '163737049592642', 'Instalação via Cpanel', 'instalacao-via-capnel', 0),
(31, '162136095864203', '163737055532007', 'Assistência Remota – Baixar AnyDesk', 'https://anydesk.pt/download', 0),
(32, '162136095864203', '163737061728650', 'Hospedagem Linux', 'https://www.divinosilva.com.br/hospedagem/', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_menu_rodape_ordem`
--

CREATE TABLE `layout_menu_rodape_ordem` (
  `id` int NOT NULL,
  `rodape_codigo` varchar(100) DEFAULT NULL,
  `id_pai` int NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `layout_menu_rodape_ordem`
--

INSERT INTO `layout_menu_rodape_ordem` (`id`, `rodape_codigo`, `id_pai`, `data`) VALUES
(48, '162136095864203', 0, '25,28,29,30,31,32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_paginas`
--

CREATE TABLE `layout_paginas` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `chave` varchar(255) DEFAULT NULL,
  `meta_titulo` varchar(255) DEFAULT NULL,
  `meta_descricao` text,
  `bloqueio` int DEFAULT NULL,
  `fixa` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_paginas`
--

INSERT INTO `layout_paginas` (`id`, `codigo`, `titulo`, `chave`, `meta_titulo`, `meta_descricao`, `bloqueio`, `fixa`) VALUES
(1, '1', 'Principal', 'index', 'São mais de 70 sites prontos', 'Procurando por Modelos prontos Para economizar tempo e esforço de programação?\r\n  Sites em HTML5, Bootstrap &amp; PHP', 0, 1),
(53, '162776217124831', 'Dúvidas Frequentes', 'duvidas', 'Dúvidas Frequentes', 'Dúvidas Frequentes', 0, 0),
(54, '162776239072846', 'Sites Prontos', 'modelosdesites', 'Sites Prontos', 'Modelos de Sites Prontos', 0, 0),
(55, '163743874887618', 'Instalação via Cpanel', 'instalacao-via-capnel', 'Instalação via Cpanel', '', 0, 0),
(56, '164795548738456', 'Hospedagem', 'hospedagem', 'A Melhor opção em Hospedagem Linux', 'Conheça os planos e escolha a melhor opção para ter a sua página na web. Hospedagem de Sites cPanel por Apenas R$20,00 Mensal. Infraestrutura de Ponta com uma conexão robusta oferecemos a melhor base para você hospedar o seu site.', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_rodapes`
--

CREATE TABLE `layout_rodapes` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_rodapes`
--

INSERT INTO `layout_rodapes` (`id`, `codigo`, `titulo`, `modelo`) VALUES
(6, '162136095864203', 'Principal', '3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_rodapes_cores`
--

CREATE TABLE `layout_rodapes_cores` (
  `id` int NOT NULL,
  `rodape_modelo` int DEFAULT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cor` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_rodapes_cores`
--

INSERT INTO `layout_rodapes_cores` (`id`, `rodape_modelo`, `titulo`, `cor`) VALUES
(1, 1, 'Copyright - texto', '#fff'),
(2, 1, 'Copyright - Fundo', '#000'),
(5, 1, 'Fundo', '#333'),
(6, 1, 'Textos', '#fff'),
(7, 2, 'Copyright - texto', '#fff'),
(8, 2, 'Copyright - Fundo', '#000'),
(9, 2, 'Fundo', '#333'),
(10, 2, 'Textos', '#fff'),
(11, 3, 'Copyright - texto', '#fff'),
(12, 3, 'Copyright - Fundo', '#000'),
(13, 3, 'Fundo', '#333'),
(14, 3, 'Textos', '#fff'),
(15, 1, 'Aceitar termos - Fundo', '#000'),
(16, 2, 'Aceitar termos - Fundo', '#000'),
(17, 3, 'Aceitar termos - Fundo', '#000'),
(18, 1, 'Aceitar termos - Texto', '#fff'),
(19, 2, 'Aceitar termos - Texto', '#fff'),
(20, 3, 'Aceitar termos - Texto', '#fff'),
(21, 1, 'Aceitar termos - Botão Texto', '#000'),
(22, 2, 'Aceitar termos - Botão Texto', '#000'),
(23, 3, 'Aceitar termos - Botão Texto', '#000'),
(24, 1, 'Aceitar termos - Botão Fundo', '#fff'),
(25, 2, 'Aceitar termos - Botão Fundo', '#fff'),
(26, 3, 'Aceitar termos - Botão Fundo', '#fff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_rodapes_cores_sel`
--

CREATE TABLE `layout_rodapes_cores_sel` (
  `id` int NOT NULL,
  `rodape_codigo` varchar(100) DEFAULT NULL,
  `rodape_modelo` int DEFAULT NULL,
  `cor_id` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `cor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_rodapes_cores_sel`
--

INSERT INTO `layout_rodapes_cores_sel` (`id`, `rodape_codigo`, `rodape_modelo`, `cor_id`, `titulo`, `cor`) VALUES
(37, '162136095864203', 1, 24, 'Aceitar termos - Botão Fundo', '#b09999'),
(38, '162136095864203', 1, 21, 'Aceitar termos - Botão Texto', '#000000'),
(39, '162136095864203', 1, 15, 'Aceitar termos - Fundo', '#000000'),
(40, '162136095864203', 1, 18, 'Aceitar termos - Texto', '#ffffff'),
(41, '162136095864203', 1, 2, 'Copyright - Fundo', '#000000'),
(42, '162136095864203', 1, 1, 'Copyright - texto', '#ffffff'),
(43, '162136095864203', 1, 5, 'Fundo', '#333333'),
(44, '162136095864203', 1, 6, 'Textos', '#ffffff'),
(45, '162136095864203', 3, 26, 'Aceitar termos - Botão Fundo', '#ffffff'),
(46, '162136095864203', 3, 23, 'Aceitar termos - Botão Texto', '#000000'),
(47, '162136095864203', 3, 17, 'Aceitar termos - Fundo', '#530488'),
(48, '162136095864203', 3, 20, 'Aceitar termos - Texto', '#ffffff'),
(49, '162136095864203', 3, 12, 'Copyright - Fundo', '#530488'),
(50, '162136095864203', 3, 11, 'Copyright - texto', '#ffffff'),
(51, '162136095864203', 3, 13, 'Fundo', '#530488'),
(52, '162136095864203', 3, 14, 'Textos', '#d4d0d0'),
(53, '162136095864203', 2, 25, 'Aceitar termos - Botão Fundo', '#ffffff'),
(54, '162136095864203', 2, 22, 'Aceitar termos - Botão Texto', '#000000'),
(55, '162136095864203', 2, 16, 'Aceitar termos - Fundo', '#000000'),
(56, '162136095864203', 2, 19, 'Aceitar termos - Texto', '#ffffff'),
(57, '162136095864203', 2, 8, 'Copyright - Fundo', '#000000'),
(58, '162136095864203', 2, 7, 'Copyright - texto', '#ffffff'),
(59, '162136095864203', 2, 9, 'Fundo', '#333333'),
(60, '162136095864203', 2, 10, 'Textos', '#ffffff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_rodapes_modelos`
--

CREATE TABLE `layout_rodapes_modelos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_rodapes_modelos`
--

INSERT INTO `layout_rodapes_modelos` (`id`, `codigo`, `titulo`) VALUES
(6, '3', 'Divino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_topos`
--

CREATE TABLE `layout_topos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_topos`
--

INSERT INTO `layout_topos` (`id`, `codigo`, `titulo`, `modelo`) VALUES
(1, '159426563224767', 'Topo', '6');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_topos_cores`
--

CREATE TABLE `layout_topos_cores` (
  `id` int NOT NULL,
  `topo_modelo` int DEFAULT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cor` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_topos_cores`
--

INSERT INTO `layout_topos_cores` (`id`, `topo_modelo`, `titulo`, `cor`) VALUES
(99, 2, 'Faixa fone e redes sociais - fundo', '#000000'),
(98, 2, 'Faixa fone e redes sociais - texto', '#ffffff'),
(62, 1, 'Menu - Sub - Links', '#000000'),
(61, 1, 'Menu - Sub - Fundo', '#ffffff'),
(76, 1, 'Fundo', '#ffffff'),
(77, 1, 'Busca bordas', '#cccccc'),
(78, 1, 'Busca Texto', '#000000'),
(56, 1, 'Menu texto', '#ffffff'),
(54, 1, 'Menu fundo', '#0189ff'),
(85, 1, 'Faixa fone e redes sociais - fundo', '#000000'),
(86, 1, 'Faixa fone e redes sociais - texto', '#ffffff'),
(97, 2, 'Busca fundo', '#ffffff'),
(96, 2, 'Busca bordas', '#cccccc'),
(87, 1, 'Busca fundo', '#ffffff'),
(88, 1, 'Textos', '#666666'),
(89, 1, 'Icones', '#0189ff'),
(90, 1, 'Menu - Sub - Titulo', '#666666'),
(95, 2, 'Busca Texto', '#000000'),
(91, 1, 'Menu - Sub - Marcas - Fundo', '#dddddd'),
(92, 1, 'Menu - Sub - Marcas - Texto', '#000000'),
(93, 1, 'Menu - Selecionado', '#999999'),
(94, 1, 'Menu - Sub - Fundo - Bordas', '#dddddd'),
(100, 2, 'Fundo', '#ffffff'),
(101, 2, 'Icones', '#0189ff'),
(102, 2, 'Menu - Selecionado', '#999999'),
(103, 2, 'Menu - Sub - Fundo', '#ffffff'),
(104, 2, 'Menu - Sub - Fundo - Bordas', '#dddddd'),
(105, 2, 'Menu - Sub - Links', '#000000'),
(106, 2, 'Menu - Sub - Marcas - Fundo', '#dddddd'),
(107, 2, 'Menu - Sub - Marcas - Texto', '#000000'),
(108, 2, 'Menu - Sub - Titulo', '#666666'),
(109, 2, 'Menu fundo', '#0189ff'),
(110, 2, 'Menu texto', '#ffffff'),
(111, 2, 'Textos', '#000000'),
(112, 3, 'Fundo', '#ffffff'),
(113, 3, 'Logo - Fundo', '#eeeeee'),
(114, 3, 'Menu - Bt Inicial - Ico', '#ffffff'),
(115, 3, 'Menu - Bt Inicial - Fundo', '#0189ff'),
(116, 3, 'Menu - Bt Inicial - borda', '#ffffff'),
(117, 3, 'Menu - Fundo', '#0189ff'),
(118, 3, 'Menu - Borda', '#ffffff'),
(119, 3, 'Menu - Texto', '#ffffff'),
(120, 3, 'Login Nome - Texto', '#000000'),
(121, 3, 'Login Nome - Fundo', '#eeeeee'),
(122, 3, 'Textos', '#333333'),
(123, 3, 'Menu - Sub - Fundo', '#ffffff'),
(124, 3, 'Menu - Sub - Texto', '#666666'),
(125, 3, 'Menu - Sub - Selecionado - Texto', '#ffffff'),
(126, 3, 'Menu - Sub - Selecionado - Fund', '#542121'),
(127, 3, 'Menu - Selecionado', '#cccccc'),
(128, 3, 'Menu Responsivo - Fundo', 'rgba(10,0,0,0.71)'),
(129, 3, 'Menu Responsivo - Links', '#ffffff'),
(130, 4, 'Fundo', '#f2f2f2'),
(131, 4, 'Icones', '#0189ff'),
(132, 4, 'Textos', '#000000'),
(133, 4, 'Linha', '#cccccc'),
(134, 4, 'Menu - Fundo', 'rgba(255,255,255,0)'),
(135, 4, 'Menu - Texto', '#000000'),
(136, 4, 'Menu - Selecionado - Fundo', '#000000'),
(137, 4, 'Menu - Selecionado - Tex', '#ffffff'),
(138, 4, 'Menu - Sub - Fundo', '#ffffff'),
(139, 4, 'Menu - Sub - Texto', '#000000'),
(140, 4, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.83)'),
(141, 4, 'Menu - Responsivo - Texto', '#ffffff'),
(142, 5, 'Fundo', '#dddddd'),
(143, 5, 'Faixa Superior - Fundo', '#333333'),
(144, 5, 'Faixa Superior - Texto', '#ffffff'),
(145, 5, 'Menu - Fundo', 'rgba(0,0,0,0)'),
(146, 5, 'Menu - Texto', '#000000'),
(147, 5, 'Linha', '#000000'),
(148, 5, 'Menu - Fundo', '#0189ff'),
(157, 5, 'Fundo', '#ffffff'),
(150, 5, 'Menu - Selecionado - Fundo', '#000000'),
(151, 5, 'Menu - Selecionado - Texto', '#ffffff'),
(152, 5, 'Menu - Sub - Fundo', '#ffffff'),
(153, 5, 'Menu - Sub - Texto', '#000000'),
(154, 5, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.46)'),
(155, 5, 'Menu - Responsivo - Texto', '#ffffff'),
(156, 5, 'Menu - Responsivo - Ico', '#000000'),
(158, 6, 'Textos', '#999999'),
(159, 6, 'Menu - Barra', '#000000'),
(160, 6, 'Menu - Texto', '#ffffff'),
(161, 6, 'Icos', '#666666'),
(162, 6, 'Busca - Borda', '#d1bdbd'),
(163, 6, 'Busca - Texto', '#cca2a2'),
(164, 6, 'Busca - Fundo', '#ffffff'),
(165, 6, 'Icos - Bordas', '#cccccc'),
(166, 6, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.56)'),
(167, 6, 'Menu - Responsivo - Texto', '#ffffff'),
(168, 6, 'Menu - Selecionado - Texto', '#b54949'),
(169, 6, 'Menu - Sub - Fundo', '#ffffff'),
(170, 6, 'Menu - Sub - Texto', '#000000'),
(171, 6, 'Menu - Responsivo - Ico', '#ffffff'),
(182, 6, 'Menu - Selecionado - Fundo', '#000000'),
(183, 7, 'Fundo', '#282828'),
(184, 7, 'Menu - Texto', '#ffffff'),
(185, 7, 'Menu - Selecionado - Fundo', '#000000'),
(186, 7, 'Menu - Selecionado - Texto', '#cccccc'),
(187, 7, 'Menu - Sub - Fundo', '#ffffff'),
(188, 7, 'Menu - Sub - Texto', '#000000'),
(189, 7, 'Menu - Responsivo - Fundo', '#000000'),
(190, 7, 'Menu - Responsivo - Texto', '#ffffff'),
(191, 8, 'Fundo', '#ffffff'),
(192, 8, 'Faixa Superior - Fundo', '#333333'),
(193, 8, 'Faixa Superior - Texto', '#ffffff'),
(194, 8, 'Menu - Texto', '#000000'),
(195, 8, 'Menu - Sub - Fundo', '#ffffff'),
(196, 8, 'Menu - Sub - Texto', '#000000'),
(197, 8, 'Menu - Fundo', 'rgba(255,255,255,0)'),
(198, 8, 'Menu - Selecionado - Fundo', 'rgba(255,255,255,0)'),
(199, 8, 'Menu - Selecionado - Bord', '#7a3535'),
(200, 8, 'Menu - Selecionado - Texto', '#000000'),
(201, 8, 'Menu Responsivo - Fundo', '#000000'),
(202, 8, 'Menu Responsivo - Texto', '#ffffff'),
(203, 9, 'Fundo', '#27183b'),
(204, 9, 'Menu - Fundo', 'rgba(0,0,0,0)'),
(205, 9, 'Menu - Texto', '#ffffff'),
(206, 9, 'Menu - Selecionado - Fundo', 'rgba(0,0,0,0)'),
(207, 9, 'Menu - Selecionado - Texto', '#cccccc'),
(208, 9, 'Menu - Selecionado - Borda', '#ffffff'),
(209, 9, 'Menu - Sub - Fundo', '#ffffff'),
(210, 9, 'Menu - Sub - Texto', '#000000'),
(211, 9, 'Menu - Responsivo - Fundo', '#000000'),
(212, 9, 'Menu - Responsivo - Texto', '#ffffff'),
(213, 10, 'Fundo', 'rgba(0,0,0,0.24)'),
(214, 10, 'Menu - Fundo', 'rgba(0,0,0,0)'),
(215, 10, 'Menu - Responsivo - Fundo', '#000000'),
(218, 10, 'Menu - Selecionado - Fundo', 'rgba(0,0,0,0.65)'),
(219, 10, 'Menu - Selecionado - Texto', '#ffffff'),
(220, 10, 'Menu - Sub - Fundo', 'rgba(0,0,0,0.51)'),
(221, 10, 'Menu - Sub - Texto', '#ffffff'),
(222, 10, 'Menu - Texto', '#ffffff'),
(223, 10, 'Menu - Responsivo - Texto', '#ffffff'),
(224, 10, 'Fundo ao decer', 'rgba(0,0,0,0.85)'),
(225, 10, 'Fundo - Responsivo', '#000000'),
(248, 11, 'Menu Responsivo Texto', '#fff'),
(249, 11, 'Menu Responsivo Fundo', '#999'),
(247, 11, 'Menu Responsivo Ico', '#000'),
(246, 11, 'Sub-menu Fundo', '#fff'),
(244, 11, 'Menu Selecionado Fundo', '#ccc'),
(245, 11, 'Menu Selecionado Texto', '#000'),
(243, 11, 'Busca Fundo', '#fff'),
(242, 11, 'Busca Texto', '#999'),
(241, 11, 'Borda Busca', '#eee'),
(237, 11, 'Fundo', '#fff'),
(238, 11, 'Fundo Menu', '#333'),
(239, 11, 'Menu Texto', '#fff'),
(240, 11, 'Sub-menu Texto', '#fff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_topos_cores_sel`
--

CREATE TABLE `layout_topos_cores_sel` (
  `id` int NOT NULL,
  `topo_codigo` varchar(100) DEFAULT NULL,
  `topo_modelo` int DEFAULT NULL,
  `cor_id` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `cor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_topos_cores_sel`
--

INSERT INTO `layout_topos_cores_sel` (`id`, `topo_codigo`, `topo_modelo`, `cor_id`, `titulo`, `cor`) VALUES
(1, '159426563224767', 1, 78, 'Busca Texto', '#000000'),
(2, '159426563224767', 1, 77, 'Busca bordas', '#cccccc'),
(3, '159426563224767', 1, 87, 'Busca fundo', '#ffffff'),
(4, '159426563224767', 1, 85, 'Faixa fone e redes sociais - fundo', '#000000'),
(5, '159426563224767', 1, 86, 'Faixa fone e redes sociais - texto', '#ffffff'),
(6, '159426563224767', 1, 76, 'Fundo', '#ffffff'),
(7, '159426563224767', 1, 89, 'Icones', '#0189ff'),
(8, '159426563224767', 1, 93, 'Menu - Selecionado', '#999999'),
(9, '159426563224767', 1, 61, 'Menu - Sub - Fundo', '#ffffff'),
(10, '159426563224767', 1, 94, 'Menu - Sub - Fundo - Bordas', '#dddddd'),
(11, '159426563224767', 1, 62, 'Menu - Sub - Links', '#000000'),
(12, '159426563224767', 1, 91, 'Menu - Sub - Marcas - Fundo', '#dddddd'),
(13, '159426563224767', 1, 92, 'Menu - Sub - Marcas - Texto', '#000000'),
(14, '159426563224767', 1, 90, 'Menu - Sub - Titulo', '#666666'),
(15, '159426563224767', 1, 54, 'Menu fundo', '#0189ff'),
(16, '159426563224767', 1, 56, 'Menu texto', '#ffffff'),
(17, '159426563224767', 1, 88, 'Textos', '#666666'),
(18, '159426563224767', 2, 95, 'Busca Texto', '#000000'),
(19, '159426563224767', 2, 96, 'Busca bordas', '#cccccc'),
(20, '159426563224767', 2, 97, 'Busca fundo', '#ffffff'),
(21, '159426563224767', 2, 99, 'Faixa fone e redes sociais - fundo', '#000000'),
(22, '159426563224767', 2, 98, 'Faixa fone e redes sociais - texto', '#ffffff'),
(23, '159426563224767', 2, 100, 'Fundo', '#ffffff'),
(24, '159426563224767', 2, 101, 'Icones', '#0189ff'),
(25, '159426563224767', 2, 102, 'Menu - Selecionado', '#999999'),
(26, '159426563224767', 2, 103, 'Menu - Sub - Fundo', '#ffffff'),
(27, '159426563224767', 2, 104, 'Menu - Sub - Fundo - Bordas', '#dddddd'),
(28, '159426563224767', 2, 105, 'Menu - Sub - Links', '#000000'),
(29, '159426563224767', 2, 106, 'Menu - Sub - Marcas - Fundo', '#dddddd'),
(30, '159426563224767', 2, 107, 'Menu - Sub - Marcas - Texto', '#000000'),
(31, '159426563224767', 2, 108, 'Menu - Sub - Titulo', '#666666'),
(32, '159426563224767', 2, 109, 'Menu fundo', '#0189ff'),
(33, '159426563224767', 2, 110, 'Menu texto', '#ffffff'),
(34, '159426563224767', 2, 111, 'Textos', '#000000'),
(35, '159426563224767', 3, 112, 'Fundo', '#ffffff'),
(36, '159426563224767', 3, 121, 'Login Nome - Fundo', '#eeeeee'),
(37, '159426563224767', 3, 120, 'Login Nome - Texto', '#000000'),
(38, '159426563224767', 3, 113, 'Logo - Fundo', '#eeeeee'),
(39, '159426563224767', 3, 118, 'Menu - Borda', '#ffffff'),
(40, '159426563224767', 3, 115, 'Menu - Bt Inicial - Fundo', '#0189ff'),
(41, '159426563224767', 3, 114, 'Menu - Bt Inicial - Ico', '#ffffff'),
(42, '159426563224767', 3, 116, 'Menu - Bt Inicial - borda', '#ffffff'),
(43, '159426563224767', 3, 117, 'Menu - Fundo', '#0189ff'),
(44, '159426563224767', 3, 127, 'Menu - Selecionado', '#cccccc'),
(45, '159426563224767', 3, 123, 'Menu - Sub - Fundo', '#ffffff'),
(46, '159426563224767', 3, 126, 'Menu - Sub - Selecionado - Fund', '#542121'),
(47, '159426563224767', 3, 125, 'Menu - Sub - Selecionado - Texto', '#ffffff'),
(48, '159426563224767', 3, 124, 'Menu - Sub - Texto', '#666666'),
(49, '159426563224767', 3, 119, 'Menu - Texto', '#ffffff'),
(50, '159426563224767', 3, 128, 'Menu Responsivo - Fundo', 'rgba(10,0,0,0.71)'),
(51, '159426563224767', 3, 129, 'Menu Responsivo - Links', '#ffffff'),
(52, '159426563224767', 3, 122, 'Textos', '#333333'),
(53, '159426563224767', 4, 130, 'Fundo', '#f2f2f2'),
(54, '159426563224767', 4, 131, 'Icones', '#0189ff'),
(55, '159426563224767', 4, 133, 'Linha', '#cccccc'),
(56, '159426563224767', 4, 134, 'Menu - Fundo', 'rgba(255,255,255,0)'),
(57, '159426563224767', 4, 140, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.83)'),
(58, '159426563224767', 4, 141, 'Menu - Responsivo - Texto', '#ffffff'),
(59, '159426563224767', 4, 136, 'Menu - Selecionado - Fundo', '#000000'),
(60, '159426563224767', 4, 137, 'Menu - Selecionado - Tex', '#ffffff'),
(61, '159426563224767', 4, 138, 'Menu - Sub - Fundo', '#ffffff'),
(62, '159426563224767', 4, 139, 'Menu - Sub - Texto', '#000000'),
(63, '159426563224767', 4, 135, 'Menu - Texto', '#000000'),
(64, '159426563224767', 4, 132, 'Textos', '#000000'),
(65, '159426563224767', 5, 143, 'Faixa Superior - Fundo', '#333333'),
(66, '159426563224767', 5, 144, 'Faixa Superior - Texto', '#ffffff'),
(67, '159426563224767', 5, 142, 'Fundo', '#dddddd'),
(68, '159426563224767', 5, 157, 'Fundo', '#ffffff'),
(69, '159426563224767', 5, 147, 'Linha', '#000000'),
(70, '159426563224767', 5, 145, 'Menu - Fundo', 'rgba(0,0,0,0)'),
(71, '159426563224767', 5, 148, 'Menu - Fundo', '#0189ff'),
(72, '159426563224767', 5, 154, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.46)'),
(73, '159426563224767', 5, 156, 'Menu - Responsivo - Ico', '#000000'),
(74, '159426563224767', 5, 155, 'Menu - Responsivo - Texto', '#ffffff'),
(75, '159426563224767', 5, 150, 'Menu - Selecionado - Fundo', '#000000'),
(76, '159426563224767', 5, 151, 'Menu - Selecionado - Texto', '#ffffff'),
(77, '159426563224767', 5, 152, 'Menu - Sub - Fundo', '#ffffff'),
(78, '159426563224767', 5, 153, 'Menu - Sub - Texto', '#000000'),
(79, '159426563224767', 5, 146, 'Menu - Texto', '#000000'),
(80, '159426563224767', 6, 162, 'Busca - Borda', '#530488'),
(81, '159426563224767', 6, 164, 'Busca - Fundo', '#ffffff'),
(82, '159426563224767', 6, 163, 'Busca - Texto', '#555555'),
(83, '159426563224767', 6, 161, 'Icos', '#d90000'),
(84, '159426563224767', 6, 165, 'Icos - Bordas', '#cccccc'),
(85, '159426563224767', 6, 159, 'Menu - Barra', '#530488'),
(86, '159426563224767', 6, 166, 'Menu - Responsivo - Fundo', 'rgba(0,0,0,0.56)'),
(87, '159426563224767', 6, 171, 'Menu - Responsivo - Ico', '#ffffff'),
(88, '159426563224767', 6, 167, 'Menu - Responsivo - Texto', '#ffffff'),
(89, '159426563224767', 6, 182, 'Menu - Selecionado - Fundo', '#530488'),
(90, '159426563224767', 6, 168, 'Menu - Selecionado - Texto', '#ffffff'),
(91, '159426563224767', 6, 169, 'Menu - Sub - Fundo', '#ffffff'),
(92, '159426563224767', 6, 170, 'Menu - Sub - Texto', '#000000'),
(93, '159426563224767', 6, 160, 'Menu - Texto', '#ffffff'),
(94, '159426563224767', 6, 158, 'Textos', '#999999'),
(95, '159426563224767', 7, 183, 'Fundo', '#ffffff'),
(96, '159426563224767', 7, 189, 'Menu - Responsivo - Fundo', '#cfcfcf'),
(97, '159426563224767', 7, 190, 'Menu - Responsivo - Texto', '#454545'),
(98, '159426563224767', 7, 185, 'Menu - Selecionado - Fundo', '#ffbf00'),
(99, '159426563224767', 7, 186, 'Menu - Selecionado - Texto', '#ffffff'),
(100, '159426563224767', 7, 187, 'Menu - Sub - Fundo', '#ffffff'),
(101, '159426563224767', 7, 188, 'Menu - Sub - Texto', '#000000'),
(102, '159426563224767', 7, 184, 'Menu - Texto', '#454545'),
(103, '159426563224767', 8, 192, 'Faixa Superior - Fundo', '#333333'),
(104, '159426563224767', 8, 193, 'Faixa Superior - Texto', '#ffffff'),
(105, '159426563224767', 8, 191, 'Fundo', '#ffffff'),
(106, '159426563224767', 8, 197, 'Menu - Fundo', 'rgba(255,255,255,0)'),
(107, '159426563224767', 8, 199, 'Menu - Selecionado - Bord', '#7a3535'),
(108, '159426563224767', 8, 198, 'Menu - Selecionado - Fundo', 'rgba(255,255,255,0)'),
(109, '159426563224767', 8, 200, 'Menu - Selecionado - Texto', '#000000'),
(110, '159426563224767', 8, 195, 'Menu - Sub - Fundo', '#ffffff'),
(111, '159426563224767', 8, 196, 'Menu - Sub - Texto', '#000000'),
(112, '159426563224767', 8, 194, 'Menu - Texto', '#000000'),
(113, '159426563224767', 8, 201, 'Menu Responsivo - Fundo', '#000000'),
(114, '159426563224767', 8, 202, 'Menu Responsivo - Texto', '#ffffff'),
(115, '159426563224767', 9, 203, 'Fundo', '#27183b'),
(116, '159426563224767', 9, 204, 'Menu - Fundo', 'rgba(0,0,0,0)'),
(117, '159426563224767', 9, 211, 'Menu - Responsivo - Fundo', '#000000'),
(118, '159426563224767', 9, 212, 'Menu - Responsivo - Texto', '#ffffff'),
(119, '159426563224767', 9, 208, 'Menu - Selecionado - Borda', '#ffffff'),
(120, '159426563224767', 9, 206, 'Menu - Selecionado - Fundo', 'rgba(0,0,0,0)'),
(121, '159426563224767', 9, 207, 'Menu - Selecionado - Texto', '#cccccc'),
(122, '159426563224767', 9, 209, 'Menu - Sub - Fundo', '#ffffff'),
(123, '159426563224767', 9, 210, 'Menu - Sub - Texto', '#000000'),
(124, '159426563224767', 9, 205, 'Menu - Texto', '#ffffff'),
(125, '159426563224767', 10, 213, 'Fundo', '#ffffff'),
(126, '159426563224767', 10, 225, 'Fundo - Responsivo', '#eeeeee'),
(127, '159426563224767', 10, 224, 'Fundo ao decer', '#eeeeee'),
(128, '159426563224767', 10, 214, 'Menu - Fundo', '#eeeeee'),
(129, '159426563224767', 10, 215, 'Menu - Responsivo - Fundo', '#eeeeee'),
(130, '159426563224767', 10, 223, 'Menu - Responsivo - Texto', '#4d4d4d'),
(131, '159426563224767', 10, 218, 'Menu - Selecionado - Fundo', '#146e37'),
(132, '159426563224767', 10, 219, 'Menu - Selecionado - Texto', '#ffffff'),
(133, '159426563224767', 10, 220, 'Menu - Sub - Fundo', 'rgba(0,0,0,0.51)'),
(134, '159426563224767', 10, 221, 'Menu - Sub - Texto', '#ffffff'),
(135, '159426563224767', 10, 222, 'Menu - Texto', '#2e2e2e'),
(136, '159426563224767', 11, 237, 'Fundo', '#f2f2f2'),
(137, '159426563224767', 11, 238, 'Fundo Menu', '#e94e1b'),
(138, '159426563224767', 11, 239, 'Menu Texto', '#ffffff'),
(139, '159426563224767', 11, 240, 'Sub-menu Texto', '#ffffff'),
(140, '159426563224767', 11, 243, 'Busca Fundo', '#ffffff'),
(141, '159426563224767', 11, 242, 'Busca Texto', '#999999'),
(142, '159426563224767', 11, 241, 'Borda Busca', '#eeeeee'),
(143, '159426563224767', 11, 244, 'Menu Selecionado Fundo', '#006633'),
(144, '159426563224767', 11, 245, 'Menu Selecionado Texto', '#ffffff'),
(145, '159426563224767', 11, 246, 'Sub-menu Fundo', '#000000'),
(146, '159426563224767', 11, 247, 'Menu Responsivo Ico', '#ffffff'),
(147, '159426563224767', 11, 248, 'Menu Responsivo Texto', '#ffffff'),
(148, '159426563224767', 11, 249, 'Menu Responsivo Fundo', '#006633');

-- --------------------------------------------------------

--
-- Estrutura para tabela `layout_topos_modelos`
--

CREATE TABLE `layout_topos_modelos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layout_topos_modelos`
--

INSERT INTO `layout_topos_modelos` (`id`, `codigo`, `titulo`) VALUES
(6, '6', 'Divino');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcadagua`
--

CREATE TABLE `marcadagua` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `imagem` varchar(240) DEFAULT NULL,
  `posicao` int DEFAULT NULL,
  `preencher` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `meta`
--

CREATE TABLE `meta` (
  `id` int NOT NULL,
  `titulo_pagina` varchar(240) DEFAULT NULL,
  `keywords1` text,
  `keywords2` text,
  `descricao` text,
  `analytics` text,
  `forcar_ssl` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `meta`
--

INSERT INTO `meta` (`id`, `titulo_pagina`, `keywords1`, `keywords2`, `descricao`, `analytics`, `forcar_ssl`) VALUES
(1, 'Nome do Site', '', '', 'Nome do Site', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia`
--

CREATE TABLE `noticia` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `autor` varchar(240) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `amigavel` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia`
--

INSERT INTO `noticia` (`id`, `codigo`, `categoria`, `data`, `titulo`, `autor`, `previa`, `conteudo`, `amigavel`) VALUES
(27, '160502464292362', '159464397678108', 1614791400, '16 razões para criar um site novo para sua empresa', '', 'Único álbum do grupo vendeu milhões de cópias e fez do quinteto um dos maiores fenômenos da década de 90.', '', '16-razões- para- criar- um- site- novo- para- suaempresa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_autores`
--

CREATE TABLE `noticia_autores` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `descricao` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_autores`
--

INSERT INTO `noticia_autores` (`id`, `codigo`, `nome`, `imagem`, `descricao`) VALUES
(8, '159449954011145', 'Casa Praia', 'logo-[09-11-20][15-50-29].png', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_categorias`
--

CREATE TABLE `noticia_categorias` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_categorias`
--

INSERT INTO `noticia_categorias` (`id`, `codigo`, `titulo`) VALUES
(40, '159464264677250', 'Ofertas'),
(42, '159464397678108', 'Matérias'),
(43, '159464399377260', 'Dicas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_destaque`
--

CREATE TABLE `noticia_destaque` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_grupos`
--

CREATE TABLE `noticia_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `itens_por_linha` int DEFAULT NULL,
  `formato` int DEFAULT '1',
  `mostrar_titulo` int DEFAULT '0',
  `mostrar_categorias` int DEFAULT '0',
  `itens_por_pagina` int DEFAULT '3',
  `marcados` int DEFAULT '1',
  `max_itens` int DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `mostrar_banners` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_grupos_sel`
--

CREATE TABLE `noticia_grupos_sel` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `noticia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_grupos_sel`
--

INSERT INTO `noticia_grupos_sel` (`id`, `grupo`, `noticia`) VALUES
(4, '159464169932659', '159464357690724'),
(5, '159464169932659', '159465600939256'),
(6, '159536219643524', '159533871631363'),
(7, '159536219643524', '159533858670334'),
(8, '160494776116123', '160494958836566'),
(9, '160494999647059', '160494958836566'),
(10, '160501805518755', '160502464292362');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_imagem`
--

CREATE TABLE `noticia_imagem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_imagem`
--

INSERT INTO `noticia_imagem` (`id`, `codigo`, `imagem`) VALUES
(89, '160502464292362', 'noticia1-[18-05-21][18-19-03].jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_imagem_legenda`
--

CREATE TABLE `noticia_imagem_legenda` (
  `id` int NOT NULL,
  `id_img` varchar(100) DEFAULT NULL,
  `legenda` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_imagem_legenda`
--

INSERT INTO `noticia_imagem_legenda` (`id`, `id_img`, `legenda`) VALUES
(2, '40', 'rrrrr'),
(3, '58', 'Legenda 1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_imagem_ordem`
--

CREATE TABLE `noticia_imagem_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_imagem_ordem`
--

INSERT INTO `noticia_imagem_ordem` (`id`, `codigo`, `data`) VALUES
(1, '157669245994679', '29'),
(2, '158027407512994', '30'),
(3, '158027414654901', '31'),
(4, '158027424681308', '32'),
(5, '158027424681308', '32,33'),
(6, '158498264774568', '34'),
(7, '159449575923106', '35'),
(8, '159449575923106', '35,36'),
(9, '159449575923106', '35,36,37'),
(10, '159449575923106', '35,36,37,38'),
(11, '159449575923106', '35,36,37,38,39'),
(12, '159449575923106', '36,35,37,38,39'),
(13, '159449575923106', '38,36,35,37,39'),
(14, '159464357690724', '40'),
(15, '159464357690724', '40,41'),
(16, '159464357690724', '40,41,42'),
(17, '159464357690724', '40,41,42,43'),
(18, '159464357690724', '41,40,42,43'),
(19, '159464357690724', '42,41,43'),
(20, '159464357690724', '42,41,43,44'),
(21, '159464357690724', '42,41,43,44,45'),
(22, '159464357690724', '42,41,43,44,45,46'),
(23, '159464357690724', '42,41,43,44,45,46,47'),
(24, '159464357690724', '42,41,43,44,45,46,47,48'),
(25, '159533813626865', '49'),
(26, '159533821185704', '50'),
(27, '159533829183192', '51'),
(28, '159533842273038', '52'),
(29, '159533845940722', '53'),
(30, '159533849727653', '54'),
(31, '159533852571763', '55'),
(32, '159533858670334', '56'),
(33, '159533863538240', '57'),
(34, '159533871631363', '58'),
(35, '159533875625623', '59'),
(36, '159533871631363', '58,60'),
(37, '160494958836566', '61'),
(38, '160494958836566', '61,62'),
(39, '160494958836566', '61,62,63'),
(40, '160494958836566', '61,62,63,64'),
(41, '160494958836566', '61,62,63,64,65'),
(42, '160494958836566', '61,62,63,64,65,66'),
(43, '160494958836566', '61,62,63,64,65,66,67'),
(44, '160501823455187', '68'),
(45, '160502464292362', '69'),
(46, '160502464292362', '69,70'),
(47, '160502464292362', '69,70,71'),
(48, '160502464292362', '69,70,71,72'),
(49, '160502464292362', '69,70,71,72,73'),
(50, '160502464292362', '69,70,71,72,73,74'),
(51, '160502464292362', '69,70,71,72,73,74,75'),
(52, '160502464292362', '69,70,71,72,73,74,75,76'),
(53, '160501823455187', '68,77'),
(54, '160501823455187', '68,77,78'),
(55, '160501823455187', '68,77,78,79'),
(56, '160501823455187', '68,77,78,79,80'),
(57, '160501823455187', '68,77,78,79,80,81'),
(58, '160501823455187', '68,77,78,79,80,81,82'),
(59, '160501823455187', '68,77,78,79,80,81,82,83'),
(60, '160501823455187', '68,77,78,79,80,81,82,83,84'),
(61, '160501823455187', '79,77,78,80,81,82,83,84'),
(62, '160502464292362', '69,70,71,72,73,74,75,76,85'),
(63, '160502464292362', '69,70,71,72,73,74,75,76,85,86'),
(64, '160502464292362', '86,85'),
(65, '160501823455187', '79,77,78,80,81,82,83,84,87'),
(66, '161478197026754', '88'),
(67, '160502464292362', '86,85,89');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_marcadagua`
--

CREATE TABLE `noticia_marcadagua` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `noticia_marcadagua`
--

INSERT INTO `noticia_marcadagua` (`id`, `codigo`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `desconto_fixo` double DEFAULT NULL,
  `desconto_porc` double DEFAULT NULL,
  `ativo` int DEFAULT NULL,
  `email_pagseguro` varchar(255) DEFAULT NULL,
  `token_retorno_pagseguro` text,
  `mercadopago_client_id` varchar(255) DEFAULT NULL,
  `mercadopago_client_secret` varchar(255) DEFAULT NULL,
  `mercadopago_public_key` text,
  `mercadopago_access_token` text,
  `deposito_dados` text,
  `gerencianet_clientId` varchar(255) DEFAULT NULL,
  `gerencianet_clientSecret` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `titulo`, `desconto_fixo`, `desconto_porc`, `ativo`, `email_pagseguro`, `token_retorno_pagseguro`, `mercadopago_client_id`, `mercadopago_client_secret`, `mercadopago_public_key`, `mercadopago_access_token`, `deposito_dados`, `gerencianet_clientId`, `gerencianet_clientSecret`) VALUES
(1, 'PagSeguro', 0, 0, 0, 'aaaaaaaaaaaaaaaaaaa222', 'bbbbbbbb222', '', '', NULL, NULL, '', '', ''),
(2, 'Depósito Bancário', 0, 0, 0, '', '', '', '', NULL, NULL, 'dsdsfsdf', '', ''),
(3, 'MercadoPago', 0, 0, 1, '', '', 'aaaaaaaaaaa', 'bbbbbbbbbb', 'asdasd', 'asdasd', '', '', ''),
(4, 'Boleto', 0, 0, 1, '', '', '', '', NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `parceiros`
--

CREATE TABLE `parceiros` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `parceiros_grupos`
--

CREATE TABLE `parceiros_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `parceiros_ordem`
--

CREATE TABLE `parceiros_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_loja`
--

CREATE TABLE `pedido_loja` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `cadastro` varchar(255) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `vencimento` int DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `cupom` varchar(255) DEFAULT NULL,
  `cupom_promocao` varchar(255) DEFAULT NULL,
  `cupom_desconto_fixo` double DEFAULT '0',
  `cupom_desconto_porc` double DEFAULT '0',
  `cep_destino` varchar(100) DEFAULT NULL,
  `frete` varchar(255) DEFAULT NULL,
  `frete_titulo` varchar(255) DEFAULT NULL,
  `frete_valor` double DEFAULT '0',
  `frete_balcao` varchar(255) DEFAULT NULL,
  `valor_produtos` double DEFAULT '0',
  `valor_produtos_desc` double DEFAULT '0',
  `valor_total` double DEFAULT '0',
  `valor_pago` double DEFAULT '0',
  `forma_pagamento` varchar(255) DEFAULT NULL,
  `forma_pagamento_desc_fixo` double DEFAULT '0',
  `forma_pagamento_desc_porc` double DEFAULT '0',
  `id_transacao` varchar(255) DEFAULT NULL,
  `link_boleto` text,
  `codigo_envio` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_loja_carrinho`
--

CREATE TABLE `pedido_loja_carrinho` (
  `id` int NOT NULL,
  `sessao` varchar(100) DEFAULT NULL,
  `produto` varchar(255) DEFAULT NULL,
  `produto_titulo` varchar(255) DEFAULT NULL,
  `produto_subtitulo` varchar(255) DEFAULT NULL,
  `produto_valor` double DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT NULL,
  `tamanho_titulo` varchar(255) DEFAULT NULL,
  `tamanho_valor` double DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `cor_titulo` varchar(255) DEFAULT NULL,
  `cor_valor` double DEFAULT NULL,
  `variacao` varchar(255) DEFAULT NULL,
  `variacao_titulo` varchar(255) DEFAULT NULL,
  `variacao_valor` double DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor_arte` double DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `reserva_estoque` int DEFAULT '1',
  `tipoarte` int DEFAULT NULL,
  `modelo_codigo` varchar(255) DEFAULT NULL,
  `dados_arte` text,
  `arquivo_arte` varchar(255) DEFAULT NULL,
  `arte_acabamento` varchar(255) DEFAULT NULL,
  `tipo_envio` int DEFAULT NULL,
  `tam_largura` varchar(255) DEFAULT NULL,
  `tam_altura` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_loja_mensagens`
--

CREATE TABLE `pedido_loja_mensagens` (
  `id` int NOT NULL,
  `pedido` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `msg` text,
  `anexo` varchar(255) DEFAULT NULL,
  `lida` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_loja_status`
--

CREATE TABLE `pedido_loja_status` (
  `id` int NOT NULL,
  `codigo` int DEFAULT NULL,
  `ordem` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pedido_loja_status`
--

INSERT INTO `pedido_loja_status` (`id`, `codigo`, `ordem`, `status`) VALUES
(1, 0, 0, 'Incompleto'),
(2, 1, 1, 'Aguardando Pagamento'),
(3, 4, 2, 'Pagamento Confirmado'),
(4, 3, 3, 'Verificação de arquivos'),
(5, 12, 4, 'Arquivo com problema'),
(6, 14, 5, 'Criando/Alterando arte'),
(7, 13, 6, 'Em produção'),
(8, 5, 7, 'Expedição'),
(9, 8, 8, 'Em transporte'),
(10, 9, 9, 'Disponível para retirada'),
(11, 6, 10, 'Material entregue'),
(12, 7, 11, 'Cancelado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos`
--

CREATE TABLE `planos` (
  `id` int UNSIGNED NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(100) DEFAULT NULL,
  `icone` varchar(600) DEFAULT NULL,
  `descricao` text,
  `imagem_fundo` varchar(255) DEFAULT NULL,
  `enderecolink` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `planos`
--

INSERT INTO `planos` (`id`, `grupo`, `codigo`, `titulo`, `valor`, `endereco`, `imagem`, `icone`, `descricao`, `imagem_fundo`, `enderecolink`) VALUES
(245, '164639684064763', '164656919069587', 'Site para Provedor de Internet', 150, 'https://www.provedor.hostlocal.com.br/', 'Site-para-Provedor-de-Internet-[06-03-22][09-20-54].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.3', NULL, '#'),
(134, '162775883089827', '162776004880949', 'SCRIPT SITE PARA PROVEDOR DE INTERNET COM PAINEL ADMIN EM PHP', 43, 'https://provedor2.scriptlivre.top/', 'prove2-[21-01-24][03-08-39].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Provedores de Internet 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.0 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(133, '162775883089827', '162775982748630', 'SCRIPT SITE PRONTO PROVEDOR DE INTERNET EM PHP COM PAINEL ADMIN', 77, 'https://provedor3.scriptlivre.top/', 'prove-[21-01-24][03-04-41].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Provedores de Internet 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.0 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', '', 'https://wa.me/5511961817094'),
(274, '164657348779404', '164657388382009', 'Sistema de Rifas Online v3', 200, 'https://rifa.divinohost.com.br/', 'Sistema-de-Rifas-Online-v3-[06-03-22][10-54-06].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3 em WordPress', NULL, '#'),
(278, '164657225577697', '164657582881304', 'Vitrine IPTV em WORDPRESS', 100, 'https://iptvwp.divinosilva.com.br/', 'Vitrine-IPTV-em-WORDPRES-[06-03-22][11-11-28].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3, Com Plugins, Elementor', NULL, '#'),
(244, '164639684064763', '164656909612962', 'Total Construção em WordPress', 60, 'https://www.totalconstrucao.divinosilva.com.br/', 'Total-Construçao-em-WordPres-[06-03-22][09-34-00].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 5.6 a 7.0', NULL, '#'),
(240, '164639679980918', '164656850789973', 'Portal de Noticias PHP MYSQL', 150, 'https://portal.hostlocal.com.br/', 'Portal-de-Noticias-PHP-MYSQL-[06-03-22][09-09-17].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2', NULL, '#'),
(235, '164639682583165', '164656758842928', 'Script Imobiliária Real State', 100, 'https://imobiliaria.divinohost.com.br/', 'Script-Imobiliaria-Real-State-[06-03-22][08-54-23].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.0 COM AREA DE ADS', NULL, '#'),
(261, '164639681116192', '164657136452003', 'Script Web TV Online', 60, 'https://tv.hostlocal.com.br/', 'Script-Web-TV-Online-[06-03-22][09-56-55].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Joomla, Cpanel PHP 7.0', NULL, '#'),
(281, '162775883089827', '164657650088899', 'SCRIPT CASSINO EM PHP/LARAVEL, 13 JOGOS ORIGINAIS, INTEGRADO COM MERCADOPAGO', 230, 'https://www.cassino.scriptlivre.top', 'casino-[21-01-24][02-31-54].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'O propósito dessa sistema é ter sua própria plataforma de cassino com um baixo investimento e um retorno de 100% dos ganhos, pois como os jogos são próprios da plataforma você não terá que repassar % para provedores de jogos que fornecem API para integração, ao invés de pagar um valor altíssimo e uma % para eles, você ficará com o valor total dos lucros.', NULL, 'https://wa.me/5511961817094'),
(141, '162775883089827', '162777386827669', 'SCRIPT SITE PRONTO TEMA SEGURANÇA ELETRÔNICA EM PHP COM PAINEL ADMIN', 35.9, 'https://institucional.scriptlivre.top', 'Insti-[21-01-24][02-45-36].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Vitrine de Produtos 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..\r\n', NULL, 'https://wa.me/5511961817094'),
(142, '162775883089827', '162777403626910', 'SCRIPT SITE IMOBILIÁRIA E CORRETORES DE IMÓVEIS EM PHP', 50, 'https://imobiliaria.scriptlivre.top/', 'imo-[21-01-24][03-11-37].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>', 'Site Imobiliárias e Corretores 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.4 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(143, '162775883089827', '162777418942544', 'Mega Pack 10.000 Landing Pages + Elementor Pro + Pack Canva', 13.99, '#', 'D-NQ-NP-73560-MLB7202391083-092023-O-[21-01-24][14-11-44].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>', 'Mega Pack 10.000 Landing Pages + Elementor Pro + Pack Canva', NULL, 'https://wa.me/5511961817094'),
(237, '164626484342197', '164656805727169', 'Delivery online via WhatsApp', 100, 'https://delivery.divinohost.com.br/', 'Delivery-online-via-WhatsAp-[06-03-22][09-02-07].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 7.0 a 7.2', NULL, '#'),
(239, '164639679980918', '164656841159586', 'Portal de Noticias PHP Lavável', 150, 'http://www.portal.divinosilva.com.br/', 'Portal-de-Noticias-PHP-Lavavel-[06-03-22][09-07-47].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2', NULL, '#'),
(243, '164639684064763', '164656894473463', 'Transporte - Script PHP', 150, 'https://turismo.divinohost.com.br/', 'Transporte-Script-PHP-[06-03-22][09-16-50].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.0 a 7.2, puro PHP', NULL, '#'),
(241, '164639679980918', '164656864348578', 'Portal de Noticias Clone G1 em WP', 100, 'https://www.g1wp.hostlocal.com.br/', 'Portal-de-Noticias-Clone-G1-[06-03-22][09-11-38].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2 em WordPress', NULL, '#'),
(148, '162775883089827', '162777512284113', 'Script Delivery Php 7.x Multicardapios Integração Whatsapp', 23.99, 'https://delivery.scriptlivre.top', 'Screnshot-4-8649-zom-[21-01-24][14-15-56].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Script Delivery Php 7.x Multicardapios Revenda PHP 7.0, Mysql, CSS, Javascript   Descrição Montamos um modelo de negócio completo indicado para pessoas com espirito  empreendedor que desejam ser donos de seu próprio negócio.', NULL, 'https://wa.me/5511961817094'),
(149, '162775883089827', '162777581641649', 'SCRIPT APOSTAS ESPORTIVA/BANCA ESPORTIVA CÓDIGO FONTE', 600, 'https://fute.scriptlivre.top', 'fute-[21-01-24][14-55-02].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Seja um dono de banca esportiva profissional com o nosso exclusivo e rentável sistema esportivo.', NULL, 'https://wa.me/5511961817094'),
(150, '162775883089827', '162777597325842', 'Script Agendamento Saas - Salão', 100, 'https://agendamento.scriptlivre.top/', 'agenda-[21-01-24][15-18-49].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Script Agendamento Saas Salão PHP 7.4', NULL, 'https://wa.me/5511961817094'),
(151, '162775883089827', '162777613327882', 'Script De Catálogos Online Multilojas/Cidades Em PHP SaaS', 350, 'https://mundodocatalogo.top', 'SITEMA-CATALOGO-DIGITAL-PHP-7-4-MULTI-LOJAS-2-[21-01-24][15-46-48].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Sistema de catálogo online em PHP com multi-lojas e pedidos direto no WA, o cliente acessa o site e cria a lojinha dele e recebe os pedidos direto no WA e você dono do sistema irá lucrar em cima dos planos vendidos criados de acordo você desejar (habilitando e desabilitando diversas funções).', NULL, 'https://wa.me/5511961817094'),
(284, '162775883089827', '164657732858799', 'SCRIPT CATÁLOGO DE PRODUTO DIGITAL EM PHP COM PAINEL ADMINISTRATIVO', 120, 'https://scriptlivre.top/', 'cata-[21-01-24][03-01-30].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Vitrine de Produtos Digitais 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.0 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(226, '164639672617272', '164656582890058', 'Loja Virtual em WordPress', 100, 'https://radiowp.hostlocal.com.br/', 'Loja-Virtual-em-WordPres-[06-03-22][08-27-25].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3, Com Plugins, Elementor', NULL, '#'),
(242, '164639684064763', '164656884872909', 'ConstruTop - Sua Construtora', 150, 'https://construcao.hostlocal.com.br/', 'ConstruTop-Sua-Construtora-[06-03-22][09-15-06].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4, em WordPress , Elemetor pro', NULL, '#'),
(155, '162775883089827', '162792035549929', 'SISTEMA DE AGENDAMENTO PARA BARBEARIAS + PWA', 150, 'https://barber.scriptlivre.top/', 'barbe-[21-01-24][16-34-48].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Com esse Sistema de Agendamento + Site para Barbearias você será capaz de configurar e Revender com muita facilidade uma Plataforma completa de Agendamentos Online para Barbeiros que desejam ter Agilidade, Controle e Autoridade Digital em sua Barbearia.', NULL, 'https://wa.me/5511961817094'),
(280, '164639672617272', '164657630866191', 'Loja Perfumes Wordpress - Frete + Mercadopago + checkout personalizado + Pedidos Via Whatsapp', 50, 'https://lojas.scriptlivre.top/perfumes', 'PERFUME-[27-01-24][05-33-29].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Loja Perfumes - Wordpress - Frete + Mercadopago + checkout personalizado + Pedidos Via Whatsapp', NULL, 'https://wa.me/5511961817094'),
(157, '162775883089827', '162792092920502', 'Waziper – Whatsapp Marketing Tool', 89.9, 'https://lazap.com.br', 'OIP-[21-01-24][16-38-04].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Waziper é um software de marketing do WhatsApp baseado em PHP Script. É a melhor solução para pequenas ou grandes empresas, empresas de software, profissionais de marketing digital, bem como você pode usá-lo como software como serviço (SaaS).', NULL, 'https://wa.me/5511961817094'),
(158, '162775883089827', '162792128173629', 'Site para vender Hospedagem', 45, 'https://host.scriptlivre.top/', 'host-[21-01-24][17-07-07].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Sites Profissional para Revender Hospedagem de Site\r\nScript WordPress\r\nResponsivo', NULL, 'https://wa.me/5511961817094'),
(253, '164639681116192', '164657048811925', 'Script de Rádio Bronze', 80, 'https://www.radiobronze.divinosilva.com.br/', 'Script-de-Radio-Bronze-[06-03-22][09-42-25].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Joomla, Cpanel PHP 7.2', NULL, '#'),
(254, '164639681116192', '164657058699210', 'Script Radio BS sem Banco', 60, 'https://webdemo.divinosilva.com.br/', 'Script-Radio-BS-sem-Banco-[06-03-22][09-44-00].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel php 5.6', NULL, '#'),
(161, '162775883089827', '162792181891294', 'Site para vender Hospedagem 2', 38.99, 'https://host.scriptlivre.top/', 'host2-[21-01-24][17-09-23].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Sites Profissional para Revender Hospedagem de Site\r\nScript WordPress\r\nResponsivo', NULL, 'https://wa.me/5511961817094'),
(162, '162775883089827', '162792584946759', 'Rifa em Laravel-PHP – Sistema de rifa', 350, 'https://rifaphp.scriptlivre.top/', 'RIFA-[21-01-24][17-28-33].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Se você está pronto para dar um salto em suas rifas online, nossos modelos de site de rifas em PHP Laravel estão aqui para oferecer a solução definitiva. Aproveite as funcionalidades de um sistema de rifas incrivelmente robusto e eficiente, projetado para facilitar a criação, participação e administração de rifas de maneira excepcional.', NULL, 'https://wa.me/5511961817094'),
(163, '162775883089827', '162792603889013', 'Site para Venda de IPTV Streaming de Vídeo', 40, 'https://flix.scriptlivre.top/', 'IPTV-632-[22-01-24][01-13-15].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Venda de IPTV Streaming de Vídeo 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.0  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', '', 'https://wa.me/5511961817094'),
(164, '162775883089827', '162792621047671', 'Site para Vidraçaria', 43, 'https://vidra.scriptlivre.top/', 'vidracaria-cod-782-[22-01-24][01-18-33].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Vidraçaria 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.4  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(279, '164639684064763', '164657599472724', 'Provedor de Internet 3', 150, 'https://infohosts.divinohost.com.br/', 'Provedor-de-Internet-3-[06-03-22][11-14-23].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4, em WordPress , Elemetor pro', NULL, '#'),
(270, '164657225577697', '164657317363184', 'Site Admin para IPTV v3 Responsivo', 150, 'https://iptv.divinohost.com.br/', 'Site-Admin-para-IPTV-v3-Responsivo-[06-03-22][10-27-03].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'PHP, Responsivo, Cpanel PHP 5.6', NULL, '#'),
(168, '162775883089827', '162792684288899', 'Site Imobiliárias e Corretores', 48.9, 'https://imo.scriptlivre.top/', 'Imobiliaria-1458-[22-01-24][01-23-00].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site Imobiliárias e Corretores 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.0 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(169, '162775883089827', '162792694324731', 'Site para Locutores em PHP Puro', 50, 'https://locu.scriptlivre.top/', 'locutor-loja-dos-scripts-[22-01-24][01-37-11].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Locutores 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.4  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(252, '164657016256947', '164657026573913', 'Guia Comercial WP 2018/19', 50, 'https://www.guia.divinosilva.com.br/', 'Guia-Comercial-2018-19-[06-03-22][09-38-47].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.0 em WordPress', NULL, '#'),
(238, '164639679980918', '164656830144804', 'Portal de Noticias em WordPress', 100, 'https://www.portalwp.divinosilva.com.br/', 'Portal-de-Noticias-em-WordPres-[06-03-22][09-05-55].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3', NULL, '#'),
(236, '164626484342197', '164656788148314', 'Sistema PDV p/ Seguimentos', 120, 'https://pdv.divinosilva.com.br/', 'Sistema-PDV-pA-Seguimentos-[06-03-22][08-59-24].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Sistema PDV p/ Seguimentos', NULL, '#'),
(269, '164657225577697', '164657296937101', 'Fox IPTV', 100, 'https://foxiptv.divinohost.com.br/', 'Fox-IPTV-[06-03-22][10-24-04].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2, em WordPress , Elemetor pro', NULL, '#'),
(220, '164639672617272', '164639896066170', 'Construção Vitrine', 90, 'https://www.vitrinewp.divinosilva.com.br/', 'Construçao-Vitrine-[04-03-22][10-04-15].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 5.6 a 7.0 em WordPress', NULL, '#'),
(222, '164639672617272', '164639950428060', 'Agência Car Auto', 100, 'https://automoveis.divinosilva.com.br/', 'Agencia-Car-Auto-[04-03-22][10-12-41].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(271, '164639684064763', '164657362063563', 'Panda Resort', 100, 'https://www.resort.hostlocal.com.br/', 'Panda-Resort-[06-03-22][10-34-38].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'PHP, Responsivo, Cpanel PHP 5.6 acima', NULL, '#'),
(230, '164639672617272', '164656654021627', 'Loja em WordPress', 150, 'https://lojawp.divinohost.com.br/', 'Loja-em-em-WordPres-[06-03-22][08-36-24].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3, Com Plugins, Elementor', NULL, '#'),
(277, '162775883089827', '164657564379101', 'SCRIPT SITE INSTITUCIONAL EM PHP TEMA CONSTRUÇÃO', 40, 'https://construcao.scriptlivre.top ', 'CONSTRU-[21-01-24][02-48-32].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site Institucional tema construção  100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.0  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(232, '164639682583165', '164656689313377', 'Script Site Imobiliária 2', 150, 'https://imobiliaria2.hostlocal.com.br/', 'Script-Site-Imobiliaria-2-[06-03-22][08-42-37].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel php 5.6 a 7.1', NULL, 'https://pay.juno.com.br/checkout.html?code=84E6DA3C8C2CB655'),
(228, '164639672617272', '164656622890236', 'Site EAD', 100, 'https://www.ead.hostlocal.com.br/', 'Site-EAD-[06-03-22][08-31-24].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 7.1 a 7.4', NULL, '#'),
(229, '164639672617272', '164656638319635', 'Loja Super Commerce', 100, 'https://www.loja.divinosilva.com.br/', 'Loja-Super-Comerce-[06-03-22][08-34-24].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(227, '164639672617272', '164656611425250', 'Script Loja Virtual', 100, 'https://lojaphp.hostlocal.com.br/', 'Script-Loja-Virtual-[06-03-22][08-29-27].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.0', NULL, '#'),
(185, '162775883089827', '162793554261595', 'Script Site Para Mercado', 60, 'https://mercado.scriptlivre.top/', 'mercado-cod-6329-[22-01-24][01-45-14].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Script Site Para Mercado  100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.4 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(186, '162775883089827', '162793582999650', 'Site Para Salão de Beleza – Elementor+WordPress', 80, 'https://salao.scriptlivre.top/', 'salao-[22-01-24][02-04-38].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Template WordPress + Elementor ( Salão de Beleza )\r\n\r\nTemplate de Landing Page Completo\r\nDesign Único e Moderno\r\nOtimizado para Tablet e Mobile\r\nTemplate Editável\r\nFeito com Elementor Pro\r\nEdite todas as cores\r\nAgendamento de Horário direto no WhatsApp', NULL, 'https://wa.me/5511961817094'),
(259, '164639681116192', '164657114088747', 'Web Radio 100% Responsivo', 100, 'https://marcadapaz.divinohost.com.br/', 'Web-Radio-10-Responsivo-[06-03-22][09-53-11].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(268, '164657225577697', '164657283783297', 'IPTV WP - Sistema de Streaming', 150, 'https://iptv-wp.divinohost.com.br/', 'IPTV-WP-Sistema-de-Streaming-[06-03-22][10-21-47].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4, em WordPress , Elemetor pro', NULL, '#'),
(276, '164639672617272', '164657534751008', 'CATÁLOGO DE ROUPAS ONLINE', 100, 'https://catalago.divinosilva.com.br/', 'CATALOGO-DE-ROUPAS-ONLINE-[06-03-22][11-02-43].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.1, Com Plugins', NULL, '#'),
(275, '164639672617272', '164657517643787', 'Loja Virtual de Alta Conversão', 100, 'https://lojavirtual.hostlocal.com.br/', 'LOJA-VIRTUAL-DE-ALTA-CONVERSAO-[06-03-22][11-01-09].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.3, Com Plugins', NULL, '#'),
(265, '164657225577697', '164657256115394', 'Script Site IPTV', 100, 'https://iptv.hostlocal.com.br/', 'Script-Site-IPTV-[06-03-22][10-16-43].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'PHP, Responsivo, Cpanel PHP 5.6', NULL, '#'),
(231, '164639682583165', '164656673960960', 'Script Site Imobiliária 1', 100, 'https://imobiliaria.hostlocal.com.br/', 'Script-Site-Imobiliaria-1-[06-03-22][08-40-23].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel php 5.6', NULL, 'https://pay.juno.com.br/checkout.html?code=F162AE11B75C6F33'),
(221, '164639672617272', '164639918495692', 'Vitrine Host Local', 150, 'https://hostlocal.com.br/', 'Vitrine-Host-Local-[04-03-22][10-07-27].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Responsivo, Cpanel PHP 7.0 acima', NULL, 'https://checkout.juno.com.br/#/paymentLink/74902873E44DEEB8/copy'),
(258, '164639681116192', '164657104081442', 'Player de Web Radio', 30, 'https://player.hostlocal.com.br/', 'Player-de-Web-Radio-[06-03-22][09-51-40].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(195, '162775883089827', '162793723922549', 'Loja Virtual Produtos Infantis – Elementor – WordPress', 50, 'https://lojainfanto.scriptlivre.top/', 'infanto-[22-01-24][02-57-06].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Script Para loja virtual super completa , com painel de administração, código aberto você poderá modificar da forma que quiser desde que tenha conhecimento básico em WordPress Elementor, painel de administração super fácil e modificado, Acompanha vídeo aula de instalação e vídeos de administração do site, com um pouco de conhecimento  você poderá modificar as cores do site  e muitas outras coisas,', NULL, 'https://wa.me/5511961817094'),
(196, '162775883089827', '162793734538776', 'SCRIPT SITE PARA GARAGEM DE VEÍCULOS EM PHP RESPONSIVO', 39.99, 'https://carros.scriptlivre.top', 'caros-[21-01-24][02-58-44].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Garagens Vendas de Veículos 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.4  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(257, '164639681116192', '164657093531661', 'Script Web rádio V2.6', 100, 'https://radiotop.divinosilva.com.br/', 'Script-Web-radio-V2-6-[06-03-22][09-50-06].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(273, '164657348779404', '164657380233626', 'Sistema de Rifas Online v2', 150, 'https://rifa.divinosilva.com.br/', 'Sistema-de-Rifas-Online-v2-[06-03-22][10-37-36].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2 em WordPress', NULL, '#'),
(200, '162775883089827', '162794045713915', 'SISTEMA DE AGENDAMENTO PARA BARBEARIAS + PWA - VERSÃO VIA WHATSAPP', 175, 'https://salaowhats.scriptlivre.top', 'salao2-[22-01-24][16-30-50].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Com esse Sistema de Agendamento + Site para Barbearias você será capaz de configurar e Revender com muita facilidade uma Plataforma completa de Agendamentos Online para Barbeiros que desejam ter Agilidade, Controle e Autoridade Digital em sua Barbearia.', NULL, 'https://wa.me/5511961817094'),
(256, '164639681116192', '164657082362617', 'Super Radio Admin', 500, 'https://www.radiov2.divinosilva.com.br/', 'Super-Radio-Admin-[06-03-22][09-48-19].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 7.3', NULL, 'https://www.divinosilva.com.br/produto/web-radio-v2-cms-gerenciavel-100-responsiva/'),
(255, '164639681116192', '164657068912404', 'Radio One Responsiva', 120, 'https://www.one.divinosilva.com.br/', 'Radio-One-Responsiva-[06-03-22][09-46-13].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(203, '162775883089827', '162794106870594', 'SITE PARA POLÍTICOS', 50, 'https://politico.scriptlivre.top/', 'cod-630-[22-01-24][02-01-17].webp', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Políticos 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 7.4 MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..', NULL, 'https://wa.me/5511961817094'),
(204, '162775883089827', '162794223755606', 'SCRIPT SITE PRONTO PARA IPTV EM PHP', 58.99, 'https://iptv.scriptlivre.top  ', 'iptv-[21-01-24][02-55-16].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Site para Venda de IPTV Streaming de Vídeo 100% responsivo em PHP MySQL com Painel Administrador, fácil edição pelo painel, feito em PHP 5.6 a 7.0  MySQL, utilizando os Framework Bootstrap v3.3.7 e Font Awesome 5.7.0 para agiliza maior performance de navegação.\r\nCompatível com os principais navegadores Google Chrome, Opera, Firefox (Mozilla), Edge, Outros..\r\n', NULL, 'https://wa.me/5511961817094'),
(272, '164657348779404', '164657373153020', 'Sistema de Rifas Online', 100, 'https://rifa.hostlocal.com.br/', 'Sistema-de-Rifas-Online-[06-03-22][10-36-16].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.0 em WordPress', NULL, '#'),
(267, '164657225577697', '164657273577098', 'SITE IPTV Mensal', 39, 'https://wwv2.hostlocal.com.br/', 'SITE-IPTV-Mensal-[06-03-22][10-19-55].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Nesse plano de 39,90 por mês', NULL, '#'),
(266, '164657225577697', '164657264716822', 'Landing page PHP ADMIN', 120, 'https://landingpage.divinosilva.com.br/', 'Landing-page-PHP-ADMIN-[06-03-22][10-18-15].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.0', NULL, '#'),
(260, '164639681116192', '164657121648193', 'Script de Web Radio', 150, 'https://www.radio.hostlocal.com.br/', 'Script-de-Web-Radio-[06-03-22][09-55-15].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6', NULL, '#'),
(211, '162775883089827', '163209811478785', 'Site para vender Hospedagem 3', 100, 'https://site.hospedagemnaweb.com.br/', 'sitehosp-[26-01-24][15-01-47].png', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Sites Profissional para Revender Hospedagem de Site Script WordPress Responsivo ', NULL, 'https://wa.me/5511961817094'),
(223, '164639672617272', '164639974817143', 'Loja de iphone - Wordpress', 39, 'https://lojas.scriptlivre.top/iphone/', 'Design-sem-nome-38-[27-01-24][02-40-33].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Loja de Iphone Tema Wordpress ', NULL, 'https://wa.me/5511961817094'),
(224, '164639672617272', '164639988923300', 'Loja de auto peças - Com Frete + Modulo pagamento + Modulo Whatsapp', 89, 'https://lojas.scriptlivre.top/autopecas/', 'Design-sem-nome-27-[27-01-24][02-36-25].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Loja virutal de auto peças feita em wordpress Com Frete + Modulo pagamento + Modulo Whatsapp\r\n', NULL, 'https://wa.me/5511961817094'),
(225, '164639672617272', '164640007489759', 'Loja Joias - Wordpress - Frete + Mercadopago + checkout personalizado', 90, 'https://lojas.scriptlivre.top/digital/', 'Design-sem-nome-26-[27-01-24][03-56-12].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Loja Joias - Wordpress - Frete + Mercadopago + checkout personalizado', NULL, 'https://wa.me/5511961817094'),
(233, '164639682583165', '164656706718695', 'Script Site Imobiliária 3', 200, 'https://imobiliaria3.hostlocal.com.br/', 'Script-Site-Imobiliaria-3-[06-03-22][08-45-34].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel php 5.6 a 7.2', NULL, '#'),
(234, '164639682583165', '164656720482202', 'Script Imobiliária NEXT IMÓVEIS', 100, 'https://ww3.imobiliaria.divinosilva.com.br/', 'Script-Site-Imobiliaria-NEXT-IMOVEIS-[06-03-22][08-48-48].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel php 5.6 \"UPLOAD DE IMAGEM ATUALIZADO\"', NULL, 'https://pay.juno.com.br/checkout.html?code=DD2E4D9458586ADD'),
(246, '164639684064763', '164656929117865', 'SCRIPT SITE TRANSPORTADORA', 100, 'https://transportadora.divinohost.com.br/', 'SCRIPT-SITE-TRANSPORTADORA-[06-03-22][09-22-16].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.0', NULL, '#'),
(247, '164639684064763', '164656938820002', 'Site de Provedor de Internet', 100, 'https://provedor.divinohost.com.br/', 'Site-de-Provedor-de-Internet-[06-03-22][09-24-06].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2 em WordPress', NULL, '#'),
(248, '164639684064763', '164656949537091', 'Thema DriCub driving school', 100, 'https://autoescola.divinosilva.com.br/', 'Thema-DriCub-driving-schol-[06-03-22][09-26-03].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2 em WordPress', NULL, '#'),
(249, '164639684064763', '164656959643011', 'Site de Host 100% responsivo', 150, 'https://host.divinosilva.com.br/', 'Site-de-Host-10-responsivo-[06-03-22][09-27-21].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Puro PHP, Cpanel PHP 5.6 a 7.1', NULL, '#'),
(250, '164639684064763', '164656968578273', 'Site WP Hosting', 50, 'https://hostwp.divinosilva.com.br/', 'Site-WP-Hosting-[06-03-22][09-29-00].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.2 em WordPress', NULL, '#'),
(251, '164639684064763', '164656978619191', 'Provedor de Internet 2', 150, 'https://provedor2.divinohost.com.br/', 'Provedor-de-Internet-2-[06-03-22][09-30-37].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4, em WordPress , Elemetor pro', NULL, '#'),
(262, '164639681116192', '164657146589043', 'Rádio Master 3 Topos', 20, 'https://master3topos.divinosilva.com.br/', 'Radio-Master-3-Topos-[06-03-22][09-58-33].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Plano 20,00 por mês', NULL, 'https://www.paineldivino.com.br/master3.php'),
(263, '164639681116192', '164657156346186', 'Sua Rádio V7 - Gerenciável', 20, 'https://radiov7.divinohost.com.br/', 'Sua-Radio-V7-Gerenciavel-[06-03-22][10-01-15].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Plano 20,00 por mês', NULL, 'https://www.paineldivino.com.br/sua-radio-v7.php'),
(264, '164639681116192', '164657186087711', 'Rádio BS', 10, 'https://www.radiobs.divinosilva.com.br/', 'radio-bs-[06-03-22][10-07-38].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Plano10,00 por mês', NULL, 'https://www.paineldivino.com.br/cart.php?gid=4'),
(282, '164639672617272', '164657671195319', 'NURTI FIT LOJA', 100, 'https://nutrifit.divinohost.com.br/', 'NURTI-FIT-LOJA-[06-03-22][11-25-50].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4, Com Plugins, Elementor', NULL, '#'),
(292, '164658072764501', '171279891523255', 'Pack de scripts e ferramentas', 139.99, 'http://wa.me/5511961817094', NULL, NULL, 'Chatwhoot + Typebot + 500 Funil\r\nCassino PHP 7.4 Laravel Com MercadoPago e Pix\r\nIngressos\r\nCatalogo Multi Lojas PHP 7.4\r\nScript Aposta Futebol\r\nPacote de 10 Sites Administravel\r\nRifa Fazendinha V12 Laravel PHP\r\nRifa Pix Wordpress Fazendinha\r\nRifa PIX QRCODE 2022 , VERSÃO WORDPRESS\r\nRifa novo Wordpress Fazendinha Pix Mercado Pago e Paggue\r\nPacote de Ferramentas Social Media Leaks Software\r\nSistema Delivery PHP\r\nPortal noticias Infinite\r\nBarbearia Agendamento PWA WORDPRESS\r\nPacote 10.000 Paginas de vendas Wordpress Elementor\r\nPacote 3400 Paginas de vendas Elementor wordpress\r\nVarient Portal Noticias\r\n66biolink php\r\nDelivery PHP 7.1 Multi\r\n200 copys para whatsapp VENDAS\r\nFiscal MultiEmpresa ERP PDV PHP 7.4\r\nWhaticket Saas Kaban DARK MODE\r\nAGENDAMENTO SAAS SALÃO ETC.\r\nWAZIPER 5.1.0 CHATBOT ENVIO EM MASSA AUTO RESPONDER\r\nCODIGO FONTE MATURADOR DE CHIP VISUAL STUDIO\r\nTEMA WORDPRESS HOSPEDAGEM DE SITES 2 TEMAS\r\nDELIVERY MULTI LOJAS PHP\r\nCASSINO XAXINO 2\r\nLOJA VIRTUAL DE PRODUTOS DIGITAL PHP\r\nVCARD + CATALOGO DIGITAL VIA WHATSAPP\r\nGERADOR VISUAL KIWIFY\r\nPACOTE CANVA DE IMAGENS\r\nINSTA TURBO LEAD + GERADOR DE LICENÇA PARA INSTAGRAM\r\nIG ULTIMATE TURBO INSTAGRAM + GERADOR DE LICENÇA\r\n10 LOJAS VIRTUAL WORDPRESS\r\nERP GO SAAS', NULL, 'http://wa.me/5511961817094'),
(286, '164639679980918', '164659174043949', 'Portal de Noticias WordPress', 150, 'https://tonasua.com.br/', 'Portal-de-Noticias-WordPres-[06-03-22][15-36-36].jpg', '<i class=\"fa fa-desktop\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-tablet\" aria-hidden=\"true\"></i>\r\n<i class=\"fa fa-mobile\" aria-hidden=\"true\"></i>', 'Cpanel php 7.4 em WordPress', NULL, '#'),
(287, '164795637380668', '164795642398957', 'Ideal', 20, 'https://www.paineldivino.com.br/cart.php?a=add&pid=1', '5984-[22-03-22][11-13-19].png', '.', 'Por apenas R$ 20.00\r\nMENSAL', NULL, 'https://www.paineldivino.com.br/cart.php?a=add&pid=1'),
(288, '164795637380668', '164795718074673', 'Prêmio', 26, 'https://www.paineldivino.com.br/cart.php?a=add&pid=2', '5984-[22-03-22][11-11-44].png', '.', 'Por apenas R$ 26.00\r\nMENSAL', NULL, 'https://www.paineldivino.com.br/cart.php?a=add&pid=2'),
(290, '164795637380668', '164795843484622', 'Profissional', 30, 'https://www.paineldivino.com.br/cart.php?a=add&pid=3', '5984-[22-03-22][15-48-11].png', '.', 'Por apenas R$ 30.00\r\nMENSAL', NULL, 'https://www.paineldivino.com.br/cart.php?a=add&pid=3');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_grupos`
--

CREATE TABLE `planos_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text,
  `imagem_fundo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `planos_grupos`
--

INSERT INTO `planos_grupos` (`id`, `codigo`, `titulo`, `mostrar_titulo`, `itens_por_linha`, `descricao`, `imagem_fundo`) VALUES
(4, '162775883089827', 'MAIS VENDIDOS', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', ''),
(6, '164626484342197', 'DELIVERY', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(8, '164639672617272', 'LOJA VIRTUAL / WOOCOMMERCE', 1, 3, 'Lojas Atualizadas com Frete Correios Melhor envio , Com forma de pagamento Mercado pago!', ''),
(9, '164639679980918', 'PORTAL DE NOTÍCIAS', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(10, '164639681116192', 'RÁDIO &amp; WEB TV', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(11, '164639682583165', 'CLASSIFICADO / IMOBILIÁRIA', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(12, '164639684064763', 'PRESTADORES DE SERVIÇOS', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(13, '164657016256947', 'GUIA WP / PHP', 1, 1, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(14, '164657225577697', 'VITRINE IPTV', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(15, '164657348779404', 'SCRIPTS DE RIFAS ONLINE EM WP', 1, 3, 'Todos com painel administrativo para que possa gerenciar com facilidade.', NULL),
(16, '164658072764501', 'PROMOÇAÕ DO DIA', 1, 1, 'PACOTE DE SCRIPT POR APENAS CHAMA NO WHATSAPP!', NULL),
(17, '164795637380668', 'PLANO DE HOSPEDAGEM', 0, 3, '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_itens`
--

CREATE TABLE `planos_itens` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `tipo` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `planos_itens`
--

INSERT INTO `planos_itens` (`id`, `codigo`, `titulo`, `tipo`) VALUES
(140, '159596975880934', 'AAAAAAAAAAAAAAAA', 0),
(139, '159596700262979', 'Item 3', 1),
(138, '159596700262979', 'Item 2', 1),
(137, '159596700262979', 'Item 1', 1),
(136, '159596695535947', 'item 3', 0),
(135, '159596695535947', 'item 2', 0),
(134, '159596695535947', 'item 1', 1),
(131, '159464005847190', 'tyeste', 1),
(130, '159442239070849', 'gole', 1),
(128, '159442236626955', 'bebida', 0),
(127, '159442236626955', 'Perereca', 1),
(181, '162138123941906', 'Disco 100 GB SSD', 1),
(173, '162138101697757', 'Mensal', 1),
(174, '162138101697757', 'Disco 50 GB SSD', 1),
(169, '162127118528180', '.COM.BR', 1),
(170, '162127104866030', 'Disco 50 GB SSD', 1),
(171, '162127104866030', 'Plano Mensal', 1),
(175, '162138101697757', 'Domínio 1 Site', 1),
(180, '162138123941906', 'Mensal', 1),
(179, '162138101697757', 'CPU e Memória 1 CPU e 1GB', 1),
(178, '162138101697757', 'SSL e Criador Grátis', 1),
(177, '162138101697757', 'Contas de E-Mail ILIMITADAS', 1),
(176, '162138101697757', 'Transferência ILIMITADA', 1),
(160, '162127101920684', 'Manual de Instalação', 1),
(159, '162127101920684', 'Sistema completo com todos os arquivos', 1),
(172, '162127118528180', '*Anual', 1),
(182, '162138123941906', 'Domínios 2 Sites', 1),
(183, '162138123941906', 'Transferência ILIMITADA', 1),
(184, '162138123941906', 'Contas de E-Mail ILIMITADAS', 1),
(185, '162138123941906', 'SSL e Criador Grátis', 1),
(186, '162138123941906', 'CPU e Memória 1 CPU e 2GB', 1),
(187, '162138147293985', 'Mensal', 1),
(188, '162138147293985', 'Disco 200 GB SSD', 1),
(189, '162138147293985', 'Domínios 5 Sites', 1),
(190, '162138147293985', 'Transferência ILIMITADA', 1),
(191, '162138147293985', 'Contas de E-Mail ILIMITADAS', 1),
(192, '162138147293985', 'SSL e Criador Grátis', 1),
(193, '162138147293985', 'CPU e Memória 1 CPU e 3GB', 1),
(194, '162138161650135', 'Mensal', 1),
(195, '162138161650135', 'Disco ILIMITADO SSD', 1),
(196, '162138161650135', 'Domínios 10 Sites', 1),
(197, '162138161650135', 'Transferência ILIMITADA', 1),
(198, '162138161650135', 'Contas de E-Mail ILIMITADAS', 1),
(199, '162138161650135', 'SSL e Criador Grátis', 1),
(200, '162138161650135', 'CPU e Memória 1 CPU e 4GB', 1),
(738, '162775982748630', 'Hospedagem', 1),
(219, '162775960326943', 'Instalação Grátis via Cpanel', 1),
(230, '162775960326943', 'Hospedagem', 0),
(226, '162776004880949', 'Instalação Grátis via Cpanel', 1),
(224, '162775982748630', 'Instalação Grátis via Cpanel', 1),
(232, '162776018619020', 'Instalação Grátis via Cpanel', 1),
(229, '162775899248911', 'Hospedagem', 0),
(228, '162775899248911', 'Instalação Grátis via Cpanel', 1),
(234, '162776039760507', 'Instalação Grátis via Cpanel', 1),
(235, '162776039760507', 'Hospedagem', 0),
(236, '162776064044915', 'Instalação Grátis via Cpanel', 1),
(237, '162776064044915', 'Hospedagem', 0),
(238, '162776076530721', 'Instalação Grátis via Cpanel', 1),
(241, '162777336547707', 'Hospedagem', 0),
(239, '162776076530721', 'Hospedagem', 0),
(240, '162777336547707', 'Instalação Grátis via Cpanel', 1),
(233, '162776018619020', 'Hospedagem', 0),
(740, '162776004880949', 'Hospedagem', 1),
(248, '162777386827669', 'Instalação Grátis via Cpanel', 1),
(246, '162777364553408', 'Instalação Grátis NÃO', 0),
(247, '162777364553408', 'Hospedagem', 1),
(731, '162777386827669', 'Hospedagem 1 Mês', 1),
(744, '162777403626910', 'Instalação Grátis via Cpanel', 1),
(742, '162777403626910', 'Hospedagem', 1),
(746, '162777418942544', 'Hospedagem', 1),
(745, '162777418942544', 'Instalação Grátis via Cpanel', 0),
(254, '162777427021899', 'Instalação Grátis via Cpanel', 1),
(255, '162777427021899', 'Hospedagem', 0),
(256, '162777443497921', 'Instalação Grátis via Cpanel', 1),
(259, '162777460425623', 'Instalação Grátis via Cpanel', 1),
(258, '162777443497921', 'Hospedagem', 0),
(260, '162777460425623', 'Hospedagem', 0),
(261, '162777471421133', 'Instalação Grátis via Cpanel', 1),
(262, '162777471421133', 'Hospedagem', 0),
(263, '162777512284113', 'Instalação Grátis via Cpanel', 1),
(748, '162777512284113', 'Hospedagem', 1),
(265, '162777581641649', 'Instalação Grátis via Cpanel', 1),
(750, '162777581641649', 'Hospedagem', 1),
(267, '162777597325842', 'Instalação Grátis via Cpanel', 1),
(754, '162777597325842', 'Hospedagem', 1),
(269, '162777613327882', 'Instalação Grátis via Cpanel', 1),
(760, '162777613327882', 'Domínio', 0),
(271, '162791899034132', 'Instalação Grátis via Cpanel', 1),
(272, '162791899034132', 'Hospedagem', 0),
(273, '162791939465240', 'Instalação Grátis via Cpanel', 1),
(274, '162791939465240', 'Hospedagem', 0),
(275, '162791986419636', 'Instalação Grátis via Cpanel', 1),
(276, '162791986419636', 'Hospedagem', 0),
(762, '162792035549929', 'Hospedagem 1 Mês', 1),
(761, '162792035549929', 'Instalação Grátis via Cpanel', 1),
(280, '162792062813277', 'Instalação Grátis via Cpanel', 1),
(281, '162792062813277', 'Hospedagem', 1),
(764, '162792092920502', 'Uso ilimitado', 1),
(766, '162792092920502', 'Hospedagem', 1),
(286, '162792128173629', 'Instalação Grátis via Cpanel', 1),
(287, '162792128173629', 'Hospedagem', 1),
(291, '162792160926024', 'Instalação Grátis NÃO', 0),
(289, '162792142411036', 'Instalação Grátis NÃO', 0),
(290, '162792142411036', 'Hospedagem', 0),
(292, '162792160926024', 'Hospedagem', 0),
(293, '162792181891294', 'Instalação Grátis via Cpanel', 1),
(770, '162792181891294', 'Hospedagem', 1),
(779, '162792603889013', 'Hospedagem', 1),
(778, '162792603889013', 'Instalação Grátis via Cpanel', 1),
(772, '162792584946759', 'Instalação Grátis via Cpanel', 1),
(773, '162792584946759', 'Hospedagem', 1),
(782, '162792621047671', 'Hospedagem', 1),
(781, '162792621047671', 'Instalação Grátis via Cpanel', 1),
(303, '162792636188236', 'Instalação Grátis via Cpanel', 1),
(304, '162792636188236', 'Hospedagem', 1),
(305, '162792651888271', 'Instalação Grátis via Cpanel', 1),
(306, '162792651888271', 'Hospedagem', 1),
(325, '162792796636622', 'Instalação Grátis via Cpanel', 1),
(326, '162792796636622', 'Hospedagem', 0),
(309, '162792684288899', 'Instalação Grátis via Cpanel', 1),
(784, '162792684288899', 'Hospedagem', 1),
(311, '162792694324731', 'Instalação Grátis via Cpanel', 1),
(786, '162792694324731', 'Hospedagem', 1),
(313, '162792708913815', 'Instalação Grátis NÃO', 0),
(314, '162792708913815', 'Hospedagem', 0),
(315, '162792726287484', 'Instalação Grátis via Cpanel', 1),
(316, '162792726287484', 'Hospedagem', 0),
(317, '162792738048180', 'Instalação Grátis via Cpanel', 1),
(318, '162792738048180', 'Hospedagem', 1),
(319, '162792751570546', 'Instalação Grátis via Cpanel', 1),
(320, '162792751570546', 'Hospedagem', 0),
(321, '162792773148895', 'Instalação Grátis via Cpanel', 1),
(322, '162792773148895', 'Hospedagem', 0),
(323, '162792664649585', 'Instalação Grátis NÃO', 0),
(324, '162792664649585', 'Hospedagem', 0),
(327, '162792810047193', 'Instalação Grátis via Cpanel', 1),
(328, '162792810047193', 'Hospedagem', 0),
(329, '162792820187955', 'Instalação Grátis via Cpanel', 1),
(330, '162792820187955', 'Hospedagem', 0),
(331, '162792834675508', 'Instalação Grátis via Cpanel', 1),
(332, '162792834675508', 'Hospedagem', 0),
(445, '162792850348982', 'Hospedagem', 1),
(446, '162792850348982', '5 contas de e-mails', 1),
(443, '162792863445027', '5 contas de e-mails', 1),
(444, '162792863445027', 'Domínio NÃO', 1),
(442, '162792863445027', 'Hospedagem', 1),
(447, '162792850348982', 'Domínio NÃO', 1),
(449, '162792879667415', '5 contas de e-mails', 1),
(448, '162792879667415', 'Hospedagem', 1),
(450, '162792879667415', 'Domínio NÃO', 1),
(342, '162793497194019', 'Instalação Grátis via Cpanel', 1),
(343, '162793497194019', 'Hospedagem', 0),
(344, '162793510411480', 'Instalação Grátis via Cpanel', 1),
(346, '162793510411480', 'Hospedagem', 0),
(347, '162793531172617', 'Instalação Grátis via Cpanel', 1),
(348, '162793531172617', 'Hospedagem', 0),
(349, '162793554261595', 'Instalação Grátis via Cpanel', 1),
(788, '162793554261595', 'Hospedagem', 1),
(351, '162793582999650', 'Instalação Grátis via Cpanel', 1),
(793, '162793582999650', 'Domínio', 0),
(353, '162793597252224', 'Instalação Grátis via Cpanel', 1),
(354, '162793597252224', 'Hospedagem', 0),
(355, '162793605794371', 'Hospedagem', 1),
(356, '162793605794371', 'Licença Sim', 1),
(357, '162793620854780', 'Instalação Grátis via Cpanel', 1),
(358, '162793620854780', 'Hospedagem', 0),
(359, '162793634446062', 'Instalação Grátis via Cpanel', 1),
(360, '162793634446062', 'Hospedagem', 0),
(362, '162793650043758', 'Instalação Grátis NÃO', 0),
(363, '162793650043758', 'Hospedagem', 0),
(364, '162793665969129', 'Instalação Grátis via Cpanel', 1),
(365, '162793665969129', 'Hospedagem', 0),
(366, '162793685712959', 'Instalação Grátis via Cpanel', 1),
(367, '162793685712959', 'Hospedagem', 0),
(368, '162793710679687', 'Instalação Grátis via Cpanel', 1),
(369, '162793710679687', 'Hospedagem', 0),
(370, '162793723922549', 'Instalação Grátis via Cpanel', 1),
(796, '162793723922549', 'Domínio', 0),
(372, '162793734538776', 'Instalação Grátis via Cpanel', 1),
(735, '162793734538776', 'Hospedagem', 1),
(374, '162793889852144', 'Instalação Grátis via Cpanel', 1),
(375, '162793889852144', 'Hospedagem', 0),
(376, '162793954088188', 'Hospedagem', 1),
(377, '162793954088188', '5 contas de e-mails', 1),
(423, '162793954088188', 'Domínio NÃO', 0),
(380, '162793889852144', 'Elementor SIM', 1),
(381, '162794003761165', 'Instalação Grátis via Cpanel', 1),
(382, '162794003761165', 'Hospedagem', 0),
(383, '162794003761165', 'Elementor NÃO', 1),
(384, '162794045713915', 'Instalação Grátis via Cpanel', 1),
(798, '162794045713915', 'Domínio', 0),
(386, '162794065481033', 'Instalação Grátis via Cpanel', 1),
(387, '162794065481033', 'Hospedagem', 0),
(388, '162794082192603', 'Instalação Grátis NÃO', 0),
(389, '162794082192603', 'Hospedagem', 0),
(390, '162794106870594', 'Instalação Grátis via Cpanel', 1),
(791, '162794106870594', 'Domínio', 0),
(392, '162794223755606', 'Hospedagem', 1),
(734, '162794223755606', 'Instalação Grátis via Cpanel', 1),
(797, '162794045713915', 'Hospedagem', 1),
(399, '163209552369403', 'Instalação Grátis via Cpanel', 1),
(396, '162794260397408', 'Instalação Grátis via Cpanel', 1),
(397, '162794260397408', 'Hospedagem', 1),
(398, '162794260397408', 'Domínio NÃO', 0),
(400, '163209552369403', 'Hospedagem', 1),
(433, '162793710679687', 'Domínio NÃO', 0),
(403, '163209720773831', 'Instalação Grátis via Cpanel', 1),
(404, '163209720773831', 'Hospedagem', 1),
(405, '163209720773831', 'Domínio NÃO', 0),
(406, '163209751838079', 'Instalação Grátis via Cpanel', 1),
(407, '163209751838079', 'Hospedagem', 1),
(422, '163209751838079', 'Domínio NÃO', 0),
(409, '163209785028340', 'Instalação Grátis via Cpanel', 1),
(410, '163209785028340', 'Hospedagem', 0),
(412, '163209785028340', 'Domínio NÃO', 0),
(413, '163209811478785', 'Instalação Grátis via Cpanel', 1),
(414, '163209811478785', 'Hospedagem', 1),
(415, '163209811478785', 'Domínio NÃO', 0),
(416, '163209921749984', 'Instalação Grátis via Cpanel', 1),
(417, '163209921749984', 'Hospedagem', 0),
(418, '163209921749984', 'Domínio NÃO', 0),
(419, '163684766857285', 'Instalação Grátis via Cpanel', 1),
(420, '163684766857285', 'Hospedagem', 1),
(736, '162793734538776', 'Domínio', 0),
(425, '162794065481033', 'Domínio NÃO', 0),
(426, '163736582773637', 'Instalação Grátis via Cpanel', 1),
(427, '163736582773637', 'Hospedagem', 1),
(428, '163736582773637', 'Domínio NÃO', 0),
(429, '163736614535404', 'Instalação Grátis via Cpanel', 1),
(430, '163736614535404', 'Hospedagem', 1),
(431, '163736614535404', 'Domínio NÃO', 0),
(432, '162794082192603', 'Domínio NÃO', 0),
(434, '163209552369403', 'Domínio NÃO', 0),
(794, '162793723922549', 'Hospedagem', 1),
(437, '163766976024968', 'Instalação Grátis via Cpanel', 1),
(438, '163766976024968', 'Hospedagem', 1),
(439, '163766976024968', 'Domínio NÃO', 0),
(440, '163777016642536', 'Instalação Grátis via Cpanel', 1),
(441, '163777016642536', 'Domínio NÃO', 0),
(451, '164626498330156', 'Hospedagem', 0),
(452, '164626498330156', 'Instalação Grátis via Cpanel', 1),
(453, '164626498330156', 'Domínio NÃO', 0),
(454, '164639896066170', 'Instalação Grátis via Cpanel', 1),
(455, '164639896066170', 'Hospedagem', 0),
(456, '164639918495692', 'Instalação Grátis via Cpanel', 1),
(457, '164639918495692', 'Hospedagem', 1),
(458, '164639918495692', 'Domínio NÃO', 0),
(459, '164639950428060', 'Instalação Grátis via Cpanel', 1),
(460, '164639950428060', 'Hospedagem', 0),
(461, '164639950428060', 'Domínio NÃO', 0),
(462, '164639896066170', 'Domínio NÃO', 0),
(463, '164639974817143', 'Instalação Grátis via Cpanel', 1),
(803, '164639974817143', 'Domínio', 0),
(802, '164639974817143', 'Hospedagem', 1),
(800, '164639988923300', 'Domínio', 0),
(467, '164639988923300', 'Instalação Grátis via Cpanel', 1),
(799, '164639988923300', 'Hospedagem', 1),
(472, '164640007489759', 'Instalação Grátis via Cpanel', 1),
(806, '164640007489759', 'Domínio', 0),
(805, '164640007489759', 'Hospedagem', 1),
(475, '164656582890058', 'Instalação Grátis via Cpanel', 1),
(476, '164656582890058', 'Hospedagem', 1),
(477, '164656582890058', 'Domínio NÃO', 0),
(478, '164656611425250', 'Instalação Grátis via Cpanel', 1),
(479, '164656611425250', 'Hospedagem', 0),
(480, '164656611425250', 'Domínio NÃO', 0),
(481, '164656622890236', 'Instalação Grátis via Cpanel', 1),
(482, '164656622890236', 'Hospedagem', 0),
(483, '164656622890236', 'Domínio NÃO', 0),
(484, '164656638319635', 'Instalação Grátis via Cpanel', 0),
(485, '164656638319635', 'Hospedagem', 0),
(486, '164656638319635', 'Domínio NÃO', 0),
(487, '164656654021627', 'Instalação Grátis via Cpanel', 1),
(488, '164656654021627', 'Hospedagem', 0),
(489, '164656654021627', 'Domínio NÃO', 0),
(490, '164656673960960', 'Instalação Grátis via Cpanel', 1),
(491, '164656673960960', 'Hospedagem', 0),
(492, '164656673960960', 'Domínio NÃO', 0),
(493, '164656689313377', 'Instalação Grátis via Cpanel', 1),
(494, '164656689313377', 'Hospedagem', 0),
(495, '164656689313377', 'Domínio NÃO', 0),
(496, '164656706718695', 'Instalação Grátis via Cpanel', 1),
(497, '164656706718695', 'Hospedagem', 0),
(498, '164656706718695', 'Domínio NÃO', 0),
(499, '164656720482202', 'Instalação Grátis via Cpanel', 1),
(500, '164656720482202', 'Hospedagem', 0),
(501, '164656720482202', 'Domínio NÃO', 0),
(502, '164656758842928', 'Instalação Grátis via Cpanel', 1),
(503, '164656758842928', 'Hospedagem', 1),
(504, '164656758842928', 'Domínio NÃO', 0),
(505, '164656788148314', 'Instalação Grátis via Cpanel', 1),
(506, '164656788148314', 'Hospedagem', 0),
(507, '164656788148314', 'Domínio NÃO', 0),
(508, '164656805727169', 'Instalação Grátis via Cpanel', 1),
(509, '164656805727169', 'Hospedagem', 0),
(510, '164656805727169', 'Domínio NÃO', 0),
(511, '164656830144804', 'Instalação Grátis via Cpanel', 1),
(512, '164656830144804', 'Hospedagem', 0),
(513, '164656830144804', 'Domínio NÃO', 0),
(514, '164656841159586', 'Instalação Grátis via Cpanel', 1),
(515, '164656841159586', 'Hospedagem', 0),
(516, '164656841159586', 'Domínio NÃO', 0),
(517, '164656850789973', 'Instalação Grátis via Cpanel', 1),
(518, '164656850789973', 'Hospedagem', 0),
(519, '164656850789973', 'Domínio NÃO', 0),
(520, '164656864348578', 'Instalação Grátis via Cpanel', 1),
(521, '164656864348578', 'Hospedagem', 0),
(522, '164656864348578', 'Domínio NÃO', 0),
(523, '164656884872909', 'Instalação Grátis via Cpanel', 1),
(524, '164656884872909', 'Hospedagem', 0),
(525, '164656884872909', 'Domínio NÃO', 0),
(526, '164656894473463', 'Instalação Grátis via Cpanel', 1),
(527, '164656894473463', 'Hospedagem', 0),
(528, '164656894473463', 'Domínio NÃO', 0),
(529, '164656909612962', 'Instalação Grátis via Cpanel', 1),
(530, '164656909612962', 'Hospedagem', 0),
(531, '164656909612962', 'Domínio NÃO', 0),
(532, '164656919069587', 'Instalação Grátis via Cpanel', 1),
(533, '164656919069587', 'Hospedagem', 0),
(534, '164656919069587', 'Domínio NÃO', 0),
(535, '164656929117865', 'Instalação Grátis via Cpanel', 1),
(536, '164656929117865', 'Hospedagem', 0),
(537, '164656929117865', 'Domínio NÃO', 0),
(538, '164656938820002', 'Instalação Grátis via Cpanel', 1),
(539, '164656938820002', 'Hospedagem', 0),
(540, '164656938820002', 'Domínio NÃO', 0),
(541, '164656949537091', 'Instalação Grátis via Cpanel', 0),
(542, '164656949537091', 'Hospedagem', 0),
(543, '164656949537091', 'Domínio NÃO', 0),
(544, '164656959643011', 'Instalação Grátis via Cpanel', 1),
(545, '164656959643011', 'Hospedagem', 0),
(546, '164656959643011', 'Domínio NÃO', 0),
(547, '164656968578273', 'Instalação Grátis via Cpanel', 0),
(548, '164656968578273', 'Hospedagem', 0),
(549, '164656968578273', 'Domínio NÃO', 0),
(550, '164656978619191', 'Instalação Grátis via Cpanel', 1),
(551, '164656978619191', 'Hospedagem', 0),
(552, '164656978619191', 'Domínio NÃO', 0),
(553, '164657026573913', 'Instalação Grátis via Cpanel', 0),
(554, '164657026573913', 'Hospedagem', 0),
(555, '164657026573913', 'Domínio NÃO', 0),
(556, '164657048811925', 'Instalação Grátis via Cpanel', 1),
(557, '164657048811925', 'Hospedagem', 0),
(558, '164657048811925', 'Domínio NÃO', 0),
(559, '164657058699210', 'Instalação Grátis via Cpanel', 1),
(560, '164657058699210', 'Hospedagem', 0),
(561, '164657058699210', 'Domínio NÃO', 0),
(562, '164657068912404', 'Instalação Grátis via Cpanel', 1),
(563, '164657068912404', 'Hospedagem', 0),
(564, '164657068912404', 'Domínio NÃO', 1),
(565, '164657082362617', 'Instalação Grátis via Cpanel', 1),
(566, '164657082362617', 'Hospedagem', 1),
(567, '164657082362617', 'Domínio NÃO', 0),
(568, '164657093531661', 'Instalação Grátis via Cpanel', 1),
(569, '164657093531661', 'Hospedagem', 0),
(570, '164657093531661', 'Domínio NÃO', 0),
(571, '164657104081442', 'Instalação Grátis NÃO', 0),
(572, '164657104081442', 'Hospedagem', 0),
(573, '164657104081442', 'Domínio NÃO', 0),
(574, '164657114088747', 'Instalação Grátis via Cpanel', 1),
(575, '164657114088747', 'Hospedagem', 1),
(576, '164657114088747', 'Domínio NÃO', 0),
(577, '164657121648193', 'Instalação Grátis via Cpanel', 1),
(578, '164657121648193', 'Hospedagem', 1),
(579, '164657121648193', 'Domínio NÃO', 0),
(580, '164657136452003', 'Instalação Grátis NÃO', 0),
(581, '164657136452003', 'Hospedagem', 0),
(582, '164657136452003', 'Domínio NÃO', 0),
(583, '164657146589043', 'Instalação Grátis via Cpanel', 1),
(584, '164657146589043', 'Hospedagem', 1),
(585, '164657146589043', 'Domínio NÃO', 0),
(586, '164657156346186', 'Instalação Grátis via Cpanel', 1),
(587, '164657156346186', 'Hospedagem', 1),
(588, '164657156346186', 'Domínio NÃO', 0),
(589, '164657156346186', 'Streaming de áudio/vídeo', 0),
(590, '164657146589043', 'Streaming de áudio/vídeo', 0),
(591, '164657186087711', 'Instalação Grátis via Cpanel', 1),
(592, '164657186087711', 'Hospedagem', 1),
(593, '164657186087711', 'Domínio NÃO', 0),
(594, '164657186087711', 'Streaming de áudio/vídeo', 0),
(595, '164657256115394', 'Instalação Grátis via Cpanel', 1),
(596, '164657256115394', 'Hospedagem', 0),
(597, '164657256115394', 'Domínio NÃO', 0),
(598, '164657264716822', 'Instalação Grátis via Cpanel', 1),
(599, '164657264716822', 'Hospedagem', 0),
(600, '164657264716822', 'Domínio NÃO', 0),
(601, '164657273577098', 'Instalação Grátis via Cpanel', 1),
(602, '164657273577098', 'Hospedagem', 1),
(603, '164657273577098', 'Domínio NÃO', 1),
(604, '164657283783297', 'Instalação Grátis via Cpanel', 1),
(605, '164657283783297', 'Hospedagem', 0),
(606, '164657283783297', 'Domínio NÃO', 0),
(607, '164657296937101', 'Instalação Grátis via Cpanel', 1),
(608, '164657296937101', 'Hospedagem', 0),
(609, '164657296937101', 'Domínio NÃO', 0),
(610, '164657317363184', 'Instalação Grátis via Cpanel', 1),
(611, '164657317363184', 'Hospedagem', 0),
(612, '164657317363184', 'Domínio NÃO', 0),
(613, '164657362063563', 'Instalação Grátis via Cpanel', 1),
(614, '164657362063563', 'Hospedagem', 0),
(615, '164657362063563', 'Domínio NÃO', 0),
(616, '164657373153020', 'Instalação Grátis via Cpanel', 1),
(617, '164657373153020', 'Hospedagem', 1),
(618, '164657373153020', 'Domínio NÃO', 1),
(619, '164657380233626', 'Instalação Grátis via Cpanel', 1),
(620, '164657380233626', 'Hospedagem', 1),
(621, '164657380233626', 'Domínio NÃO', 1),
(622, '164657388382009', 'Instalação Grátis via Cpanel', 1),
(623, '164657388382009', 'Hospedagem', 1),
(624, '164657388382009', 'Domínio NÃO', 1),
(625, '164657517643787', 'Instalação Grátis via Cpanel', 1),
(626, '164657517643787', 'Hospedagem', 0),
(627, '164657517643787', 'Domínio NÃO', 0),
(628, '164657534751008', 'Instalação Grátis via Cpanel', 1),
(629, '164657534751008', 'Hospedagem', 0),
(630, '164657534751008', 'Domínio NÃO', 0),
(733, '164657564379101', 'Instalação Grátis via Cpanel', 1),
(732, '164657564379101', 'Hospedagem 1 Mês', 1),
(633, '164657564379101', 'Domínio NÃO', 0),
(634, '164657582881304', 'Instalação Grátis via Cpanel', 1),
(635, '164657582881304', 'Hospedagem', 0),
(636, '164657582881304', 'Domínio NÃO', 0),
(637, '164657599472724', 'Instalação Grátis via Cpanel', 1),
(638, '164657599472724', 'Hospedagem', 1),
(639, '164657599472724', 'Domínio NÃO', 0),
(640, '164657630866191', 'Instalação Grátis via Cpanel', 1),
(641, '164657630866191', 'Hospedagem', 1),
(643, '164657630866191', 'Domínio NÃO', 0),
(644, '164657650088899', 'Instalação Grátis via Cpanel', 1),
(730, '164657650088899', 'Hospedagem', 1),
(722, '164657650088899', 'Domínio NÃO', 0),
(647, '164657671195319', 'Instalação Grátis via Cpanel', 1),
(648, '164657671195319', 'Hospedagem', 1),
(650, '164657671195319', 'Domínio NÃO', 0),
(652, '164657723337642', 'Instalação Grátis via Cpanel', 1),
(653, '164657723337642', 'Hospedagem', 0),
(654, '164657723337642', 'Domínio NÃO', 0),
(655, '164657732858799', 'Instalação Grátis via Cpanel', 1),
(737, '164657732858799', 'Hospedagem', 1),
(657, '164657732858799', 'Domínio NÃO', 0),
(658, '162777386827669', 'Domínio NÃO', 0),
(659, '162794223755606', 'Domínio NÃO', 0),
(790, '162794106870594', 'Hospedagem', 1),
(792, '162793582999650', 'Hospedagem', 1),
(662, '164658113851611', 'Instalação Grátis via Cpanel', 1),
(729, '164658113851611', 'Domínio .TOP', 1),
(727, '164658113851611', 'Hospedagem 1 Mês', 1),
(665, '164659174043949', 'Instalação Grátis via Cpanel', 1),
(666, '164659174043949', 'Hospedagem', 1),
(667, '164659174043949', 'Domínio NÃO', 0),
(668, '164795642398957', '4 GB de Espaço SSD NVMe', 1),
(669, '164795642398957', 'Tráfego mensal : Ilimitado', 1),
(670, '164795642398957', '10 Contas de e-mail', 1),
(671, '164795642398957', '5 Contas de FTP', 1),
(672, '164795642398957', '10 Subdomínios', 1),
(673, '164795642398957', '4 Domínios de complementos', 1),
(674, '164795642398957', 'Banco de dados: Ilimitado', 1),
(675, '164795642398957', 'Certificado SSL', 1),
(676, '164795642398957', 'Proteção Anti-DDoS PRO', 1),
(677, '164795642398957', 'Anti-Spam + Anti-Vírus Grátis!', 1),
(678, '164795642398957', 'Múltiplas Versões PHP 5.4 até 8.1', 1),
(693, '164795642398957', 'Ativação Imediata', 1),
(680, '164795718074673', '6 GB de Espaço SSD NVMe', 1),
(681, '164795718074673', 'Tráfego mensal : Ilimitado', 1),
(682, '164795718074673', '10 Contas de e-mail', 1),
(683, '164795718074673', '5 Contas de FTP', 1),
(684, '164795718074673', '10 Subdomínios', 1),
(685, '164795718074673', '4 Domínios de complementos', 1),
(686, '164795718074673', 'Banco de dados: Ilimitado', 1),
(687, '164795718074673', 'Certificado SSL', 1),
(688, '164795718074673', 'Proteção Anti-DDoS PRO', 1),
(689, '164795718074673', 'Anti-Spam + Anti-Vírus Grátis!', 1),
(690, '164795718074673', 'Múltiplas Versões PHP 5.4 até 81', 1),
(691, '164795718074673', 'Ativação Imediata', 1),
(692, '164795718074673', 'Após primeiro pagamento', 1),
(694, '164795642398957', 'Após primeiro pagamento', 1),
(695, '164795745566090', '8 GB de Espaço SSD NVMe', 1),
(696, '164795745566090', 'Tráfego mensal : Ilimitado', 1),
(697, '164795745566090', '10 Contas de e-mail', 1),
(698, '164795745566090', '5 Contas de FTP', 1),
(699, '164795745566090', '10 Subdomínios', 1),
(700, '164795745566090', '4 Domínios de complementos', 1),
(701, '164795745566090', 'Banco de dados: Ilimitado', 1),
(702, '164795745566090', 'Certificado SSL', 1),
(703, '164795745566090', 'Proteção Anti-DDoS PRO', 1),
(704, '164795745566090', 'Anti-Spam + Anti-Vírus Grátis!', 1),
(705, '164795745566090', 'Múltiplas Versões PHP 5.4 até 8.1', 1),
(706, '164795745566090', 'Ativação Imediata', 1),
(707, '164795745566090', 'Após primeiro pagamento', 1),
(708, '164795843484622', '8 GB de Espaço SSD NVMe', 1),
(709, '164795843484622', 'Tráfego mensal : Ilimitado', 1),
(710, '164795843484622', '10 Contas de e-mail', 1),
(711, '164795843484622', '5 Contas de FTP', 1),
(712, '164795843484622', '10 Subdomínios', 1),
(713, '164795843484622', '4 Domínios de complementos', 1),
(714, '164795843484622', 'Banco de dados: Ilimitado', 1),
(715, '164795843484622', 'Certificado SSL', 1),
(716, '164795843484622', 'Proteção Anti-DDoS PRO', 1),
(717, '164795843484622', 'Anti-Spam + Anti-Vírus Grátis!', 1),
(718, '164795843484622', 'Múltiplas Versões PHP 5.4 até 8.1', 1),
(719, '164795843484622', 'Ativação Imediata', 1),
(720, '164795843484622', 'Após primeiro pagamento', 1),
(724, '170580751542165', 'Hospedagem', 1),
(725, '170580751542165', 'Domínio .TOP', 1),
(726, '170580751542165', 'Instalação Grátis via Cpanel', 1),
(739, '162775982748630', 'Domínio', 0),
(741, '162776004880949', 'Domínio', 0),
(743, '162777403626910', 'Domínio', 0),
(747, '162777418942544', 'Domínio', 0),
(749, '162777512284113', 'Domínio', 0),
(752, '162777581641649', 'Domínio', 0),
(753, '162777581641649', 'API Odds + API Resultados', 0),
(755, '162777597325842', 'Domínio', 0),
(759, '162777613327882', 'Hospedagem 1 Mês', 1),
(763, '162792035549929', 'Domínio', 0),
(767, '162792092920502', 'Instalação Grátis via Cpanel', 1),
(768, '162792092920502', 'Domínio', 0),
(769, '162792128173629', 'Domínio', 0),
(771, '162792181891294', 'Domínio', 0),
(774, '162792584946759', 'Domínio', 0),
(775, '162792584946759', 'Uso em domínios ilimitados', 1),
(776, '162792584946759', 'Arquivos 100% limpos e livres de vírus', 1),
(777, '162792584946759', 'Compra 100% Segura', 1),
(780, '162792603889013', 'Domínio', 0),
(783, '162792621047671', 'Domínio', 0),
(785, '162792684288899', 'Domínio', 0),
(787, '162792694324731', 'Domínio', 0),
(789, '162793554261595', 'Domínio', 0),
(801, '164639988923300', 'Customização R$ 150,00', 1),
(804, '164639974817143', 'Customização R$ 150,00', 1),
(807, '164640007489759', 'Customização R$ 150,00', 1),
(808, '164657630866191', 'Customização R$ 150,00', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_ordem`
--

CREATE TABLE `planos_ordem` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `planos_ordem`
--

INSERT INTO `planos_ordem` (`id`, `grupo`, `data`) VALUES
(120, '164626484342197', '218'),
(121, '164639682583165', '219'),
(133, '164639682583165', '219,231'),
(134, '164639682583165', '219,231,232'),
(135, '164639682583165', '219,231,232,233'),
(136, '164639682583165', '219,231,232,233,234'),
(137, '164639682583165', '219,231,232,233,234,235'),
(138, '164626484342197', '218,236'),
(139, '164626484342197', '218,236,237'),
(140, '164639679980918', '238'),
(141, '164639679980918', '238,239'),
(142, '164639679980918', '238,239,240'),
(143, '164639679980918', '238,239,240,241'),
(204, '164658072764501', '285'),
(154, '164657016256947', '252'),
(223, '164639679980918', '238,239,240,241,286'),
(222, '164639681116192', '264,262,263,258,254,261,253,257,259,255,260,256'),
(167, '164657225577697', '265'),
(168, '164657225577697', '265,266'),
(169, '164657225577697', '265,266,267'),
(170, '164657225577697', '265,266,267,268'),
(171, '164657225577697', '265,266,267,268,269'),
(172, '164657225577697', '265,266,267,268,269,270'),
(174, '164657348779404', '272'),
(175, '164657348779404', '272,273'),
(176, '164657348779404', '272,273,274'),
(200, '164639684064763', '242,244,243,246,248,271,249,250,247,245,251,279,283'),
(180, '164657225577697', '265,266,267,268,269,270,278'),
(186, '164639684064763', '242,244,243,246,248,271,249,250,247,245,251,279'),
(213, '164639672617272', '224,223,225,280,230,282,276,275,226,220,221,222,227,228,229'),
(224, '164795637380668', '287'),
(225, '164795637380668', '287,288'),
(227, '164795637380668', '287,288,290'),
(235, '162775883089827', '281,149,162,284,151,148,143,141,277,204,196,133,134,142,150,155,157,158,161,163,164,168,169,185,203,186,195,200,211'),
(236, '164658072764501', '285,292');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ref` varchar(100) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `valor_falso` double DEFAULT NULL,
  `previa` text,
  `descricao` text,
  `tags` text,
  `peso` int DEFAULT NULL,
  `largura` varchar(100) DEFAULT NULL,
  `comprimento` varchar(100) DEFAULT NULL,
  `altura` varchar(100) DEFAULT NULL,
  `fretegratis` int DEFAULT NULL,
  `semestoque` int DEFAULT NULL,
  `esconder` int DEFAULT NULL,
  `digital` int DEFAULT '0',
  `digital_entrega` int DEFAULT '0',
  `esconder_valor` int DEFAULT '0',
  `msg_restrito` int DEFAULT NULL,
  `sobconsulta` int DEFAULT '0',
  `formato` varchar(255) DEFAULT NULL,
  `cores` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `revestimento` varchar(255) DEFAULT NULL,
  `acabamento` varchar(255) DEFAULT NULL,
  `producao` varchar(255) DEFAULT NULL,
  `gabarito` varchar(255) DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `valor_arte` double DEFAULT NULL,
  `tipo_entrega` int DEFAULT NULL,
  `impresso` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_acabamentos`
--

CREATE TABLE `produto_acabamentos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `id_pai` int DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_categoria_ordem`
--

CREATE TABLE `produto_categoria_ordem` (
  `id` int NOT NULL,
  `id_pai` int DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produto_categoria_ordem`
--

INSERT INTO `produto_categoria_ordem` (`id`, `id_pai`, `data`) VALUES
(1, 0, '3000'),
(2, 0, '3000,3001'),
(3, 3001, ''),
(6, 3001, ''),
(5, 0, '3000'),
(7, 0, '3000,3001'),
(8, 3001, ''),
(9, 3000, '3001'),
(10, 0, '3000'),
(11, 0, '3000,3002'),
(12, 0, '3000,3002,3003'),
(13, 0, '3000,3002,3003,3004'),
(14, 0, '3000,3002,3003,3004,3005'),
(15, 0, '3000,3002,3003,3004,3005,3006'),
(16, 0, '3000,3002,3003,3004,3005,3006,3007'),
(17, 0, '3000,3002,3003,3004,3005,3006,3007,3008'),
(18, 0, '3000,3002,3003,3004,3005,3006,3007,3008,3009'),
(19, 3002, ''),
(69, 0, '3002,3003,3004,3005,3006,3010,3011'),
(21, 3004, ''),
(68, 0, '3002,3003,3004,3005,3006,3010'),
(23, 3006, ''),
(24, 3007, ''),
(25, 3009, ''),
(26, 3008, '3009'),
(27, 0, '3002,3003,3004,3005,3006,3007,3008'),
(28, 3002, ''),
(30, 3004, ''),
(32, 3006, ''),
(33, 3009, ''),
(34, 3008, '3009'),
(35, 3007, '3008'),
(36, 0, '3002,3003,3004,3005,3006,3007'),
(37, 3002, ''),
(39, 3004, ''),
(40, 3009, ''),
(41, 3008, '3009'),
(42, 3007, '3008'),
(43, 3006, '3007'),
(45, 0, '3002,3003,3004,3005'),
(46, 3002, ''),
(48, 3004, ''),
(49, 3009, ''),
(50, 3008, '3009'),
(51, 3007, '3008'),
(52, 3006, '3007'),
(67, 0, '3002,3003,3004,3005,3006'),
(54, 0, '3002,3003,3004,3005'),
(55, 3002, ''),
(56, 3004, ''),
(65, 3004, ''),
(58, 3009, ''),
(59, 3008, '3009'),
(60, 3007, '3008'),
(61, 3006, '3007'),
(66, 3006, ''),
(63, 0, '3002,3003,3005'),
(64, 3002, ''),
(70, 3002, ''),
(71, 3003, ''),
(72, 3004, ''),
(73, 3005, ''),
(74, 3006, ''),
(75, 3011, ''),
(76, 3010, '3011'),
(77, 0, '3002,3003,3004,3005,3006,3010'),
(78, 3002, ''),
(79, 3003, ''),
(80, 3004, ''),
(81, 3005, ''),
(82, 3006, ''),
(83, 0, '3002,3003,3004,3005,3006');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_categoria_sel`
--

CREATE TABLE `produto_categoria_sel` (
  `id` int NOT NULL,
  `produto_codigo` varchar(100) DEFAULT NULL,
  `categoria_codigo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_cor`
--

CREATE TABLE `produto_cor` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_cor_sel`
--

CREATE TABLE `produto_cor_sel` (
  `id` int NOT NULL,
  `produto_codigo` varchar(100) DEFAULT NULL,
  `cor_codigo` varchar(100) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_entrega_auto`
--

CREATE TABLE `produto_entrega_auto` (
  `id` int NOT NULL,
  `produto` varchar(255) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `variacao` varchar(255) DEFAULT NULL,
  `texto` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_estoque`
--

CREATE TABLE `produto_estoque` (
  `id` int NOT NULL,
  `registro` varchar(100) DEFAULT NULL,
  `produto` varchar(255) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `variacao` varchar(255) DEFAULT NULL,
  `quantidade` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_estoque_registro`
--

CREATE TABLE `produto_estoque_registro` (
  `id` int NOT NULL,
  `registro` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `quant` int NOT NULL,
  `quant_anterior` int NOT NULL,
  `quant_final` int NOT NULL,
  `descricao` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_grupos`
--

CREATE TABLE `produto_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_grupos_sel`
--

CREATE TABLE `produto_grupos_sel` (
  `id` int NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `produto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_imagem`
--

CREATE TABLE `produto_imagem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `imagem` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_imagem_ordem`
--

CREATE TABLE `produto_imagem_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_marcadagua`
--

CREATE TABLE `produto_marcadagua` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produto_marcadagua`
--

INSERT INTO `produto_marcadagua` (`id`, `codigo`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_modelos`
--

CREATE TABLE `produto_modelos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_modelos_categorias`
--

CREATE TABLE `produto_modelos_categorias` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_modelos_sel`
--

CREATE TABLE `produto_modelos_sel` (
  `id` int NOT NULL,
  `produto_codigo` varchar(100) DEFAULT NULL,
  `layout_codigo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_tamanho`
--

CREATE TABLE `produto_tamanho` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_tamanho_sel`
--

CREATE TABLE `produto_tamanho_sel` (
  `id` int NOT NULL,
  `produto_codigo` varchar(100) DEFAULT NULL,
  `tamanho_codigo` varchar(100) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_variacao`
--

CREATE TABLE `produto_variacao` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_variacao_sel`
--

CREATE TABLE `produto_variacao_sel` (
  `id` int NOT NULL,
  `produto_codigo` varchar(100) DEFAULT NULL,
  `variacao_codigo` varchar(100) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `programacao`
--

CREATE TABLE `programacao` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `inicio` int DEFAULT NULL,
  `programa` varchar(255) DEFAULT NULL,
  `apresentador` varchar(255) DEFAULT NULL,
  `descricao` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `programacao`
--

INSERT INTO `programacao` (`id`, `codigo`, `dia`, `inicio`, `programa`, `apresentador`, `descricao`) VALUES
(1, '161489132018673', 2, 462056040, 'Roque', 'Fulano', NULL),
(2, '161489154144232', 2, 462051780, 'Forró', 'Ciclano', NULL),
(3, '161489174275858', 2, 462049200, 'Sertanojo', 'Ciclano', NULL),
(5, '161489336646021', 5, 462056400, 'Roque', 'Fulano', NULL),
(6, '161489339153056', 5, 462058200, 'Sertanojo', 'Ciclano', NULL),
(7, '161496559769818', 6, 462043920, 'Teste sexta 1', 'Fulano', NULL),
(10, '161496672313393', 7, 462045060, 'teste sabado', 'aasdasdasdasd', NULL),
(11, '161541282188462', 4, 462045600, 'Roque', 'Fulano', NULL),
(12, '161541284062997', 4, 462056400, 'Roque 2', 'Ciclano', NULL),
(13, '161541288066799', 4, 462063600, 'Roque 3', 'Fulano 2', NULL),
(14, '161641866681031', 2, 461995800, 'Programa da manha', 'teste', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `programacao_grupos`
--

CREATE TABLE `programacao_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '0',
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `programacao_player`
--

CREATE TABLE `programacao_player` (
  `id` int NOT NULL,
  `endereco` text,
  `status` int DEFAULT '0',
  `cor_fundo` varchar(30) DEFAULT NULL,
  `cor_botao_ico` varchar(30) DEFAULT NULL,
  `cor_texto1` varchar(30) DEFAULT NULL,
  `cor_texto2` varchar(30) DEFAULT NULL,
  `cor_titulo_atual_fundo` varchar(30) DEFAULT NULL,
  `cor_titulo_atual_texto` varchar(30) DEFAULT NULL,
  `cor_titulo_prox_fundo` varchar(30) DEFAULT NULL,
  `cor_titulo_prox_texto` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `programacao_player`
--

INSERT INTO `programacao_player` (`id`, `endereco`, `status`, `cor_fundo`, `cor_botao_ico`, `cor_texto1`, `cor_texto2`, `cor_titulo_atual_fundo`, `cor_titulo_atual_texto`, `cor_titulo_prox_fundo`, `cor_titulo_prox_texto`) VALUES
(1, 'http://radioweb.audiosul.com:8293/stream', 0, '#333333', '#ffffff', '#ffffff', '#666666', '#8f5656', '#ffffff', '#ff0000', '#ffffff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rastreamento`
--

CREATE TABLE `rastreamento` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT NULL,
  `tipo` int DEFAULT '0',
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL,
  `imagem_fundo` varchar(255) DEFAULT NULL,
  `posicao` int DEFAULT NULL,
  `botao_titulo` varchar(255) DEFAULT NULL,
  `imagem_fundo_tipo` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rastreamento_objetos`
--

CREATE TABLE `rastreamento_objetos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `origem` varchar(255) DEFAULT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `volumes` int DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rastreamento_objetos_itens`
--

CREATE TABLE `rastreamento_objetos_itens` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rede_social`
--

CREATE TABLE `rede_social` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(200) DEFAULT NULL,
  `endereco` text,
  `imagem` varchar(240) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `rede_social`
--

INSERT INTO `rede_social` (`id`, `codigo`, `titulo`, `endereco`, `imagem`) VALUES
(27, '158032786568667', 'Instagram', 'https://www.instagram.com/scriptlivrephp', 'instagram-logo-[03-03-21][13-05-41].svg'),
(26, '158032782215446', 'Facebook', 'https://www.facebook.com/scriptlivre', 'facebok-logo-buton-[03-03-21][13-05-51].svg'),
(29, '161478757878591', 'Youtube', 'https://goo.gl/WkU94T', 'youtube-[03-03-21][13-06-25].svg'),
(30, '161478767225191', 'Twitter', '#', 'twiter-logo-buton-[03-03-21][13-07-58].svg'),
(31, '161478768786638', 'Whatsapp', 'https://api.whatsapp.com/send?phone=5511961817094', 'whatsap-[03-03-21][13-08-13].svg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rede_social_ordem`
--

CREATE TABLE `rede_social_ordem` (
  `id` int NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `rede_social_ordem`
--

INSERT INTO `rede_social_ordem` (`id`, `data`) VALUES
(1, '2'),
(2, '2,3'),
(3, '3,2'),
(4, '2,3'),
(5, '2,3,4'),
(6, '4,3'),
(7, '3,4'),
(8, '3,4,5'),
(9, '3,4,5,6'),
(10, '3,4,5,6,7'),
(11, '3,4,5,6,7,8'),
(12, '3,4,5,6,7,8,9'),
(13, '3,4,5,6,7,8,9,10'),
(14, '3,4,5,6,7,8,9,10,11'),
(15, '3,4,5,6,7,8,9,10,11,12'),
(16, '3,4,5,6,7,8,9,10,11,12,13'),
(17, '3,4,5,6,7,8,9,10,11,12,13,14'),
(18, '9,11,12,14,13'),
(19, '11,12,9,14,13'),
(20, '12,11,9,14,13'),
(21, '11,12,9,14,13'),
(22, '12,11,9,14,13'),
(23, '11,12,9,14,13'),
(24, '11,12,9,14,13,15'),
(25, '9,11,12'),
(26, '9,12,11'),
(27, '9,12,11,16'),
(28, '9,12,11,16,17'),
(29, '9,12,11,16,17,18'),
(30, '18'),
(31, '18,19'),
(32, '19,18'),
(33, '18,19'),
(34, '18,19,20'),
(35, '18,19,20,21'),
(36, '21,20'),
(37, '20,21'),
(38, '20,21,22'),
(39, '20,21,22,23'),
(40, '20,21,22,23,24'),
(41, '20,21,22,23,24,0'),
(42, '20,21,22,23,24,0,0'),
(43, '20,21,22,23,24,0,0,25'),
(44, '20,21,22,23,24,0,0,25,26'),
(45, '20,21,22,23,24,0,0,25,26,27'),
(46, '20,21,22,23,24,0,0,25,26,27,28'),
(47, '27,26'),
(48, '27,26,29'),
(49, '27,26,29,30'),
(50, '27,26,29,30,31'),
(51, '26,27,29,30,31'),
(52, '26,27,30,29,31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `revistajornal`
--

CREATE TABLE `revistajornal` (
  `id` int UNSIGNED NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `formato` varchar(100) DEFAULT NULL,
  `paginas` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `previa` text,
  `edicao` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `revistajornal`
--

INSERT INTO `revistajornal` (`id`, `codigo`, `formato`, `paginas`, `titulo`, `previa`, `edicao`) VALUES
(5, '160010582158796', '160010542626004', 4, 'teste', 'tesdfsdfsdf', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `revistajornal_formatos`
--

CREATE TABLE `revistajornal_formatos` (
  `id` int UNSIGNED NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `pequena_largura` int DEFAULT NULL,
  `pequena_altura` int DEFAULT NULL,
  `grande_largura` int NOT NULL,
  `grande_altura` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `revistajornal_formatos`
--

INSERT INTO `revistajornal_formatos` (`id`, `codigo`, `titulo`, `pequena_largura`, `pequena_altura`, `grande_largura`, `grande_altura`) VALUES
(7, '160010542626004', 'Revista', 480, 600, 1200, 1600);

-- --------------------------------------------------------

--
-- Estrutura para tabela `revistajornal_grupos`
--

CREATE TABLE `revistajornal_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '1',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `revistajornal_grupos_sel`
--

CREATE TABLE `revistajornal_grupos_sel` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `revistajornal_grupos_sel`
--

INSERT INTO `revistajornal_grupos_sel` (`id`, `codigo`, `grupo`) VALUES
(2, '159466742883576', '159464169932659'),
(5, '159466742883576', '159466720342350'),
(6, '159682231337174', '159682235286345'),
(7, '159682461859114', '159682235286345'),
(8, '160010582158796', '160010544577948');

-- --------------------------------------------------------

--
-- Estrutura para tabela `revistajornal_imagem`
--

CREATE TABLE `revistajornal_imagem` (
  `id` int UNSIGNED NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `pagina` int DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `revistajornal_imagem`
--

INSERT INTO `revistajornal_imagem` (`id`, `codigo`, `pagina`, `imagem`) VALUES
(12, '160010582158796', 1, '1-[14-09-20][14-50-25].jpg'),
(13, '160010582158796', 2, '2-[14-09-20][14-50-29].jpg'),
(14, '160010582158796', 3, '3-[14-09-20][14-50-32].jpg'),
(15, '160010582158796', 4, '4-[14-09-20][14-50-35].jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `conteudo` text,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos_grupos`
--

CREATE TABLE `servicos_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos_ordem`
--

CREATE TABLE `servicos_ordem` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `textos`
--

CREATE TABLE `textos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `conteudo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `textos`
--

INSERT INTO `textos` (`id`, `codigo`, `titulo`, `conteudo`) VALUES
(62, '154474571539640', 'Rodape - Contato 1', '(11) 9 6181-7094'),
(63, '154474577677620', 'Rodape - Contato 2', 'contato@scriptlivre.top'),
(64, '156630113722300', 'Telefone Chat/Whats', '5511961817094'),
(67, '321321', 'Aceitar Termos', 'Este site usa cookies para personalizar o conteúdo e analisar o tráfego a fim de oferecer a você uma experiência melhor.'),
(68, '32132112', 'lINK Selo de segurança Safe-Browsing', 'https://transparencyreport.google.com/safe-browsing/search?url=hostlocal.com.br&hl=pt-PT');

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos`
--

CREATE TABLE `videos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `previa` text,
  `conteudo` text,
  `ordem` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `videos`
--

INSERT INTO `videos` (`id`, `codigo`, `categoria`, `titulo`, `previa`, `conteudo`, `ordem`) VALUES
(30, '159674186258770', '158499059672805', 'Video 1', 'teste teste', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5aB1GuB9L7o\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', NULL),
(31, '159674474825498', '158499059672805', 'Video 2', '', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5aB1GuB9L7o\" frameborder=\"0\" allow=\"accelerometer;  encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', NULL),
(32, '159674475895915', '159467709398603', 'Video 3', '', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5aB1GuB9L7o\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `grupo` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `videos_categorias`
--

INSERT INTO `videos_categorias` (`id`, `codigo`, `grupo`, `titulo`, `imagem`) VALUES
(19, '158499059672805', '159976933295432', 'Categoria 1', NULL),
(21, '159467709398603', '159976933295432', 'Categoria 2', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos_grupos`
--

CREATE TABLE `videos_grupos` (
  `id` int NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT '1',
  `itens_por_linha` int DEFAULT NULL,
  `descricao` text,
  `mostrar_categorias` int DEFAULT '1',
  `mostrar_titulo_video` int DEFAULT '1',
  `tipo_menu` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `widgets`
--

CREATE TABLE `widgets` (
  `id` int UNSIGNED NOT NULL,
  `codigo` char(100) DEFAULT NULL,
  `titulo` char(255) DEFAULT NULL,
  `mostrar_titulo` int DEFAULT NULL,
  `conteudo` text,
  `enquadramento` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acordeon`
--
ALTER TABLE `acordeon`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `acordeon_grupos`
--
ALTER TABLE `acordeon_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `acordeon_ordem`
--
ALTER TABLE `acordeon_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adm_config`
--
ALTER TABLE `adm_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adm_setores`
--
ALTER TABLE `adm_setores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adm_setores_ordem`
--
ALTER TABLE `adm_setores_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adm_setores_perfil`
--
ALTER TABLE `adm_setores_perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adm_setores_usuario`
--
ALTER TABLE `adm_setores_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_1` (`setor`,`usuario`);

--
-- Índices de tabela `adm_usuario`
--
ALTER TABLE `adm_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `balcoes`
--
ALTER TABLE `balcoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banners_grupos`
--
ALTER TABLE `banners_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banners_ordem`
--
ALTER TABLE `banners_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blocos`
--
ALTER TABLE `blocos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_comentarios`
--
ALTER TABLE `cadastro_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_email`
--
ALTER TABLE `cadastro_email`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_email_grupos`
--
ALTER TABLE `cadastro_email_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_fone`
--
ALTER TABLE `cadastro_fone`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_fone_grupos`
--
ALTER TABLE `cadastro_fone_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro_grupos`
--
ALTER TABLE `cadastro_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `caracteristicas_grupos`
--
ALTER TABLE `caracteristicas_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `caracteristicas_ordem`
--
ALTER TABLE `caracteristicas_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Cidade_estado` (`estado`);

--
-- Índices de tabela `contador`
--
ALTER TABLE `contador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contador_grupos`
--
ALTER TABLE `contador_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contador_ordem`
--
ALTER TABLE `contador_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contato_grupos`
--
ALTER TABLE `contato_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contato_ordem`
--
ALTER TABLE `contato_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conteudos`
--
ALTER TABLE `conteudos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupom_lista`
--
ALTER TABLE `cupom_lista`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `depoimentos_grupos`
--
ALTER TABLE `depoimentos_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `destaques`
--
ALTER TABLE `destaques`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `destaques_grupos`
--
ALTER TABLE `destaques_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `destaques_ordem`
--
ALTER TABLE `destaques_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `duvidas`
--
ALTER TABLE `duvidas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `duvidas_grupos`
--
ALTER TABLE `duvidas_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `duvidas_ordem`
--
ALTER TABLE `duvidas_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `enquete`
--
ALTER TABLE `enquete`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `enquete_resposta`
--
ALTER TABLE `enquete_resposta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `enquete_voto`
--
ALTER TABLE `enquete_voto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `equipe_grupos`
--
ALTER TABLE `equipe_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `equipe_ordem`
--
ALTER TABLE `equipe_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais`
--
ALTER TABLE `filiais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais_grupos`
--
ALTER TABLE `filiais_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais_imagem`
--
ALTER TABLE `filiais_imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais_imagem_legenda`
--
ALTER TABLE `filiais_imagem_legenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais_imagem_ordem`
--
ALTER TABLE `filiais_imagem_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `filiais_ordem`
--
ALTER TABLE `filiais_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_categorias`
--
ALTER TABLE `fotos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_grupos`
--
ALTER TABLE `fotos_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_imagem`
--
ALTER TABLE `fotos_imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_imagem_legenda`
--
ALTER TABLE `fotos_imagem_legenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_imagem_ordem`
--
ALTER TABLE `fotos_imagem_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_marcadagua`
--
ALTER TABLE `fotos_marcadagua`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotos_ordem`
--
ALTER TABLE `fotos_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `frete`
--
ALTER TABLE `frete`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagem_enviadas`
--
ALTER TABLE `imagem_enviadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_cores`
--
ALTER TABLE `layout_cores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_itens`
--
ALTER TABLE `layout_itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_itens_cores`
--
ALTER TABLE `layout_itens_cores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_itens_cores_sel`
--
ALTER TABLE `layout_itens_cores_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_itens_ordem`
--
ALTER TABLE `layout_itens_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_menu`
--
ALTER TABLE `layout_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_menu_ordem`
--
ALTER TABLE `layout_menu_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_menu_rodape`
--
ALTER TABLE `layout_menu_rodape`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_menu_rodape_ordem`
--
ALTER TABLE `layout_menu_rodape_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_paginas`
--
ALTER TABLE `layout_paginas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_rodapes`
--
ALTER TABLE `layout_rodapes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_rodapes_cores`
--
ALTER TABLE `layout_rodapes_cores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_rodapes_cores_sel`
--
ALTER TABLE `layout_rodapes_cores_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_rodapes_modelos`
--
ALTER TABLE `layout_rodapes_modelos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_topos`
--
ALTER TABLE `layout_topos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_topos_cores`
--
ALTER TABLE `layout_topos_cores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_topos_cores_sel`
--
ALTER TABLE `layout_topos_cores_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layout_topos_modelos`
--
ALTER TABLE `layout_topos_modelos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marcadagua`
--
ALTER TABLE `marcadagua`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_autores`
--
ALTER TABLE `noticia_autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_categorias`
--
ALTER TABLE `noticia_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_destaque`
--
ALTER TABLE `noticia_destaque`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_grupos`
--
ALTER TABLE `noticia_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_grupos_sel`
--
ALTER TABLE `noticia_grupos_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_imagem`
--
ALTER TABLE `noticia_imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_imagem_legenda`
--
ALTER TABLE `noticia_imagem_legenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_imagem_ordem`
--
ALTER TABLE `noticia_imagem_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticia_marcadagua`
--
ALTER TABLE `noticia_marcadagua`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `parceiros`
--
ALTER TABLE `parceiros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `parceiros_grupos`
--
ALTER TABLE `parceiros_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `parceiros_ordem`
--
ALTER TABLE `parceiros_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido_loja`
--
ALTER TABLE `pedido_loja`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido_loja_carrinho`
--
ALTER TABLE `pedido_loja_carrinho`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido_loja_mensagens`
--
ALTER TABLE `pedido_loja_mensagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido_loja_status`
--
ALTER TABLE `pedido_loja_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos_grupos`
--
ALTER TABLE `planos_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos_itens`
--
ALTER TABLE `planos_itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `planos_ordem`
--
ALTER TABLE `planos_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_acabamentos`
--
ALTER TABLE `produto_acabamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_categoria_ordem`
--
ALTER TABLE `produto_categoria_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_categoria_sel`
--
ALTER TABLE `produto_categoria_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_cor`
--
ALTER TABLE `produto_cor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_cor_sel`
--
ALTER TABLE `produto_cor_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_entrega_auto`
--
ALTER TABLE `produto_entrega_auto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_estoque`
--
ALTER TABLE `produto_estoque`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_estoque_registro`
--
ALTER TABLE `produto_estoque_registro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_grupos`
--
ALTER TABLE `produto_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_grupos_sel`
--
ALTER TABLE `produto_grupos_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_imagem`
--
ALTER TABLE `produto_imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_imagem_ordem`
--
ALTER TABLE `produto_imagem_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_marcadagua`
--
ALTER TABLE `produto_marcadagua`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_modelos`
--
ALTER TABLE `produto_modelos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_modelos_categorias`
--
ALTER TABLE `produto_modelos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_modelos_sel`
--
ALTER TABLE `produto_modelos_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_tamanho`
--
ALTER TABLE `produto_tamanho`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_tamanho_sel`
--
ALTER TABLE `produto_tamanho_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_variacao`
--
ALTER TABLE `produto_variacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_variacao_sel`
--
ALTER TABLE `produto_variacao_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `programacao`
--
ALTER TABLE `programacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `programacao_grupos`
--
ALTER TABLE `programacao_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `programacao_player`
--
ALTER TABLE `programacao_player`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rastreamento`
--
ALTER TABLE `rastreamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rastreamento_objetos`
--
ALTER TABLE `rastreamento_objetos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rastreamento_objetos_itens`
--
ALTER TABLE `rastreamento_objetos_itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rede_social`
--
ALTER TABLE `rede_social`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rede_social_ordem`
--
ALTER TABLE `rede_social_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `revistajornal`
--
ALTER TABLE `revistajornal`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `revistajornal_formatos`
--
ALTER TABLE `revistajornal_formatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `revistajornal_grupos`
--
ALTER TABLE `revistajornal_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `revistajornal_grupos_sel`
--
ALTER TABLE `revistajornal_grupos_sel`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `revistajornal_imagem`
--
ALTER TABLE `revistajornal_imagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_1` (`codigo`,`pagina`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos_grupos`
--
ALTER TABLE `servicos_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos_ordem`
--
ALTER TABLE `servicos_ordem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `textos`
--
ALTER TABLE `textos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `videos_categorias`
--
ALTER TABLE `videos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `videos_grupos`
--
ALTER TABLE `videos_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acordeon`
--
ALTER TABLE `acordeon`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de tabela `acordeon_grupos`
--
ALTER TABLE `acordeon_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `acordeon_ordem`
--
ALTER TABLE `acordeon_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `adm_config`
--
ALTER TABLE `adm_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `adm_setores`
--
ALTER TABLE `adm_setores`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de tabela `adm_setores_ordem`
--
ALTER TABLE `adm_setores_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de tabela `adm_setores_perfil`
--
ALTER TABLE `adm_setores_perfil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT de tabela `adm_setores_usuario`
--
ALTER TABLE `adm_setores_usuario`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;

--
-- AUTO_INCREMENT de tabela `adm_usuario`
--
ALTER TABLE `adm_usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `balcoes`
--
ALTER TABLE `balcoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de tabela `banners_grupos`
--
ALTER TABLE `banners_grupos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `banners_ordem`
--
ALTER TABLE `banners_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de tabela `blocos`
--
ALTER TABLE `blocos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cadastro_comentarios`
--
ALTER TABLE `cadastro_comentarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cadastro_email`
--
ALTER TABLE `cadastro_email`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `cadastro_email_grupos`
--
ALTER TABLE `cadastro_email_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cadastro_fone`
--
ALTER TABLE `cadastro_fone`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `cadastro_fone_grupos`
--
ALTER TABLE `cadastro_fone_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cadastro_grupos`
--
ALTER TABLE `cadastro_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de tabela `caracteristicas_grupos`
--
ALTER TABLE `caracteristicas_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `caracteristicas_ordem`
--
ALTER TABLE `caracteristicas_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5565;

--
-- AUTO_INCREMENT de tabela `contador`
--
ALTER TABLE `contador`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de tabela `contador_grupos`
--
ALTER TABLE `contador_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `contador_ordem`
--
ALTER TABLE `contador_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de tabela `contato_grupos`
--
ALTER TABLE `contato_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `contato_ordem`
--
ALTER TABLE `contato_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `conteudos`
--
ALTER TABLE `conteudos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `cupom_lista`
--
ALTER TABLE `cupom_lista`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `depoimentos_grupos`
--
ALTER TABLE `depoimentos_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `destaques`
--
ALTER TABLE `destaques`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `destaques_grupos`
--
ALTER TABLE `destaques_grupos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `destaques_ordem`
--
ALTER TABLE `destaques_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `duvidas`
--
ALTER TABLE `duvidas`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de tabela `duvidas_grupos`
--
ALTER TABLE `duvidas_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `duvidas_ordem`
--
ALTER TABLE `duvidas_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `enquete`
--
ALTER TABLE `enquete`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `enquete_resposta`
--
ALTER TABLE `enquete_resposta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `enquete_voto`
--
ALTER TABLE `enquete_voto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `equipe_grupos`
--
ALTER TABLE `equipe_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `equipe_ordem`
--
ALTER TABLE `equipe_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `filiais`
--
ALTER TABLE `filiais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `filiais_grupos`
--
ALTER TABLE `filiais_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `filiais_imagem`
--
ALTER TABLE `filiais_imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `filiais_imagem_legenda`
--
ALTER TABLE `filiais_imagem_legenda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `filiais_imagem_ordem`
--
ALTER TABLE `filiais_imagem_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `filiais_ordem`
--
ALTER TABLE `filiais_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `fotos_categorias`
--
ALTER TABLE `fotos_categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `fotos_grupos`
--
ALTER TABLE `fotos_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fotos_imagem`
--
ALTER TABLE `fotos_imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de tabela `fotos_imagem_legenda`
--
ALTER TABLE `fotos_imagem_legenda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `fotos_imagem_ordem`
--
ALTER TABLE `fotos_imagem_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de tabela `fotos_marcadagua`
--
ALTER TABLE `fotos_marcadagua`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `fotos_ordem`
--
ALTER TABLE `fotos_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `frete`
--
ALTER TABLE `frete`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `imagem_enviadas`
--
ALTER TABLE `imagem_enviadas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de tabela `layout_cores`
--
ALTER TABLE `layout_cores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `layout_itens`
--
ALTER TABLE `layout_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1268;

--
-- AUTO_INCREMENT de tabela `layout_itens_cores`
--
ALTER TABLE `layout_itens_cores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de tabela `layout_itens_cores_sel`
--
ALTER TABLE `layout_itens_cores_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;

--
-- AUTO_INCREMENT de tabela `layout_itens_ordem`
--
ALTER TABLE `layout_itens_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1949;

--
-- AUTO_INCREMENT de tabela `layout_menu`
--
ALTER TABLE `layout_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `layout_menu_ordem`
--
ALTER TABLE `layout_menu_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `layout_menu_rodape`
--
ALTER TABLE `layout_menu_rodape`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `layout_menu_rodape_ordem`
--
ALTER TABLE `layout_menu_rodape_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `layout_paginas`
--
ALTER TABLE `layout_paginas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `layout_rodapes`
--
ALTER TABLE `layout_rodapes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `layout_rodapes_cores`
--
ALTER TABLE `layout_rodapes_cores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `layout_rodapes_cores_sel`
--
ALTER TABLE `layout_rodapes_cores_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `layout_rodapes_modelos`
--
ALTER TABLE `layout_rodapes_modelos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `layout_topos`
--
ALTER TABLE `layout_topos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `layout_topos_cores`
--
ALTER TABLE `layout_topos_cores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de tabela `layout_topos_cores_sel`
--
ALTER TABLE `layout_topos_cores_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `layout_topos_modelos`
--
ALTER TABLE `layout_topos_modelos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `marcadagua`
--
ALTER TABLE `marcadagua`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `meta`
--
ALTER TABLE `meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `noticia_autores`
--
ALTER TABLE `noticia_autores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `noticia_categorias`
--
ALTER TABLE `noticia_categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `noticia_destaque`
--
ALTER TABLE `noticia_destaque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `noticia_grupos`
--
ALTER TABLE `noticia_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `noticia_grupos_sel`
--
ALTER TABLE `noticia_grupos_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `noticia_imagem`
--
ALTER TABLE `noticia_imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `noticia_imagem_legenda`
--
ALTER TABLE `noticia_imagem_legenda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `noticia_imagem_ordem`
--
ALTER TABLE `noticia_imagem_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `noticia_marcadagua`
--
ALTER TABLE `noticia_marcadagua`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `parceiros`
--
ALTER TABLE `parceiros`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `parceiros_grupos`
--
ALTER TABLE `parceiros_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `parceiros_ordem`
--
ALTER TABLE `parceiros_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `pedido_loja`
--
ALTER TABLE `pedido_loja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `pedido_loja_carrinho`
--
ALTER TABLE `pedido_loja_carrinho`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_loja_mensagens`
--
ALTER TABLE `pedido_loja_mensagens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedido_loja_status`
--
ALTER TABLE `pedido_loja_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT de tabela `planos_grupos`
--
ALTER TABLE `planos_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `planos_itens`
--
ALTER TABLE `planos_itens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=809;

--
-- AUTO_INCREMENT de tabela `planos_ordem`
--
ALTER TABLE `planos_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `produto_acabamentos`
--
ALTER TABLE `produto_acabamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3012;

--
-- AUTO_INCREMENT de tabela `produto_categoria_ordem`
--
ALTER TABLE `produto_categoria_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de tabela `produto_categoria_sel`
--
ALTER TABLE `produto_categoria_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `produto_cor`
--
ALTER TABLE `produto_cor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produto_cor_sel`
--
ALTER TABLE `produto_cor_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `produto_entrega_auto`
--
ALTER TABLE `produto_entrega_auto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produto_estoque`
--
ALTER TABLE `produto_estoque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto_estoque_registro`
--
ALTER TABLE `produto_estoque_registro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto_grupos`
--
ALTER TABLE `produto_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_grupos_sel`
--
ALTER TABLE `produto_grupos_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_imagem`
--
ALTER TABLE `produto_imagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `produto_imagem_ordem`
--
ALTER TABLE `produto_imagem_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_marcadagua`
--
ALTER TABLE `produto_marcadagua`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto_modelos`
--
ALTER TABLE `produto_modelos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `produto_modelos_categorias`
--
ALTER TABLE `produto_modelos_categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `produto_modelos_sel`
--
ALTER TABLE `produto_modelos_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_tamanho`
--
ALTER TABLE `produto_tamanho`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `produto_tamanho_sel`
--
ALTER TABLE `produto_tamanho_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `produto_variacao`
--
ALTER TABLE `produto_variacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produto_variacao_sel`
--
ALTER TABLE `produto_variacao_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `programacao`
--
ALTER TABLE `programacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `programacao_grupos`
--
ALTER TABLE `programacao_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `programacao_player`
--
ALTER TABLE `programacao_player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `rastreamento`
--
ALTER TABLE `rastreamento`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de tabela `rastreamento_objetos`
--
ALTER TABLE `rastreamento_objetos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `rastreamento_objetos_itens`
--
ALTER TABLE `rastreamento_objetos_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `rede_social`
--
ALTER TABLE `rede_social`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `rede_social_ordem`
--
ALTER TABLE `rede_social_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `revistajornal`
--
ALTER TABLE `revistajornal`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `revistajornal_formatos`
--
ALTER TABLE `revistajornal_formatos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `revistajornal_grupos`
--
ALTER TABLE `revistajornal_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `revistajornal_grupos_sel`
--
ALTER TABLE `revistajornal_grupos_sel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `revistajornal_imagem`
--
ALTER TABLE `revistajornal_imagem`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de tabela `servicos_grupos`
--
ALTER TABLE `servicos_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos_ordem`
--
ALTER TABLE `servicos_ordem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `textos`
--
ALTER TABLE `textos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `videos_categorias`
--
ALTER TABLE `videos_categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `videos_grupos`
--
ALTER TABLE `videos_grupos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
