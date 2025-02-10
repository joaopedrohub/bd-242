-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 10/02/2025 às 18:16
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydatabase`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_Clientes`
--

CREATE TABLE `TB_Clientes` (
  `id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `ultimo_nome_contato` varchar(50) DEFAULT NULL,
  `primeiro_nome_contato` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `endereço_linha_1` varchar(50) DEFAULT NULL,
  `endereço_linha_2` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `id_representante_de_vendas` int DEFAULT NULL,
  `limite_credito` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_Clientes`
--

INSERT INTO `TB_Clientes` (`id`, `nome`, `ultimo_nome_contato`, `primeiro_nome_contato`, `telefone`, `endereço_linha_1`, `endereço_linha_2`, `cidade`, `estado`, `codigo_postal`, `pais`, `id_representante_de_vendas`, `limite_credito`) VALUES
(1, 'maria clara', 'maria', 'clara', '8922-8722', 'são gonçalo', 'cascavel', 'fortaleza', 'Ceará', '85731-434', 'Brasil', 1, 1000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_detalhes_pedido`
--

CREATE TABLE `TB_detalhes_pedido` (
  `id` int NOT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `cada_preco` float DEFAULT NULL,
  `posicao_na_fila` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_detalhes_pedido`
--

INSERT INTO `TB_detalhes_pedido` (`id`, `produto_id`, `quantidade`, `cada_preco`, `posicao_na_fila`) VALUES
(1, 1, 1, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_Empregados`
--

CREATE TABLE `TB_Empregados` (
  `id` int NOT NULL,
  `primeiro_nome` varchar(100) DEFAULT NULL,
  `ultimo_nome` varchar(100) DEFAULT NULL,
  `extensão` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `escritório_id` int DEFAULT NULL,
  `Responde_ao` varchar(100) DEFAULT NULL,
  `Titulo_trabalho` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_Empregados`
--

INSERT INTO `TB_Empregados` (`id`, `primeiro_nome`, `ultimo_nome`, `extensão`, `email`, `escritório_id`, `Responde_ao`, `Titulo_trabalho`) VALUES
(1, 'joão', 'pedro', '@aluno.ifce.edu.br', 'joao.andrade09@aluno.ifce.edu.br', 1, 'taveira', 'clt');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_Escritorio`
--

CREATE TABLE `TB_Escritorio` (
  `id` int NOT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `endereco_primeira_linha` varchar(50) DEFAULT NULL,
  `endereco_segunda_linha` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `codigo_postal` varchar(9) DEFAULT NULL,
  `territorio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_Escritorio`
--

INSERT INTO `TB_Escritorio` (`id`, `cidade`, `telefone`, `endereco_primeira_linha`, `endereco_segunda_linha`, `estado`, `pais`, `codigo_postal`, `territorio`) VALUES
(1, 'fortaleza', '8927-2311', 'rua cantor', 'carlos augusto', 'Ceará', 'Brasil', '68397-111', 'america sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_MarcasProdutos`
--

CREATE TABLE `TB_MarcasProdutos` (
  `id` int NOT NULL,
  `descricaoTexto` varchar(1000) DEFAULT NULL,
  `descricaoHtml` varchar(1000) DEFAULT NULL,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_MarcasProdutos`
--

INSERT INTO `TB_MarcasProdutos` (`id`, `descricaoTexto`, `descricaoHtml`, `image`) VALUES
(1, 'marca de produto original', 'html/css/js', 'imagem');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_pagamentos`
--

CREATE TABLE `TB_pagamentos` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_pagamentos`
--

INSERT INTO `TB_pagamentos` (`id`, `id_cliente`, `data_pagamento`, `valor`) VALUES
(1, 1, '2020-05-02', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_Pedidos`
--

CREATE TABLE `TB_Pedidos` (
  `id` int NOT NULL,
  `data_pedido` date DEFAULT NULL,
  `data_requerido` date DEFAULT NULL,
  `data_entregue` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `comentários` text,
  `id_cliente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_Pedidos`
--

INSERT INTO `TB_Pedidos` (`id`, `data_pedido`, `data_requerido`, `data_entregue`, `status`, `comentários`, `id_cliente`) VALUES
(1, '2020-01-01', '2021-01-01', '2022-01-01', 'entregue', 'desculpa o atraso', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_Produtos`
--

CREATE TABLE `TB_Produtos` (
  `id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `marca` int DEFAULT NULL,
  `escala` float DEFAULT NULL,
  `vendedor` varchar(100) DEFAULT NULL,
  `descricao` text,
  `estoqueQuantidade` int DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `msrp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_Produtos`
--

INSERT INTO `TB_Produtos` (`id`, `nome`, `marca`, `escala`, `vendedor`, `descricao`, `estoqueQuantidade`, `preco`, `msrp`) VALUES
(1, 'produto massa', 1, 4.5, 'taveira', 'um banco de dados', 50, 10.2, 'não sei oq msrp significa');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_Clientes`
--
ALTER TABLE `TB_Clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_representante_de_vendas` (`id_representante_de_vendas`);

--
-- Índices de tabela `TB_detalhes_pedido`
--
ALTER TABLE `TB_detalhes_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `TB_Empregados`
--
ALTER TABLE `TB_Empregados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `escritório_id` (`escritório_id`);

--
-- Índices de tabela `TB_Escritorio`
--
ALTER TABLE `TB_Escritorio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_MarcasProdutos`
--
ALTER TABLE `TB_MarcasProdutos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_pagamentos`
--
ALTER TABLE `TB_pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `TB_Pedidos`
--
ALTER TABLE `TB_Pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `TB_Produtos`
--
ALTER TABLE `TB_Produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca` (`marca`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_Clientes`
--
ALTER TABLE `TB_Clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_detalhes_pedido`
--
ALTER TABLE `TB_detalhes_pedido`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_Empregados`
--
ALTER TABLE `TB_Empregados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_Escritorio`
--
ALTER TABLE `TB_Escritorio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_MarcasProdutos`
--
ALTER TABLE `TB_MarcasProdutos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_pagamentos`
--
ALTER TABLE `TB_pagamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_Pedidos`
--
ALTER TABLE `TB_Pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_Produtos`
--
ALTER TABLE `TB_Produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_Clientes`
--
ALTER TABLE `TB_Clientes`
  ADD CONSTRAINT `TB_Clientes_ibfk_1` FOREIGN KEY (`id_representante_de_vendas`) REFERENCES `TB_Empregados` (`id`);

--
-- Restrições para tabelas `TB_detalhes_pedido`
--
ALTER TABLE `TB_detalhes_pedido`
  ADD CONSTRAINT `TB_detalhes_pedido_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `TB_Produtos` (`id`);

--
-- Restrições para tabelas `TB_Empregados`
--
ALTER TABLE `TB_Empregados`
  ADD CONSTRAINT `TB_Empregados_ibfk_1` FOREIGN KEY (`escritório_id`) REFERENCES `TB_Escritorio` (`id`);

--
-- Restrições para tabelas `TB_pagamentos`
--
ALTER TABLE `TB_pagamentos`
  ADD CONSTRAINT `TB_pagamentos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `TB_Clientes` (`id`);

--
-- Restrições para tabelas `TB_Pedidos`
--
ALTER TABLE `TB_Pedidos`
  ADD CONSTRAINT `TB_Pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `TB_Clientes` (`id`);

--
-- Restrições para tabelas `TB_Produtos`
--
ALTER TABLE `TB_Produtos`
  ADD CONSTRAINT `TB_Produtos_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `TB_MarcasProdutos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
