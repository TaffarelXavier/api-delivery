-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Ago-2019 às 16:08
-- Versão do servidor: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adonis_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503250034279_user', 1, '2019-07-16 12:44:52'),
(2, '1503250034280_token', 1, '2019-07-16 12:44:52'),
(3, '1563202681256_property_schema', 1, '2019-07-16 12:44:52'),
(4, '1563202837621_image_schema', 1, '2019-07-16 12:44:53'),
(46, '1503250034279_user', 1, '2019-07-22 03:45:43'),
(47, '1503250034280_token', 1, '2019-07-22 03:45:44'),
(48, '1563716202048_empresas_schema', 1, '2019-07-22 03:45:44'),
(49, '1563716336636_produtos_schema', 1, '2019-07-22 03:45:44'),
(50, '1563716352989_enderecos_schema', 1, '2019-07-22 03:45:44'),
(51, '1563716366487_imagens_schema', 1, '2019-07-22 03:45:44'),
(52, '1563716455091_pedidos_schema', 1, '2019-07-22 03:45:45'),
(53, '1563716462814_estoque_schema', 1, '2019-07-22 03:45:45'),
(54, '1563716469698_clientes_schema', 1, '2019-07-22 03:45:45'),
(55, '1566920259178_categorias_schema', 2, '2019-08-27 15:56:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_nome` varchar(80) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `cat_nome`, `created_at`, `updated_at`) VALUES
(1, 'ALIMENTOS', '2019-08-27 00:00:00', '2019-08-27 12:59:16'),
(2, 'BEBIDAS', '2019-08-27 00:00:00', '2019-08-27 12:59:22'),
(3, 'BAZAR', '2019-08-27 00:00:00', '2019-08-27 12:59:28'),
(4, 'DESCARTÁVEIS', '2019-08-27 00:00:00', '2019-08-27 12:59:28'),
(5, 'MATINAIS', '2019-08-27 00:00:00', '2019-08-27 12:59:28'),
(6, 'PERECÍVEIS', '2019-08-27 00:00:00', '2019-08-27 12:59:28'),
(7, 'HIGIENE', '2019-08-26 00:00:00', '2019-08-27 12:59:40'),
(8, 'LIMPEZA', '2019-08-28 00:00:00', '2019-08-27 13:00:14'),
(9, 'FRUTAS', '2019-08-27 13:05:51', '2019-08-27 13:05:51'),
(10, 'LEGUMES', '2019-08-27 13:05:51', '2019-08-27 13:05:51'),
(11, 'VERDURAS', '2019-08-27 13:05:51', '2019-08-27 13:05:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `codigo_cidade` int(11) NOT NULL,
  `codigo_uf` int(11) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome_fantasia` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `codigo_uf` int(11) NOT NULL,
  `codigo_cidade` int(11) NOT NULL,
  `nome_rua` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) NOT NULL,
  `logomarca` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`id`, `nome_fantasia`, `descricao`, `url`, `codigo_uf`, `codigo_cidade`, `nome_rua`, `bairro`, `numero`, `telefone`, `logomarca`, `created_at`, `updated_at`) VALUES
(5, 'Marcos Vinicius e Thomas Mudanças ME', 'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', 'marcos-Vinicius-mudanca', 1, 2, 'Avenida Brasília', 'Centro', '45', '63999480630', 'https://image.freepik.com/free-photo/acai-smoothie-granola-seeds-fresh-fruits-wooden-bowl-with-cactus-spoon-plate-filled-with-berries_110879-87.jpg', '2019-07-22 18:25:40', '2019-07-22 18:25:40'),
(2, 'Kauê e Yasmin Pães e Doces Ltda', 'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', 'kaue-e-yasmin', 1, 2, 'Rua Nova York', 'Centro', '45', '63999480630', 'https://image.freepik.com/free-vector/summer-tropical-fruits-background_23-2147552800.jpg', '2019-07-22 18:22:22', '2019-07-22 18:22:22'),
(3, 'Valentina e Olivia Eletrônica Ltda', 'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', 'eletronica-ltda-valentina-oliveira', 1, 2, 'Avenida Brasília', 'Centro', '45', '63999480630', 'https://cdn.pixabay.com/photo/2017/05/11/19/44/fruit-2305192_960_720.jpg', '2019-07-22 18:23:22', '2019-07-22 18:23:22'),
(4, 'Stefany e Malu Restaurante ME', 'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', 'Stefany-Malu-Restaurante-oliveira', 1, 2, 'Avenida Brasília', 'Centro', '45', '63999480630', 'https://image.freepik.com/free-photo/different-fresh-fruits-vegetables-eating-healthy-dieting_3236-541.jpg', '2019-07-22 18:23:45', '2019-07-22 18:23:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_fk_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoques`
--

CREATE TABLE `estoques` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_fk_id` int(10) UNSIGNED DEFAULT NULL,
  `preco` decimal(8,2) NOT NULL,
  `medida` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

CREATE TABLE `imagens` (
  `id` int(10) UNSIGNED NOT NULL,
  `produto_fk_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `images`
--

INSERT INTO `images` (`id`, `property_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 4, '1563291697463-JPG MARCA LOGO.jpg', '2019-07-16 12:41:37', '2019-07-16 12:41:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_fk_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `empresa_fk_id`, `nome`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 5, 'manga1', '', '2019-08-14 00:00:00', '2019-08-14 00:00:00'),
(2, 5, 'manga2', '', '2019-08-14 00:00:00', '2019-08-14 00:00:00'),
(3, 5, 'manga3', '', '2019-08-14 00:00:00', '2019-08-14 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `title`, `address`, `price`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(4, 1, 'São Miguel', 'Rua', '200.00', '-5.349470', '-47.874240', '2019-07-16 12:41:37', '2019-07-16 12:41:37'),
(2, 1, 'Apartamento 201', 'Rua Sem Nome', '100.00', '-5.468930', '-47.886090', '2019-07-16 00:00:00', '2019-07-16 00:00:00'),
(3, 1, 'Sampaio', 'Rua Sem Nome', '145.50', '-5.349470', '-47.874240', '2019-07-16 00:00:00', '2019-07-16 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'taffarelxavier', 'taffarelxavier7@gmail.com', '$2a$10$TrgTIiufQ8HzYSS6qNhW6OCrPMmXvkybg234abJt8AP3wtCRDRjVa', '2019-07-16 09:45:56', '2019-07-16 09:45:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_property_id_foreign` (`property_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_user_id_foreign` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
