create database biblioteca_layslla;
use biblioteca_layslla;

-- criação das tabelas
create table Livro(
	id_livro int auto_increment primary key,
    titulo varchar(150),
    descricao text,
    quantidade_paginas int,
    isbn varchar(13) unique
);

create table Usuario(
	id_usuario int auto_increment primary key,
    nome varchar(150),
    email varchar(50) unique,
    data_cadastro date,
    nivel_associacao enum ('Regular','Premium')
);

create table Autor(
	id_autor int auto_increment primary key,
    nome varchar(150),
    data_nascimento date,
    biografia text
);

create table Categoria(
	id_categoria int auto_increment primary key,
    nome varchar(150)
);

create table Emprestimo(
	id_emprestimo int auto_increment primary key,
    data_emprestimo date,
    data_limite_devolucao date,
    data_devolucao date,
    id_usuario int,
    foreign key (id_usuario) references Usuario(id_usuario),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);

-- tabela associativa de Autor e Livro
create table Autor_Livro(
	id_autor_livro int auto_increment primary key,
    id_autor int,
    foreign key (id_autor) references Autor(id_autor),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);


-- tabela associativa de Categoria e Livro
create table Categoria_Livro(
	id_categoria_livro int auto_increment primary key,
    id_categoria int,
    foreign key (id_categoria) references Categoria(id_categoria),
    id_livro int,
    foreign key (id_livro) references Livro(id_livro)
);


-- inserção de dados na tabela Livro
insert into Livro(titulo,descricao,quantidade_paginas,isbn)
values
	(	
		'A culpa é das estrelas', 
		'Hazel foi diagnosticada com câncer aos treze anos e agora, aos dezesseis, sobrevive graças a uma droga revolucionária que detém a metástase em seus pulmões. Ela sabe que sua doença é terminal e passa os dias vendo tevê e lendo Uma aflição imperial, livro cujo autor deixou muitas perguntas sem resposta.',
		'288',
		'1834271045192'
    ),
    
    (
		'O Pequeno Príncipe',
		'Obra de Antoine de Saint-Exupéry que mistura poesia e filosofia em uma fábula sobre amizade, amor e essência da vida.',
		'96',
		'9788520925836'
    ),
    
    (
		'A biblioteca da meia-noite',
        'Aos 35 anos, Nora Seed é uma mulher cheia de talentos e poucas conquistas. Arrependida das escolhas que fez no passado, ela vive se perguntando o que poderia ter acontecido caso tivesse vivido de maneira diferente. Após ser demitida e seu gato ser atropelado, Nora vê pouco sentido em sua existência e decide colocar um ponto final em tudo. Porém, quando se vê na Biblioteca da Meia-Noite, Nora ganha uma oportunidade única de viver todas as vidas que poderia ter vivido.',
        '308',
        '9675102945310'
    ),
    
    (
		'Verity',
        'Verity Crawford é a autora best-seller por trás de uma série de sucesso. Ela está no auge de sua carreira, aclamada pela crítica e pelo público, no entanto, um súbito e terrível acidente acaba interrompendo suas atividades, deixando-a sem condições de concluir a história... E é nessa complexa circunstância que surge Lowen Ashleigh, uma escritora à beira da falência convidada a escrever, sob um pseudônimo, os três livros restantes da já consolidada série.',
        '320',
        '9892320946'
    ),
    
    (
		'O menino do pijama listrado',
        'Bruno tem nove anos e não sabe nada sobre o Holocausto e a Solução Final contra os judeus. Também não faz idéia que seu país está em guerra com boa parte da Europa, e muito menos que sua família está envolvida no conflito. Na verdade, Bruno sabe apenas que foi obrigado a abandonar a espaçosa casa em que vivia em Berlim e a mudar-se para uma região desolada, onde ele não tem ninguém para brincar nem nada para fazer. Da janela do quarto, Bruno pode ver uma cerca, e para além dela centenas de pessoas de pijama, que sempre o deixam com frio na barriga.',
        '192',
        '3617264098152'
    ),
    
    (
		'Harry Potter e a Câmara Secreta',
        'Depois de férias aborrecidas na casa dos tios trouxas, está na hora de Harry Potter voltar a estudar. Coisas acontecem, no entanto, para dificultar o regresso de Harry. Persistente e astuto, nosso herói não se deixa intimidar pelos obstáculos e, com a ajuda dos fiéis amigos Weasley, começa o ano letivo na Escola de Magia e Bruxaria de Hogwarts. As novidades não são poucas. Novos colegas, novos professores, muitas e boas descobertas e...um grande e perigosos desafio. Alguém ou alguma coisa ameaça a segurança e a tranqüilidade dos membros de Hogwarts. Como eliminar definitivamente esse mal e restaurar a paz na escola?',
        '288',
        '8375210926431'
    ),
    (
		'O fabricante de lágrimas',
        'Nica cresceu em um orfanato e os contos de fada eram seu único conforto em meio aos terrores reais que assombravam os corredores da instituição. Agora que é adolescente, escolheu deixar as fantasias infantis para trás e focar no seu sonho de ser adotada.',
        '560',
		'9788532530787'
    ),
    (
		'Teto para Dois',
        'Depois de três meses do fim do seu relacionamento, Tiffy finalmente sai do apartamento do ex-namorado. Agora ela precisa encontrar o quanto antes um lugar barato onde morar. Contrariando os amigos, ela topa um acordo bastante inusitado.',
        '400',
        '4657294510284'
    ),
    (
		'A Revolução dos Bichos',
        'Escrita em plena Segunda Guerra Mundial e publicada em 1945 depois de ter sido rejeitada por várias editoras, essa pequena narrativa causou desconforto ao satirizar ferozmente a ditadura stalinista numa época em que os soviéticos ainda eram aliados do Ocidente na luta contra o eixo nazifascista.',
        '152',
        '1029384756193'
    ),
    (
		'Extraordinário',
        'August Pullman, o Auggie, nasceu com uma síndrome genética cuja sequela é uma severa deformidade facial, que lhe impôs diversas cirurgias e complicações médicas. Por isso ele nunca frequentou uma escola de verdade... até agora.',
        '320',
        '0194538162318'
    );
    
