USE bcd_subconsulta;

-- 1. Liste o id_pedido, data_pedido, status e o total do pedido calculado com uma subconsulta que some qtde * preco_unit dos itens.
SELECT 
    p.id_pedido,
    p.data_pedido,
    p.status,
    (
        SELECT SUM(i.qtde * i.preco_unit)
        FROM itens_pedido AS i
        WHERE i.id_pedido = p.id_pedido
    ) AS total_pedido
FROM pedidos AS p;

-- 2. Mostre o id_pedido, data_pedido e o total calculado por subconsulta apenas para os pedidos 
-- cujo total é maior que a média geral de todos os pedidos.
SELECT 
	p.id_pedido,
    p.data_pedido,
    (
		SELECT SUM(qtd * preco_unit)
        FROM item_pedido
        WHERE item_pedido.id_produto = produto.id_produto
    ) AS total
FROM pedidos as p
WHERE (
	-- Determino o alias
	SELECT SUM(i.qtde * i.preco_unit)
    FROM itens_pedido AS i
    WHERE i.id_pedido = p.id_pedido
) > (
	SELECT AVG(qtd * preco_unit) 
    FROM itens_pedido
    GROUP BY itens_pedido.id_pedido
);

-- 3. Mostre o id_produto e nome dos produtos que não aparecem em nenhum registro da tabela itens_pedido.
SELECT 
	id_produto,
    nome
FROM produtos 
WHERE produtos.id_produto NOT IN(
	SELECT id_produto
    FROM itens_pedido
);

-- 4. Liste o id_cliente e nome dos clientes que nunca compraram produtos da categoria 'Games'.
SELECT
	id_cliente
    nome
FROM clientes
