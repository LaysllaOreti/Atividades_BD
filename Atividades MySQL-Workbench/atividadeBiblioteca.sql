CREATE DATABASE biblioteca_layslla;
USE biblioteca_layslla;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE Livro(
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    descricao TEXT,
    quantidade_paginas INT,
    isbn VARCHAR(13) UNIQUE
);

CREATE TABLE Usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(50) UNIQUE,
    data_cadastro DATE,
    nivel_associacao ENUM('Regular','Premium')
);

CREATE TABLE Autor(
	id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    data_nascimento DATE,
    biografia TEXT
);

CREATE TABLE Categoria(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150)
);

CREATE TABLE Emprestimo(
	id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE,
    data_limite_devolucao DATE,
    data_devolucao DATE,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro (id_livro)
);

-- Tabela associativa de Autor e Livro
CREATE TABLE Autor_Livro(
	id_autor_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autor (id_autor),
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro (id_livro)
);

-- Tabela associativa de Categoria e Livro
CREATE TABLE Categoria_Livro(
	id_categoria_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria),
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro (id_livro)
);

-- Inserção dos dados na tabela
INSERT INTO Livro(titulo,descricao,quantidade_paginas,isbn)
VALUES
	(
		'Sapiens: Uma Breve História da Humanidade',
        'Yuval Noah Harari apresenta a trajetória da humanidade desde os primórdios até a era moderna, explorando como crenças, economia e ciência moldaram nossa sociedade.',
        '464',
        '9788535925699'
    ),
    (
		'Dom Casmurro',
        'Obra-prima de Machado de Assis, conta a história de Bentinho e Capitu, marcada por amor, ciúme e a famosa dúvida sobre a traição.',
        '288',
        '9788520933117'
    ),
    (
		'O Poder do Hábito',
        'Charles Duhigg investiga como os hábitos funcionam, como são formados e como podem ser transformados para impactar nossa vida pessoal e profissional.',
        '408',
        '9788539004116'
    ),
    (
		'Orgulho e Preconceito',
        'Romance clássico de Jane Austen que narra a relação entre Elizabeth Bennet e o orgulhoso Sr. Darcy, explorando temas de amor, classe social e preconceito.',
        '416',
        '9788520933100'
    ),
    (
		'Anna Kariênina',
        'Liev Tolstói apresenta a trágica história de Anna, uma mulher da aristocracia russa que vive um amor proibido, confrontando as normas sociais da época.',
        '864',
        '9788525414390'
    ),
    (
		'Como Eu Era Antes de Você',
        'Jojo Moyes conta a emocionante relação entre Louisa Clark e Will Traynor, um romance contemporâneo que mistura amor, escolhas difíceis e reflexões sobre a vida.',
        '320',
        '9788580579247'
    ),
    (
		'A Menina que Roubava Livros',
        'Markus Zusak narra a história de Liesel, uma jovem que encontra consolo nos livros em meio à Segunda Guerra Mundial, contada pela própria Morte.',
        '480',
        '9788598078175'
    ),
    (
		'As Aventuras de Huckleberry Finn',
        'Mark Twain apresenta a jornada de Huck e do escravizado Jim pelo rio Mississippi, em uma narrativa cheia de humor, críticas sociais e descobertas.',
        '386',
        '9788520933148'
    ),
    (
		'Cem Anos de Solidão',
        'Gabriel García Márquez conta a saga da família Buendía na fictícia cidade de Macondo, mesclando realismo mágico, amor e tragédia.',
        '448',
        '9788535920427'
    ),
	(
		'Harry Potter e a Pedra Filosofal',
        'J.K. Rowling apresenta a história de Harry, um garoto que descobre ser um bruxo e inicia sua jornada em Hogwarts, cheia de magia, amizade e mistério.',
        '264',
        '9788532530780'
    );
    
-- Inserção de dados na tabela Usuário
INSERT INTO Usuario(nome,email,data_cadastro,nivel_associacao)
VALUES
	(
		'Ana Clara Souza',
        'ana.souza@gmail.com',
        '2024-01-15',
        'Regular'
    ),
    (
		'João Miguel de Paiva',
        'joao.paiva@hotmail.com',
        '2023-11-02',
        'Premium'
    ),
    (
		'Mariana Alves',
        'mariana.alves@yahoo.com',
        '2025-02-10',
        'Regular'
    ),
    (
		'Ricardo Ferreira',
        'ricardo.ferreira@outlook.com',
        '2024-08-23',
        'Premium'
    ),
    (
		'Camila Duarte',
        'camila.duarte@gmail.com',
        '2023-05-19',
        'Premium'
    ),
    (
		'Felipe Oreti',
        'felipe.oreti@hotmail.com',
        '2024-03-27',
        'Regular'
    ),
    (
		'Larissa Menezes',
        'larissa.menezes@outlook.com',
        '2025-01-04',
        'Regular'
    ),
    (
		'Bruno Oliveira',
        'bruno.oliveira@gmail.com',
        '2022-12-30',
        'Premium'
    ),
    (
		'Sofia Ribeiro',
        'sofia.ribeiro@yahoo.com',
        '2024-09-11',
        'Regular'
    ),
    (
		'Gabriel Costa',
        'gabriel.costa@outlook.com',
        '2023-07-07',
        'Premium'
    );

