-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2026 às 17:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `veterinaria`
--
CREATE DATABASE IF NOT EXISTS `veterinaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinaria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `idAni` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `nomeAnimal` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `dataNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`idAni`, `idCliente`, `nomeAnimal`, `especie`, `dataNascimento`) VALUES
(1, 1, 'Valentina', 'Cachorro - Pinsher', '2014-10-02'),
(2, 1, 'Shakira', 'Cachorro - Pastor alemão', '2019-09-29'),
(3, 1, 'Hanna', 'Cachorro - Pastor alemão', '2012-07-23'),
(4, 3, 'Johnny', 'Gato - RD', '2025-03-14'),
(5, 2, 'Florzinha', 'Tartaruga - Jabuti', '2009-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `idAtendimento` int(11) NOT NULL,
  `idAnimal` int(11) DEFAULT NULL,
  `idVeterinario` int(11) DEFAULT NULL,
  `dataAtendimento` date NOT NULL,
  `horaAtendimento` time NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nomeCliente`, `telefone`, `email`, `cpf`, `endereco`) VALUES
(1, 'Fulana da Silva', '11 96526-6972', 'emailFicticio@gmail.com', '123.123.123-11', 'Rua x, num 3, Ribeirão Pires - SP, CEP 234987-324'),
(2, 'Ciclana da Costa', '11 29426-7252', 'ciclaninhadobairro@gmail.com', '321.321.321-33', 'Rua Clandestina, num 107, Ribeirão Pires - SP, CEP 268437-943'),
(3, 'Beltrano Barros', '11 31578-6953', 'beltranao202@gmail.com', '000.000.000-00', 'Rua Ibirapuera, num 98, Suzano - SP, CEP 295387-389');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `idVet` int(11) NOT NULL,
  `nomeVet` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `crmv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veterinario`
--

INSERT INTO `veterinario` (`idVet`, `nomeVet`, `telefone`, `especialidade`, `crmv`) VALUES
(1, 'Beatriz', '10 12345-6789', 'Ressonância magnética', '26206'),
(2, 'Victorya', '98 98765-4321', 'Manipulação de drogas', '25769'),
(3, 'Davi', '21 48627-5983', 'Check-up', '26973');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idAni`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`idAtendimento`),
  ADD KEY `idAnimal` (`idAnimal`),
  ADD KEY `idVeterinario` (`idVeterinario`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idVet`),
  ADD UNIQUE KEY `crmv` (`crmv`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idAni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `idAtendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idVet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Restrições para tabelas `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `atendimentos_ibfk_1` FOREIGN KEY (`idAnimal`) REFERENCES `animais` (`idAni`),
  ADD CONSTRAINT `atendimentos_ibfk_2` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinario` (`idVet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
