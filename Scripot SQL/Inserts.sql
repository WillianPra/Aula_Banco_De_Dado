-- POVOANDO TABELAS INDEPENDENTES --

-- 1. Funcionários
INSERT INTO funcionario (nome, cargo, cpf, contato) VALUES 
('Carlos Silva', 'Garçom', '111.222.333-44', '(11) 99999-1111'),
('Ana Souza', 'Gerente', '222.333.444-55', '(11) 98888-2222'),
('Roberto Dias', 'Caixa', '333.444.555-66', '(11) 97777-3333');

-- 2. Mesas
INSERT INTO mesa (capacidade, localizacao) VALUES 
(4, 'Salão Principal - Janela'),
(2, 'Salão Principal - Centro'),
(6, 'Área Externa'),
(4, 'Área Externa');

-- 3. Clientes
INSERT INTO cliente (nome, observacoes) VALUES 
('Fernanda Lima', 'Gosta de mesa silenciosa'),
('João Paulo', 'Cliente VIP'),
('Maria Oliveira', NULL),
('Teste Exclusão', 'Cliente criado para ser deletado depois');

-- 4. Produtos
INSERT INTO produto (nome, descricao, preco) VALUES 
('Hambúrguer Clássico', 'Pão, carne 180g, queijo e molho', 25.00),
('Batata Frita', 'Porção individual crocante', 12.00),
('Refrigerante Lata', 'Coca-Cola ou Guaraná 350ml', 6.00),
('Suco de Laranja', 'Natural 500ml', 10.00);

-- 5. Caixa (Abrindo o caixa do dia)
INSERT INTO caixa (data, valor_abertura, valor_fechamento, saldo_total) VALUES 
(CURDATE(), 100.00, 0.00, 100.00);

-- POVOANDO TABELAS DEPENDENTES --

-- 6. Pedidos (Vamos criar 3 pedidos)
-- Pedido 1: Mesa 1, Cliente Fernanda, Garçom Carlos
INSERT INTO pedido (id_mesa, id_cliente, id_funcionario, data_hora_abertura, status, total) VALUES 
(1, 1, 1, NOW(), 'Fechado', 37.00);

-- Pedido 2: Mesa 2, Cliente João, Garçom Carlos
INSERT INTO pedido (id_mesa, id_cliente, id_funcionario, data_hora_abertura, status, total) VALUES 
(2, 2, 1, NOW(), 'Aberto', 0.00);

-- Pedido 3: Mesa 3, Sem Cliente, Garçom Ana (Gerente ajudando)
INSERT INTO pedido (id_mesa, id_cliente, id_funcionario, data_hora_abertura, status, total) VALUES 
(3, NULL, 2, NOW(), 'Aberto', 0.00);

-- 7. Itens do Pedido (O que eles comeram)
-- Itens do Pedido 1 (Fernanda comeu Hamburguer e Batata)
INSERT INTO itempedido (id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES 
(1, 1, 1, 25.00, 25.00),
(1, 2, 1, 12.00, 12.00);

-- Itens do Pedido 2 (João pediu só Refri por enquanto)
INSERT INTO itempedido (id_pedido, id_produto, quantidade, preco_unitario, subtotal) VALUES 
(2, 3, 2, 6.00, 12.00);

-- 8. Pagamento (Apenas do pedido 1 que está fechado)
-- Pagando o Pedido 1, no Caixa 1, recebido pelo Roberto
INSERT INTO pagamento (id_pedido, id_caixa, id_funcionario, forma_pagamento, valor) VALUES 
(1, 1, 3, 'Cartão de Crédito', 37.00);