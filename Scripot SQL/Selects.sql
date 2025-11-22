-- 1. Listar todos os pedidos com status 'Aberto', ordenando do mais recente para o mais antigo
SELECT * FROM pedido 
WHERE status = 'Aberto' 
ORDER BY data_hora_abertura DESC;

-- 2. Relatório de Produtos: Mostrar nome e preço dos produtos que custam mais de R$ 10,00
SELECT nome, preco 
FROM produto 
WHERE preco > 10.00 
ORDER BY preco ASC;

-- 3. JOIN: Detalhes do Pedido (Mostrar quem é o cliente e quem é o garçom do Pedido nº 1)
SELECT 
    p.id_pedido,
    p.data_hora_abertura,
    c.nome AS nome_cliente,
    f.nome AS nome_funcionario,
    m.localizacao AS mesa_local
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN funcionario f ON p.id_funcionario = f.id_funcionario
JOIN mesa m ON p.id_mesa = m.id_mesa
WHERE p.id_pedido = 1;

-- 4. Contagem: Quantos pedidos cada garçom atendeu?
SELECT f.nome, COUNT(p.id_pedido) as total_pedidos
FROM funcionario f
JOIN pedido p ON f.id_funcionario = p.id_funcionario
GROUP BY f.nome;