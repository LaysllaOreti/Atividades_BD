CREATE DATABASE plataforma_alunos;
USE plataforma_alunos;

-- Criando as tabelas
CREATE TABLE inscricao(
	id_inscricao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno),
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
    data_inscricao DATE NOT NULL,
    situacao ENUM('Ativa', 'Concluída', 'Trancada') NOT NULL
);

CREATE TABLE aluno(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES plano_vigente (id_plano)
);

CREATE TABLE curso(
	id_curso INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE professor(
	id_professor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50),
    data_nascimento DATE NULL,
    email VARCHAR(100)
);

CREATE TABLE perfil(
	id_perfil INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    foto BLOB NULL,
    data_nascimento DATE NULL,
    biografia TEXT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno)
);

CREATE TABLE plano_vigente(
	id_plano INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo_plano ENUM('Básico', 'Premium') NOT NULL,
    beneficios TEXT NOT NULL
);

CREATE TABLE modulo(
	id_modulo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    ordem INT NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT NOT NULL,
	FOREIGN KEY (id_curso) REFERENCES curso (id_curso)
);

-- Tabela que irá exibir todas as informações necessárias
CREATE TABLE pagina_curso(
	id_pagina_curso INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor (id_professor),
    papel_professor ENUM('Titular', 'Tutor') NOT NULL
);

-- Inserção dos dados na tabela

-- Visualizar os dados dentro da tabela
SELECT * FROM inscricao;
SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM professor;
SELECT * FROM perfil;
SELECT * FROM plano_vigente;
SELECT * FROM modulo;
SELECT * FROM pagina_curso;

-- Visualizar as tabelas
SHOW TABLES;

