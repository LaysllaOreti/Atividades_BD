CREATE TABLE IF NOT EXISTS `Livro` (
	`id_livro` int AUTO_INCREMENT NOT NULL UNIQUE,
	`isbn` varchar(255) NOT NULL,
	`descricao` text NOT NULL,
	`titulo` varchar(255) NOT NULL,
	`qnt_pagina` int NOT NULL,
	PRIMARY KEY (`id_livro`)
);

CREATE TABLE IF NOT EXISTS `Autor` (
	`id_autor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_nascimento` date NOT NULL,
	`biografia` text NOT NULL,
	PRIMARY KEY (`id_autor`)
);

CREATE TABLE IF NOT EXISTS `Empréstimo` (
	`id_emprestimo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_emprestimo` date NOT NULL,
	`data_devolucao_limite` date NOT NULL,
	`data_devolucao` date NOT NULL,
	`id_livro` int NOT NULL,
	`id_usuario` int NOT NULL,
	PRIMARY KEY (`id_emprestimo`)
);

CREATE TABLE IF NOT EXISTS `Usuário` (
	`id_usuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`data_cadastro` date NOT NULL,
	`nivel_associacao` enum NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `Categoria` (
	`id_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_categoria` varchar(255) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);

CREATE TABLE IF NOT EXISTS `Autor_Livro` (
	`id_autor_livro` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_autor` int NOT NULL,
	`id_livro` int NOT NULL,
	PRIMARY KEY (`id_autor_livro`)
);

CREATE TABLE IF NOT EXISTS `Categoria_Livro` (
	`id_categoria_livro` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_categoria` int NOT NULL,
	`id_livro` int NOT NULL,
	PRIMARY KEY (`id_categoria_livro`)
);



ALTER TABLE `Empréstimo` ADD CONSTRAINT `Empréstimo_fk4` FOREIGN KEY (`id_livro`) REFERENCES `Livro`(`id_livro`);

ALTER TABLE `Empréstimo` ADD CONSTRAINT `Empréstimo_fk5` FOREIGN KEY (`id_usuario`) REFERENCES `Usuário`(`id_usuario`);


ALTER TABLE `Autor_Livro` ADD CONSTRAINT `Autor_Livro_fk1` FOREIGN KEY (`id_autor`) REFERENCES `Autor`(`id_autor`);

ALTER TABLE `Autor_Livro` ADD CONSTRAINT `Autor_Livro_fk2` FOREIGN KEY (`id_livro`) REFERENCES `Livro`(`id_livro`);
ALTER TABLE `Categoria_Livro` ADD CONSTRAINT `Categoria_Livro_fk1` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria`(`id_categoria`);

ALTER TABLE `Categoria_Livro` ADD CONSTRAINT `Categoria_Livro_fk2` FOREIGN KEY (`id_livro`) REFERENCES `Livro`(`id_livro`);