-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jul-2016 às 11:15
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vjcliente`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `func_add_carregamento`(`idCar` INT, `numCartao` BIGINT, `idPacote` INT, `dat` DATE, `qtd` INT, `valor` DOUBLE, `valorTotal` DOUBLE) RETURNS tinyint(4)
BEGIN
		
	insert into tb_carregamento (car_id, car_cartao_num, car_pacote_id, carr_data, carr_quantidade, carr_valor, carr_valor_total)
	
	values(idCar, numCartao, idPacote, dat, qtd, valor, valorTotal);
	
	return 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `func_excluir_carregamento`(`idCarreg` INT) RETURNS tinyint(4)
BEGIN
	delete from tb_carregamento where car_id = idCarreg;
	return 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `func_excluir_cliente`(`idCliente` INT) RETURNS int(11)
BEGIN
	delete from tb_cliente where (cli_id = idCliente) ;
	
	RETURN 1;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `func_max_carreg`() RETURNS int(11)
BEGIN
	declare maximo int DEFAULT(select max(car_id) from tb_carregamento);
	
	if(maximo is null) then
		return 0;
	else
		return maximo;
	end if;
	
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `func_max_cliente`() RETURNS int(11)
BEGIN
	declare maximo int DEFAULT(select max(cli_id) from tb_cliente);
	
	if(maximo is null) then
		return 0;
	else
		return maximo;
	end if;
	
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fun_add_ciente`(`cli_id` INT, `nome` VARCHAR(50), `apelido` VARCHAR(50), `sexo` VARCHAR(50), `tel` VARCHAR(50), `email` VARCHAR(50), `morada` VARCHAR(50), `trabalho` VARCHAR(50), `servico` INT, `cartao` BIGINT) RETURNS int(11)
BEGIN
									
	insert into tb_cliente (cli_id, cli_nome, cli_apellido, cli_sexo, cli_telefone, cli_email, cli_morada, cli_localTrabalho)
	
	values (cli_id, nome, apelido, sexo, tel, email, morada, trabalho);
	
	
	insert into tb_cartao (cart_numero, cart_cliente_id, cart_servico_id) values (cartao, cli_id, servico);
	
	return 1; -- inserido com sucesso

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carregamento`
--

CREATE TABLE IF NOT EXISTS `tb_carregamento` (
  `car_id` int(11) NOT NULL,
  `car_cartao_num` bigint(20) NOT NULL,
  `car_pacote_id` int(11) NOT NULL,
  `carr_data` date NOT NULL,
  `carr_quantidade` int(11) NOT NULL,
  `carr_valor` double NOT NULL,
  `carr_valor_total` double NOT NULL,
  `carr_dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cartao`
--

CREATE TABLE IF NOT EXISTS `tb_cartao` (
`cart_id` int(11) NOT NULL,
  `cart_numero` bigint(20) NOT NULL,
  `cart_cliente_id` int(11) NOT NULL,
  `cart_servico_id` int(11) NOT NULL,
  `cart_dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Extraindo dados da tabela `tb_cartao`
--

