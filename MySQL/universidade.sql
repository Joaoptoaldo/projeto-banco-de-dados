-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/05/2026 às 14:58
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
-- Banco de dados: `universidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `curso` varchar(50) NOT NULL,
  `semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`id_aluno`, `nome`, `curso`, `semestre`) VALUES
(1, 'Carlos Silva', 'Sistemas de Informação', 1),
(2, 'Ana Beatriz', 'Sistemas de Informação', 3),
(3, 'Marcos Souza', 'Engenharia de Software', 2),
(4, 'Julia Lima', 'Ciência da Computação', 4),
(5, 'Pedro Rocha', 'Sistemas de Informação', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`id_disciplina`, `nome`, `carga_horaria`) VALUES
(1, 'Aplicações Web', 80),
(2, 'Banco de Dados', 80),
(3, 'Algoritmos', 60),
(4, 'Estrutura de Dados', 60);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_oferta` int(11) NOT NULL,
  `nota` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `nota`
--

INSERT INTO `nota` (`id_nota`, `id_aluno`, `id_oferta`, `nota`) VALUES
(1, 1, 1, 8.50),
(2, 2, 1, 9.20),
(3, 3, 2, 6.00),
(4, 4, 3, 4.50),
(5, 5, 4, 7.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_professor` int(11) NOT NULL,
  `semestre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `id_disciplina`, `id_professor`, `semestre`) VALUES
(1, 1, 1, '2026/1'),
(2, 2, 2, '2026/1'),
(3, 3, 3, '2026/1'),
(4, 4, 1, '2026/1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `titulacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`id_professor`, `nome`, `titulacao`) VALUES
(1, 'André F. dos Santos', 'Mestre'),
(2, 'Mariana Costa', 'Doutor'),
(3, 'Roberto Almeida', 'Especialista');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`);

--
-- Índices de tabela `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_nota_aluno` (`id_aluno`),
  ADD KEY `fk_nota_oferta` (`id_oferta`);

--
-- Índices de tabela `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`),
  ADD KEY `fk_oferta_disciplina` (`id_disciplina`),
  ADD KEY `fk_oferta_professor` (`id_professor`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  ADD CONSTRAINT `fk_nota_oferta` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id_oferta`);

--
-- Restrições para tabelas `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `fk_oferta_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`),
  ADD CONSTRAINT `fk_oferta_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
