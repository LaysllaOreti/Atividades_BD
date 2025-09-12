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
	id_pagina_curso INT(8) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_curso INT(8) NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor (id_professor),
    papel_professor ENUM('Titular', 'Tutor') NOT NULL
);

-- Inserção dos dados na tabela
INSERT INTO inscricao(id_inscricao,id_aluno,id_curso,data_inscricao,situacao)
VALUES
	(10000001, 20000001, 2, '2025-01-10', 'Ativa'),
	(10000002, 20000002, 3, '2025-02-05', 'Concluída'),
	(10000003, 20000003, 1, '2025-02-20', 'Ativa'),
	(10000004, 20000004, 2, '2025-03-15', 'Trancada'),
	(10000005, 20000005, 4, '2025-04-01', 'Ativa');
    
INSERT INTO aluno(id_aluno,nome,email,telefone,id_plano)
VALUES
	(20000001, 'Layslla Paiva', 'layslla.paiva@email.com', '1198765432', 1),
	(20000002, 'Daniel Oreti', 'daniel.oreti2@email.com', '2197654321', 2),
	(20000003, 'João Cavalcanti', 'joaoCavalcanti@email.com', '3196543210', 1),
	(20000004, 'Pâmella Aurélio', 'pamella.aurelio41@email.com', '4195432109', 3),
	(20000005, 'Eduardo da Silva', 'eduardoDaSilva@email.com', '5194321098', 2);
    
INSERT INTO curso(id_curso,descricao)
VALUES
	(30000001, 'Curso de Programação em Python'),
	(30000002, 'Curso de Desenvolvimento Web com React'),
	(30000003, 'Curso de Banco de Dados MySQL'),
	(30000004, 'Curso de Inteligência Artificial'),
	(30000005, 'Curso de Segurança da Informação');
    
INSERT INTO professor(id_professor,nome,data_nascimento,email)
VALUES
	(40000001, 'Marcos Silva', '1980-05-12', 'marcos.silva@faculdade.com'),
	(40000002, 'Fernanda Oliveira', '1975-08-22', 'fernanda.oliveira@faculdade.com'),
	(40000003, 'Ricardo Santos', '1988-03-10', 'ricardo.santos@faculdade.com'),
	(40000004, 'Juliana Costa', '1990-11-30', 'juliana.costa@faculdade.com'),
	(40000005, 'Paulo Almeida', '1983-07-18', 'paulo.almeida@faculdade.com');
    
INSERT INTO perfil(id_perfil,foto,data_nascimento,biografia,id_aluno)
VALUES
	(50000001, LOAD_FILE('/imagens/ana_souza.png'), '2000-01-15', 'Gosta de programação e esportes.', 20000001),
	(50000002, LOAD_FILE('/imagens/bruno_lima.png'), '1999-07-22', 'Apaixonado por tecnologia web.', 20000002),
	(50000003, LOAD_FILE('/imagens/carla_mendes.png'), '2001-03-05', 'Interessada em ciência de dados.', 20000003),
	(50000004, LOAD_FILE('/imagens/diego_rocha.png'), '1998-11-12', 'Focado em desenvolvimento mobile.', 20000004),
	(50000005, LOAD_FILE('/imagens/eduarda_alves.png'), '2002-06-30', 'Entusiasta de segurança da informação.', 20000005);
    
INSERT INTO plano_vigente()
VALUES
	(60000001, 'Básico', 'Acesso a cursos introdutórios, suporte por e-mail e certificado digital.'),
	(60000002, 'Premium', 'Acesso ilimitado a todos os cursos, suporte 24h, certificado impresso e mentorias ao vivo.'),
	(60000003, 'Básico', 'Biblioteca de conteúdos gravados, fóruns de dúvidas e certificado digital.'),
	(60000004, 'Premium', 'Conteúdo avançado exclusivo, webinars mensais, suporte personalizado e networking.'),
	(60000005, 'Básico', 'Cursos básicos com atualizações periódicas e suporte via FAQ.');
    
INSERT INTO modulo(id_modulo,titulo,ordem,carga_horaria,id_curso)
VALUES
	(70000001, 'Introdução ao Python', 1, 10, 30000001),
	(70000002, 'React Fundamentos', 1, 12, 30000002),
	(70000003, 'Modelagem de Banco de Dados', 1, 8, 30000003),
	(70000004, 'Machine Learning Básico', 2, 15, 30000004),
	(70000005, 'Segurança em Redes', 2, 14, 30000005);
    
INSERT INTO pagina_curso(id_pagina_curso,id_curso,id_professor,papel_professor)
VALUES
	(80000001, 30000001, 40000001, 'Titular'),
	(80000002, 30000002, 40000002, 'Tutor'),
	(80000003, 30000003, 40000003, 'Titular'),
	(80000004, 30000004, 40000004, 'Tutor'),
	(80000005, 30000005, 40000005, 'Titular');
    
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