-- inserção de dados na Tabela de Usuario
insert into Usuario(nome,email,data_cadastro,nivel_associacao)
values
	(
		'Isabela Duarte',
        'isabela.duarte@email.com',
        '2025-04-17',
        'Premium'
    ),
    (
		'Lucas Oreti',
        'lucas.oreti@gmail.com',
        '2025-09-14',
        'Regular'
    ),
    (
		'Ana Silva',
        'anasilva2@gmail.com',
        '2024-02-15',
        'Regular'
    ),
    (
		'Leticia Mendes',
        'leticia.mendes7@gmail.com',
        '2024-06-10',
        'Premium'
    ),
    (
		'Lais Paiva',
        'lais.paiva@gmail.com',
        '2024-01-22',
        'Regular'
    ),
    (
		'Henrique Alves',
        'henrique.alves@gmail.com',
        '2024-07-25',
        'Básico'
    ),
    (
		'João Marcos',
        'marcosjoaa@gmail.com',
        '2024-09-23',
        'Regular'
    ),
    (
		'Bruno Leite',
        'bruno.leite5@gmail.com',
        '2025-11-30',
        'Premium'
    ),
    (
		'Layslla Paiva',
        'layslla.paiva@gmail.com',
        '2024-09-10',
        'Premium'
    ),
    (
		'Daniel Tertuliano',
        'daniel.tertuliano@gmail.com',
        '2025-12-01',
        'Regular'
    );
    
-- inserção de dados Tabela Autor
insert into Autor(nome,data_nascimento,biografia)
values
	(
		'John Green',
        '1977-08-24',
        'Escritor, vlogger e educador americano, John Green é famoso por seus romances young adult que abordam temas profundos como amor, perda e maturidade. Seu livro mais conhecido, A Culpa é das Estrelas, foi um best-seller internacional e adaptado para o cinema. Também é cofundador de projetos educacionais no YouTube, como CrashCourse.'
    ),
    (
		'Antoine de Saint-Exupéry',
        '1900-06-29',
        'Escritor, poeta e aviador francês, Antoine de Saint-Exupéry é mais conhecido por sua obra-prima O Pequeno Príncipe (1943), um clássico da literatura infantil que traz profundas lições sobre amizade, amor e a natureza humana. Além de escritor, teve uma carreira notável como piloto de correio aéreo e participou da Segunda Guerra Mundial como aviador. Sua vida foi marcada pela paixão pela aviação e pela exploração dos céus, até seu desaparecimento misterioso em 1944 durante uma missão de reconhecimento.'
    ),
    (
		'Matt Haig',
        '1975-07-03',
        'Escritor britânico conhecido por seus romances que mesclam fantasia, realismo e questões existenciais. Em A Biblioteca da Meia-Noite, Haig aborda temas como arrependimento, escolhas e a busca por sentido na vida, cativando leitores com narrativa emocional e reflexiva.'
    ),
    (
		'Colleen Hoover',
        '1979-12-11',
        'Escritora americana de romances contemporâneos, especialmente no gênero new adult e thriller romântico. Conhecida por suas tramas emocionantes e personagens complexos, Hoover conquistou grande base de fãs com títulos como Verity e It Ends With Us.'
    ),
    (
		'John Boyne',
        '1971-04-30',
        'Escritor irlandês conhecido principalmente por seus livros para jovens adultos e adultos, incluindo O Menino do Pijama Listrado. A obra, ambientada durante a Segunda Guerra Mundial, trata do relacionamento entre dois garotos — um filho de um oficial nazista e um menino judeu em um campo de concentração — e aborda temas como inocência, amizade e as crueldades do Holocausto. John Boyne é autor de diversos romances, contos e ensaios e é um dos escritores contemporâneos mais respeitados da Irlanda.'
    ),
    (
		'J.K. Rowling',
        '1965-07-31',
        'Escritora britânica, criadora da série Harry Potter, que se tornou fenômeno mundial e redefiniu a literatura juvenil. A série aborda temas como amizade, coragem e bem contra o mal, e transformou Rowling em uma das autoras mais influentes da atualidade.'
    ),
    (
		'João C. S.',
        '1978-09-27',
        'João C. S. é um escritor brasileiro conhecido por suas obras de ficção contemporânea, que exploram temas como emoções humanas, relacionamentos e questões existenciais. O Fabricante de Lágrimas é uma de suas obras mais populares, destacando-se pela sensibilidade na narrativa e pela capacidade de tocar profundamente os leitores. Ele tem conquistado uma base fiel de fãs no cenário literário nacional com sua escrita envolvente e reflexiva.'
    ),
    (
		'Lucy Vargas',
        '1984-03-07',
        'Escritora brasileira que conquistou leitores com suas histórias leves, divertidas e românticas, focando em personagens femininas fortes e relacionamentos contemporâneos.'
    ),
    (
		'George Orwell',
        '1903-06-25',
        'Escritor e jornalista britânico, Orwell é conhecido por suas obras de crítica social e política, especialmente 1984 e A Revolução dos Bichos, que são alegorias poderosas sobre regimes totalitários e abuso de poder.'
    ),
    (
		'R.J. Palacio',
        '1963-07-13',
        'Escritora americana que alcançou sucesso com seu romance Extraordinário, que fala sobre aceitação, bondade e superação através da história de um garoto com uma deformidade facial. Seu trabalho tem sido amplamente usado em escolas para ensinar empatia.'
    );


