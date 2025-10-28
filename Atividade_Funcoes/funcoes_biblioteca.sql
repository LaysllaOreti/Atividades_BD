USE biblioteca_online;

-- 1. Mostre o nome de todos os usuários e o ano em que se cadastraram. 
SELECT nome,
    YEAR(data_cadastro) AS ano_cadastro
FROM
	Usuario;
    
-- 2. Exiba o nome dos autores e o mês de nascimento de cada um. 
SELECT nome,
	MONTH(data_nascimento) AS mes_nascimento
FROM 
	Autor;
    
-- 3. Liste o nome do usuário, titulo do livro, data_emprestimo, data_devolucao e a diferença em dias entre essas duas datas de todos os empréstimos que já foram devolvidos. 
SELECT 
    Usuario.nome AS usuario, 
    Livro.titulo AS livro, 
    Emprestimo.data_emprestimo, 
    Emprestimo.data_devolucao, 
    DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_emprestimo) AS dias_emprestimo
FROM Emprestimo
JOIN  Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.data_devolucao IS NOT NULL;

-- 4. Mostre os livros emprestados (titulo) e a data formatada do empréstimo no formato dd/mm/aaaa. 
SELECT
	Livro.titulo,
    DATE_FORMAT(Emprestimo.data_emprestimo, '%d%m%Y') AS data_emprestimo_formatada
FROM Emprestimo
JOIN
	Livro ON Emprestimo.livro_id = Livro.id;
    
-- 5. Liste a data do cadastro e o dia da semana em que cada usuário foi cadastrado. 
SELECT data_cadastro,
	DAYNAME(data_cadastro) AS dia_semana
FROM Usuario;

-- 6. Mostre a diferença absoluta em dias entre a data de devolução e a data limite de devolução (empréstimos já devolvidos), acrescente mais uma coluna mostrando somente a diferença em dias entre a data de devolução e a data limite de devolução (uma coluna com diferença absoluta e outra sem a função). 
SELECT 
	Emprestimo.id,
    Livro.titulo,
    Usuario.nome AS usuario,
    Emprestimo.data_devolucao,
    Emprestimo.data_devolucao_limite,
    ABS(DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite)) AS diferenca_absoluta,
    DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) AS diferenca_normal
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.data_devolucao IS NOT NULL;

-- 7. Calcule o valor da multa, considerando 1 real por dia de atraso (data_devolucao > data_devolucao_limite) e mostre o valor arredondado para 2 casas decimais. 
SELECT
    Emprestimo.id,
    Livro.titulo,
    Usuario.nome AS usuario,
    Emprestimo.data_devolucao,
    Emprestimo.data_devolucao_limite,
    ROUND(
        CASE
            WHEN Emprestimo.data_devolucao > Emprestimo.data_devolucao_limite
            THEN DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) * 1
            ELSE 0
        END, 2
    ) AS valor_multa
FROM Emprestimo

JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id

WHERE Emprestimo.data_devolucao IS NOT NULL;

-- 8. Liste o nome dos usuários em maiúsculas. 
SELECT UPPER(nome) AS usuario_maiusculo
FROM Usuario;

-- 9. Liste os nomes dos livros com apenas os 5 primeiros caracteres. 
SELECT LEFT(titulo,5) AS titulo_5_caracteres
FROM Livro;

-- 10. Mostre o nome e o email de cada usuário concatenados com um traço entre eles. 
SELECT CONCAT(nome,'-',email) AS usuario_concatenado
FROM Usuario;

-- 11. Mostre os nomes dos autores com todas as letras 'a' substituídas por '@'. 
SELECT REPLACE(nome,'a','@') AS autores
FROM Autor;

-- 12. Liste o nome dos livros e o número de caracteres de cada título.
SELECT 
    titulo, 
    CHAR_LENGTH(titulo) AS titulo
FROM Livro;

-- 13. Mostre quantos usuários há no total.
SELECT COUNT(id) AS usuario
FROM Usuario;

-- 14. Exiba a média de dias de empréstimo (entre data_emprestimo e data_devolucao) para os empréstimos já devolvidos.
SELECT AVG(DATEDIFF(data_devolucao,data_emprestimo)) AS avg_emprestimo
FROM Emprestimo;

-- 15. Mostre o menor e o maior número de dias entre data_emprestimo e data_devolucao para os empréstimos já devolvidos.
SELECT 
	MIN(DATEDIFF(data_devolucao,data_emprestimo)) AS menor_dias,
    MAX(DATEDIFF(data_devolucao, data_emprestimo)) AS maior_dias
FROM Emprestimo
WHERE data_devolucao IS NOT NULL;

-- 16. Mostre quantos usuários existem por nível de associação.
SELECT 
	nivel_associacao,
    COUNT(*) AS total_usuarios
FROM Usuario
GROUP BY nivel_associacao;

-- 17. Mostre quantos livros foram emprestados por usuário. 
SELECT 
	Usuario.nome AS usuario,
    COUNT(Emprestimo.livro_id) AS total_emprestimos
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome;

-- 18. Liste quantos empréstimos foram feitos por mês.
SELECT
	YEAR(data_emprestimo) AS ano,
	MONTH(data_emprestimo) AS mes, 
    COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY 
	YEAR(data_emprestimo), MONTH(data_emprestimo)
ORDER BY ano, mes;

-- 19. Mostre a quantidade de livros por categoria.
SELECT 
	Categoria.nome AS categoria,
    COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome;

-- 20. Mostre os níveis de associação com mais de 3 usuários.
SELECT
	nivel_associacao,
    COUNT(*) AS total_usuarios
FROM Usuario
GROUP BY nivel_associacao
HAVING 
	COUNT(*) > 3;
    
-- 21. Liste os usuários que fizeram mais de 1 empréstimo.
SELECT
	Usuario.nome AS usuario,
    COUNT(Emprestimo.id) AS total_emprestimos
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome
Having
	COUNT(Emprestimo.id) > 1;
    
-- 22. Mostre os meses com mais de 2 empréstimos registrados.
SELECT 
    YEAR(data_emprestimo) AS ano,
    MONTH(data_emprestimo) AS mes,
    COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY YEAR(data_emprestimo), MONTH(data_emprestimo)
HAVING 
    COUNT(*) > 2
ORDER BY ano, mes;

-- 23. Liste as categorias com mais de 1 livro vinculado. 
SELECT 
    Categoria.nome AS categoria,
    COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome
HAVING 
    COUNT(LivroCategoria.livro_id) > 1;
