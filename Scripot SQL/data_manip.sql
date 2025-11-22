-- === ATUALIZAÇÕES (UPDATE) ===

-- 1. Atualizar o preço do 'Hambúrguer Clássico' para R$ 28.00 (Inflação!)
UPDATE produto 
SET preco = 28.00 
WHERE id_produto = 1;

-- 2. Fechar o pedido nº 2 que estava aberto e definir o valor total
UPDATE pedido 
SET status = 'Fechado', total = 12.00, data_hora_fechamento = NOW()
WHERE id_pedido = 2;

-- 3. Corrigir o telefone do funcionário Carlos Silva
UPDATE funcionario 
SET contato = '(11) 99999-8888' 
WHERE nome = 'Carlos Silva';


-- === EXCLUSÕES (DELETE) ===

-- 1. Deletar o cliente 'Teste Exclusão' (que criamos só para isso)
DELETE FROM cliente 
WHERE nome = 'Teste Exclusão';

-- 2. Cancelar (deletar) um item de pedido específico (ex: cliente desistiu do refri no pedido 2)
-- Atenção: Em sistemas reais, geralmente não deletamos, apenas mudamos status, mas aqui é exercício de DML.
DELETE FROM itempedido 
WHERE id_pedido = 2 AND id_produto = 3 LIMIT 1;

-- 3. Deletar uma mesa quebrada que não será mais usada (Mesa 4)
-- Só funciona se não tiver pedidos vinculados a ela.
DELETE FROM mesa 
WHERE id_mesa = 4;