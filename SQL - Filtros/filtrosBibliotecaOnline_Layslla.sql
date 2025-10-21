USE BibliotecaOnline;

-- 1. Liste os títulos e categorias dos livros do gênero Mistério, ordenados por título em ordem alfabética.
SELECT 
    Livro.titulo AS Título,
    Categoria.nome AS Categoria
FROM Livro

JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id

-- limitar qual é a categoria
WHERE Categoria.nome = 'Mistério'
-- ordem alfabética
ORDER BY Livro.titulo ASC;

-- 2. Mostre o título e o ISBN dos livros que começam com a letra "O".
SELECT titulo, isbn
FROM Livro

-- delimitar que os títulos tem que comçar com a letra 'O'
WHERE titulo LIKE 'O%';

-- 3. Liste os nomes e níveis de associação dos usuários cadastrados após 01/06/2023.
SELECT nome, nivel_associacao
FROM Usuario

WHERE data_cadastro > '2023-06-01';

-- 4. Mostre o nome dos autores cuja data de nascimento está ausente.
SELECT nome
FROM Autor

WHERE data_nascimento IS NULL;

-- 5. Exiba os títulos e descrições dos livros que possuem descrição preenchida.
SELECT titulo, descricao
FROM Livro

-- descrição não pode ser nula, tem que estar preenchida
WHERE descricao IS NOT NULL AND descricao <> '';

-- 6. Liste os usuários regulares ou premium (usando IN) e mostre apenas nome e data de cadastro.
SELECT nome, data_cadastro
FROM Usuario

-- IN busca valores dentro de uma lista
WHERE nivel_associacao IN ('regular', 'premium');

-- 7. Mostre os livros com ID entre 3 e 6, inclusive.
SELECT id, titulo, isbn, descricao
FROM Livro

WHERE id BETWEEN 303 AND 306;

-- 8. Liste o nome e email dos usuários cujo nome não começa com “M”.
SELECT nome, email
FROM Usuario

WHERE nome NOT LIKE 'M%';
 
-- 9. Exiba os títulos dos livros emprestados que ainda não foram devolvidos.
SELECT titulo
FROM Livro

JOIN Emprestimo ON Livro.id = Emprestimo.livro_id
WHERE Emprestimo.data_devolucao IS NULL;

-- 10. Mostre os 5 primeiros livros cadastrados (considerando o ID como ordem de cadastro).
SELECT titulo, id
FROM Livro

ORDER BY id ASC
LIMIT 5;

-- 11. Mostre os 5 livros seguintes após pular os 3 primeiros.
SELECT titulo, id 
FROM Livro

LIMIT 5 OFFSET 3;

-- 12. Mostre os títulos de livros cujo nome tenha exatamente 5 letras antes de "rry".
SELECT titulo
FROM Livro

-- cada '_' representa a quantidade de caracteres antes de "rry"
WHERE titulo LIKE '_____rry%';

-- 13. Liste os usuários premium cadastrados depois de julho de 2023.
SELECT nome, data_cadastro
FROM Usuario

WHERE nivel_associacao = 'premium'
	AND data_cadastro > '2023-07-31';

-- 14. Liste os títulos de livros da categoria Ficção ou Mistério, que tenham descrição preenchida.
SELECT Livro.titulo
FROM Livro

JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id

WHERE Categoria.nome IN ('Ficção', 'Mistério')
	AND Livro.descricao IS NOT NULL
    AND Livro.descricao <> '';

-- 15. Liste os títulos, nomes dos autores e categorias dos livros emprestados entre janeiro e fevereiro de 2024, cujo título começa com a letra “O”, que possuam descrição preenchida, e sejam de uma das categorias 'Mistério', 'Ficção' ou 'Fantasia'. Mostre apenas os livros escritos por autores cujo nome contém a letra “a”. Ordene o resultado por título.
SELECT 
	Livro.titulo, 
    Autor.nome AS Autor, 
    Categoria.nome AS Categoria
FROM Livro

JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
JOIN LivroAutor ON Livro.id = LivroAutor.livro_id
JOIN Autor ON LivroAutor.autor_id = Autor.id
JOIN Emprestimo ON Livro.id = Emprestimo.livro_id

WHERE Emprestimo.data_emprestimo BETWEEN '2024-01-01' AND '2024-02-29'
	AND Livro.titulo LIKE 'O%'
    AND Livro.descricao IS NOT NULL
    AND Livro.descricao <> ''
    AND Categoria.nome IN ('Mistério', 'Ficção', 'Fantasia')
    AND Autor.nome LIKE '%a%'
    