-- inserção de dados na Tabela Categoria
insert into Categoria(nome)
values
	('Romance Juvenil / Drama'),
    ('Literatura Infantojuvenil'),
    ('Ficção Contemporânea'),
    ('Thriller Psicológico / Suspense'),
    ('Ficção Histórica / Drama'),
    ('Fantasia / Aventura'),
    ('Romance / Drama'),
    ('Romance Contemporâneo'),
    ('Sátira Política / Alegoria'),
    ('Drama / Literatura Infantojuvenil');
    
-- inserção de dados na Tabela Emprestimo
insert into Emprestimo(id_usuario,id_livro,data_emprestimo,data_limite_devolucao,data_devolucao)
values
	(1, 2, '2025-02-03', '2025-02-17', '2025-02-15'),
    (3, 10, '2025-08-06', '2025-08-18', '2025-08-21'),
    (4, 9, '2025-06-09', '2025-06-23', '2025-06-21'),
    (6, 3, '2025-08-12', '2025-08-26', '2025-08-25'),
    (2, 8, '2025-03-14', '2025-03-28', '2025-03-30'),
    (7, 1, '2025-05-16', '2025-05-30', '2025-05-30'),
    (5, 4, '2025-01-15', '2025-01-25', '2025-01-24'),
    (10, 6, '2025-08-18', '2025-08-25', '2025-08-24'),
    (8, 7, '2025-08-16', '2025-08-22', '2025-08-21'),
    (9, 5, '2025-03-10', '2025-03-15', '2025-03-13');

-- Inserção de dados Tabela Associativa Autor/Livro
insert into Autor_Livro(id_livro,id_autor)
values
	(1, 1),  -- A Culpa é das Estrelas – John Green
	(2, 2),  -- O Pequeno Príncipe – Antoine de Saint-Exupéry
	(3, 3),  -- A Biblioteca da Meia-Noite – Matt Haig
	(4, 4),  -- Verity – Colleen Hoover
	(5, 5),  -- O Menino do Pijama Listrado – John Boyne
	(6, 6),  -- Harry Potter e a Câmara Secreta – J.K. Rowling
	(7, 7),  -- O Fabricante de Lágrimas – Erin Doom
	(8, 8),  -- Teto para Dois – Beth O’Leary
	(9, 9),  -- A Revolução dos Bichos – George Orwell
	(10, 10);-- Extraordinário – R.J. Palacio
    
-- Inserção de dados Tabela Associativa Categoria/Livro
insert into Categoria_Livro(id_livro,id_categoria)
values
	(1, 1),   -- Romance Juvenil
	(2, 2),   -- Fábula / Filosofia
	(3, 3),   -- Ficção Contemporânea
	(4, 4),   -- Thriller Psicológico
	(5, 5),   -- Ficção Histórica
	(6, 6),   -- Fantasia
	(7, 7),   -- Romance Dramático
	(8, 8),   -- Comédia Romântica
	(9, 9),   -- Sátira Política
	(10,10);  -- Drama Infantojuvenil