-- Inserção de dados na tabela autor
INSERT INTO Autor(nome,data_nascimento,biografia)
VALUES
	(
		'Yuval Noah Harari',
        '1976/02/24',
        'Historiador e professor israelense, especialista em história mundial e processos macro-históricos. Autor de Sapiens e Homo Deus.'
    ),
    (
		'Machado de Assis',
        '1839/06/21',
        'Escritor brasileiro considerado um dos maiores nomes da literatura do país. Fundador da Academia Brasileira de Letras e autor de Dom Casmurro.'
    ),
	(
		'Charles Duhigg',
        '1974/01/01',
        'Jornalista norte-americano vencedor do Prêmio Pulitzer. Ganhou destaque com o livro O Poder do Hábito, sobre psicologia e comportamento humano.'
    ),
    (
		'Jane Austen',
        '1775/12/16',
        'Romancista inglesa que escreveu clássicos da literatura como Orgulho e Preconceito e Razão e Sensibilidade, explorando amor e crítica social.'
    ),
    (
		'Liev Tolstói',
        '1828/09/09',
        'Escritor russo, um dos maiores romancistas de todos os tempos, conhecido por obras monumentais como Anna Kariênina e Guerra e Paz.'
    ),
    (
		'Jojo Moyes',
        '1969/08/04',
        'Escritora e jornalista britânica, famosa por romances contemporâneos de grande sucesso, como Como Eu Era Antes de Você.'
    ),
    (
		'Markus Zusak',
        '1975/06/23',
        'Escritor australiano, mundialmente reconhecido pelo romance A Menina que Roubava Livros, traduzido para mais de 30 idiomas.'
    ),
    (
		'Mark Twain',
        '1835/11/30',
        'Escritor, humorista e conferencista americano, considerado o "pai da literatura norte-americana". Autor de As Aventuras de Tom Sawyer e Huckleberry Finn.'
    ),
    (
		'Gabriel García Márquez',
        '1927/03/06',
        'Escritor colombiano, vencedor do Nobel de Literatura (1982). Mestre do realismo mágico, autor de Cem Anos de Solidão.'
    ),
    (
		'J.K. Rowling',
        '1965/07/31',
        'Escritora britânica, criadora da saga Harry Potter, uma das séries literárias mais populares e influentes do mundo.'
    );

INSERT INTO Categoria(nome)
VALUES
	(
		'História / Não-ficção'
    ),
    (
		'Romance Clássico / Literatura Brasileira'
    ),
    (
		'Desenvolvimento Pessoal / Psicologia'
    ),
    (
		'Romance Clássico / Literatura Inglesa'
    ),
    (
		'Romance / Literatura Russa'
    ),
    (
		'Romance Contemporâneo / Drama'
    ),
    (
		'Drama Histórico / Ficção'
    ),
    (
		'Aventura / Literatura Americana'
    ),
    (
		'Romance / Realismo Mágico'
    ),
    (
		'Fantasia / Infantojuvenil'
    );
    
-- Inserção dos dados na tabela Empréstimo
INSERT INTO Emprestimo(id_usuario,id_livro,data_emprestimo,data_limite_devolucao,data_devolucao)
VALUES
	(1,3,'2025-01-10','2025-01-25','2025-01-22'),
	(2,7,'2025-02-01','2025-02-16','2025-02-18'),
	(3,1,'2025-03-05','2025-03-20','2025-03-20'),
	(4,10,'2025-01-22','2025-02-06','2025-02-10'),
	(5,5,'2025-02-14','2025-03-01','2025-02-28'),
	(6,2,'2025-01-30','2025-02-14','2025-02-12'),
	(7,6,'2025-03-12','2025-03-27','2025-03-29'),
	(8,4,'2025-02-05','2025-02-20','2025-02-19'),
	(9,9,'2025-01-18','2025-02-02','2025-02-07'),
	(10,8,'2025-03-01','2025-03-16','2025-03-15');

-- Inserção dos dados na tabela Autor_livro
INSERT INTO Autor_Livro(id_autor,id_livro)
VALUES
	(1,1), 
	(2,2), 
	(3,3),  
	(4,4),  
	(5,5), 
	(6,6),  
	(7,7),  
	(8,8),  
	(9,9), 
	(10,10);
    
-- Inserção de dados na tabela associativa Categoria/Livro
INSERT INTO Categoria_Livro(id_categoria,id_livro)
VALUES
	(1,1), 
	(2,2),   
	(3,3),   
	(4,4),   
	(5,5),   
	(6,6),   
	(7,7),   
	(8,8),   
	(9,9),   
	(10,10);
    
-- Visualizar os dados dentro da tabela
SELECT * FROM Usuario;
SELECT * FROM Autor;
SELECT * FROM Livro;
SELECT * FROM Categoria;
SELECT * FROM Emprestimo;
SELECT * FROM Autor_Livro;
SELECT * FROM Categoria_Livro;

-- Função para ver

-- Visualizar as tabelas
SHOW TABLES;

-- Ver os campos de uma tabela específica
DESCRIBE Usuario;

-- Para apagar toda a tabela: DROP DATABASE biblioteca_layslla;



	