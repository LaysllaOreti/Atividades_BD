USE biblioteca_layslla;

-- select onde o ID é 3
SELECT titulo,descricao FROM Livro
WHERE
	id_livro = 3;
    
-- insert de novo gênero dentro de Categoria
INSERT INTO Categoria(nome)
VALUES
	(
		'Técnico'
    );
SELECT * FROM Categoria;

-- alter table da tabela Livro
ALTER TABLE Livro
ADD COLUMN edicao VARCHAR(150),
ADD COLUMN data_publicacao DATE;
SELECT * FROM Livro;

-- insert da tabela Autor
INSERT INTO Autor(nome,data_nascimento,biografia)
VALUES 
	(
		'Eric Matthes',
        '1913-07-25',
        'O senador Eric Randall Matthews, também um grande autor de livros de desenvolvimento'
    );
SELECT * FROM Autor;

-- insert na tabela Livro
INSERT INTO Livro (titulo,descricao,quantidade_paginas,isbn,edicao,data_publicacao)
VALUES
	(
		'Python',
        'Livro sobre programação em Python do inciante até o avançado',
        '89',
        '652419890',
        '3° Edição',
        '2023-04-24'
    );
SELECT * FROM Livro;


-- insert na tabela Categoria_Livro
INSERT INTO Categoria_Livro(id_livro,id_categoria)
VALUES
	(11,11);
SELECT * FROM Categoria_Livro;

-- atualização do e-mail do usuario
UPDATE Usuario
SET email = 'teste@email.com'
WHERE
	id_usuario =1;
SELECT * FROM Usuario;

-- correção do título do livro Python
UPDATE Livro
SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação'
WHERE
	id_livro = 11;
SELECT * FROM Livro;

-- marcação doa livros publicados antes dos anos 2000 com o status 'inativo'
ALTER TABLE Livro
ADD COLUMN status ENUM('Ativo', 'Inativo') NOT NULL;
SELECT * FROM Livro;

-- insert na tabela Livro
INSERT INTO Livro (titulo,descricao,quantidade_paginas,isbn,edicao,data_publicacao)
VALUES
	(
		'JavaScript: The Definitive Guide',
        'Guia abrangente e referência técnica sobre a linguagem JavaScript: cobre a “core language” (tipos, operadores, estruturas de controle, funções), a programação orientada a objetos em JS, bem como a API do navegador (Document Object Model, manipulação de imagens, cookies, eventos) da época.',
        '776',
        '9781565923928',
        '3° Edição',
        '1998-06-11'
    );

-- código
UPDATE Livro
SET status = 'Inativo'
WHERE (data_publicacao) < '2000-01-01';
SELECT * FROM Livro;

-- deletar livro de todas as tabelas que o utilizam
DELETE FROM autor_livro
WHERE id_livro = 2;

DELETE FROM categoria_livro
WHERE id_livro = 2;

DELETE FROM emprestimo
WHERE id_livro = 2;

DELETE FROM livro
WHERE id_livro = 2;


-- insert do usuário teste
INSERT INTO Usuario (nome,email,data_cadastro,nivel_associacao)
VALUES 
	('Teste Testador', 'testetestador@gmail.com','2023-09-23','Regular');
SELECT * FROM Usuario;

-- delete do usuário teste
DELETE FROM Usuario
WHERE
	nome = 'Teste Testador';
    
insert into Emprestimo(id_usuario,id_livro,data_emprestimo,data_limite_devolucao,data_devolucao)
values
	(3,9,'2020-08-15','2020-05-19','2020-05-16');
SELECT * FROM Emprestimo;

-- delete de empréstimo realizado no ano 2020
DELETE FROM Emprestimo
WHERE 
	data_emprestimo = '2020-08-15';
    

-- desativar o bloqueio em usar 'update' e 'delete' dentro do banco 
SET SQL_SAFE_UPDATES = 0;