INSERT INTO `tb_cartao` (`cart_id`, `cart_numero`, `cart_cliente_id`, `cart_servico_id`, `cart_dtReg`) VALUES
(41, 367467467467, 1, 2, '2016-07-08 16:26:55'),
(43, 367363763763, 2, 2, '2016-07-11 07:00:05'),
(44, 47467647464, 3, 1, '2016-07-11 07:03:57'),
(45, 78574875845, 4, 1, '2016-07-11 07:06:39'),
(46, 46746736544, 5, 1, '2016-07-11 07:14:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE IF NOT EXISTS `tb_cliente` (
`cli_sequencia` int(11) NOT NULL,
  `cli_id` int(11) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `cli_apellido` varchar(50) NOT NULL,
  `cli_sexo` varchar(50) NOT NULL DEFAULT 'Masculino',
  `cli_telefone` varchar(50) NOT NULL,
  `cli_email` varchar(50) DEFAULT NULL,
  `cli_morada` varchar(50) NOT NULL,
  `cli_localTrabalho` varchar(50) NOT NULL,
  `cli_dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`cli_sequencia`, `cli_id`, `cli_nome`, `cli_apellido`, `cli_sexo`, `cli_telefone`, `cli_email`, `cli_morada`, `cli_localTrabalho`, `cli_dtReg`) VALUES
(1, 1, 'wilson', 'Rosario', 'Masculino', '940-4944', '', '', '', '2016-07-08 16:26:55'),
(3, 2, 'Arlecia', 'Baia', 'Feminino', '909-3783', '', '', '', '2016-07-11 07:00:05'),
(4, 3, 'Carlos', 'Trovoada', 'Masculino', '992-7272', '', '', '', '2016-07-11 07:03:57'),
(7, 4, 'Pedro', 'Mota', 'Masculino', '784-7847', '', '', '', '2016-07-11 07:06:39'),
(14, 5, 'Alice', 'Pinho', 'Masculino', '484-7874', '', '', '', '2016-07-11 07:14:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pacote`
--

CREATE TABLE IF NOT EXISTS `tb_pacote` (
`pac_id` int(11) NOT NULL,
  `pac_descricao` varchar(50) NOT NULL,
  `pac_servico_id` int(11) NOT NULL,
  `pac_dt_reg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tb_pacote`
--

INSERT INTO `tb_pacote` (`pac_id`, `pac_descricao`, `pac_servico_id`, `pac_dt_reg`) VALUES
(1, 'DSTV-mini', 1, '2016-07-01 09:44:22'),
(2, 'DSTV- grand', 1, '2016-07-01 09:44:51'),
(3, 'DSTV- bue+', 1, '2016-07-01 09:45:17'),
(4, 'ZAP- mini', 2, '2016-07-01 09:46:21'),
(5, 'ZAP- max', 2, '2016-07-01 09:46:41'),
(6, 'ZAP- premium', 2, '2016-07-01 09:47:25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_precario`
--

CREATE TABLE IF NOT EXISTS `tb_precario` (
`prec_id` int(11) NOT NULL,
  `prec_pacote_id` int(11) NOT NULL,
  `prec_valor_unitario` double NOT NULL,
  `prec_estado` tinyint(4) NOT NULL DEFAULT '1',
  `prec_dt_Reg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tb_precario`
--

INSERT INTO `tb_precario` (`prec_id`, `prec_pacote_id`, `prec_valor_unitario`, `prec_estado`, `prec_dt_Reg`) VALUES
(1, 4, 200000, 1, '2016-07-06 15:16:09'),
(2, 5, 400000, 1, '2016-07-06 15:16:21'),
(3, 6, 800000, 1, '2016-07-06 15:16:25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servico`
--

CREATE TABLE IF NOT EXISTS `tb_servico` (
`ser_id` int(11) NOT NULL,
  `ser_descricao` varchar(50) NOT NULL,
  `ser_dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_servico`
--

INSERT INTO `tb_servico` (`ser_id`, `ser_descricao`, `ser_dtReg`) VALUES
(1, 'DSTV', '2016-07-01 09:40:09'),
(2, 'ZAP', '2016-07-01 09:40:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE IF NOT EXISTS `tb_usuario` (
`user_id` int(11) NOT NULL,
  `user_nome` varchar(50) NOT NULL,
  `user_apelido` varchar(50) NOT NULL,
  `user_senha` varchar(50) NOT NULL,
  `user_tipo` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`user_id`, `user_nome`, `user_apelido`, `user_senha`, `user_tipo`) VALUES
(1, 'Evandro', 'Monteiro', '112', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_cliente`
--
CREATE TABLE IF NOT EXISTS `view_cliente` (
`cli_id` int(11)
,`cli_nome` varchar(50)
,`cli_apellido` varchar(50)
,`cli_sexo` varchar(50)
,`cli_telefone` varchar(50)
,`cli_email` varchar(50)
,`cli_morada` varchar(50)
,`cli_localTrabalho` varchar(50)
,`cli_dtReg` datetime
,`cart_id` int(11)
,`cart_numero` bigint(20)
,`cart_cliente_id` int(11)
,`cart_servico_id` int(11)
,`cart_dtReg` datetime
,`ser_id` int(11)
,`ser_descricao` varchar(50)
,`ser_dtReg` datetime
);
-- --------------------------------------------------------

--
-- Structure for view `view_cliente`
--
DROP TABLE IF EXISTS `view_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_cliente` AS select `c`.`cli_id` AS `cli_id`,`c`.`cli_nome` AS `cli_nome`,`c`.`cli_apellido` AS `cli_apellido`,`c`.`cli_sexo` AS `cli_sexo`,`c`.`cli_telefone` AS `cli_telefone`,`c`.`cli_email` AS `cli_email`,`c`.`cli_morada` AS `cli_morada`,`c`.`cli_localTrabalho` AS `cli_localTrabalho`,`c`.`cli_dtReg` AS `cli_dtReg`,`ca`.`cart_id` AS `cart_id`,`ca`.`cart_numero` AS `cart_numero`,`ca`.`cart_cliente_id` AS `cart_cliente_id`,`ca`.`cart_servico_id` AS `cart_servico_id`,`ca`.`cart_dtReg` AS `cart_dtReg`,`s`.`ser_id` AS `ser_id`,`s`.`ser_descricao` AS `ser_descricao`,`s`.`ser_dtReg` AS `ser_dtReg` from ((`tb_cliente` `c` join `tb_cartao` `ca` on((`c`.`cli_id` = `ca`.`cart_cliente_id`))) join `tb_servico` `s` on((`s`.`ser_id` = `ca`.`cart_servico_id`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_carregamento`
--
ALTER TABLE `tb_carregamento`
 ADD PRIMARY KEY (`car_id`), ADD KEY `FK_tb_carregamento_tb_pacote` (`car_pacote_id`), ADD KEY `FK_tb_carregamento_tb_cartao` (`car_cartao_num`);

--
-- Indexes for table `tb_cartao`
--
ALTER TABLE `tb_cartao`
 ADD PRIMARY KEY (`cart_id`), ADD KEY `FK_tb_cartao_tb_servico` (`cart_servico_id`), ADD KEY `FK_tb_cartao_tb_cliente` (`cart_cliente_id`), ADD KEY `cart_numero` (`cart_numero`);

--
-- Indexes for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
 ADD PRIMARY KEY (`cli_id`), ADD KEY `cli_sequencia` (`cli_sequencia`);

--
-- Indexes for table `tb_pacote`
--
ALTER TABLE `tb_pacote`
 ADD PRIMARY KEY (`pac_id`), ADD KEY `FK__tb_servico` (`pac_servico_id`);

--
-- Indexes for table `tb_precario`
--
ALTER TABLE `tb_precario`
 ADD PRIMARY KEY (`prec_id`), ADD KEY `FK__tb_pacote` (`prec_pacote_id`);

--
-- Indexes for table `tb_servico`
--
ALTER TABLE `tb_servico`
 ADD PRIMARY KEY (`ser_id`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `log_senha` (`user_senha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cartao`
--
ALTER TABLE `tb_cartao`
MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
MODIFY `cli_sequencia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tb_pacote`
--
ALTER TABLE `tb_pacote`
MODIFY `pac_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_precario`
--
ALTER TABLE `tb_precario`
MODIFY `prec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_servico`
--
ALTER TABLE `tb_servico`
MODIFY `ser_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_carregamento`
--
ALTER TABLE `tb_carregamento`
ADD CONSTRAINT `FK_tb_carregamento_tb_cartao` FOREIGN KEY (`car_cartao_num`) REFERENCES `tb_cartao` (`cart_numero`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_tb_carregamento_tb_pacote` FOREIGN KEY (`car_pacote_id`) REFERENCES `tb_pacote` (`pac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_cartao`
--
ALTER TABLE `tb_cartao`
ADD CONSTRAINT `FK_tb_cartao_tb_cliente` FOREIGN KEY (`cart_cliente_id`) REFERENCES `tb_cliente` (`cli_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_tb_cartao_tb_servico` FOREIGN KEY (`cart_servico_id`) REFERENCES `tb_servico` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_pacote`
--
ALTER TABLE `tb_pacote`
ADD CONSTRAINT `FK__tb_servico` FOREIGN KEY (`pac_servico_id`) REFERENCES `tb_servico` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_precario`
--
ALTER TABLE `tb_precario`
ADD CONSTRAINT `FK__tb_pacote` FOREIGN KEY (`prec_pacote_id`) REFERENCES `tb_pacote` (`pac_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
