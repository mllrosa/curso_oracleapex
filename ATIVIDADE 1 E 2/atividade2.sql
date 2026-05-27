-- # Tarefa 04 - SQL - Restaurante - 21 a 36


-- # ====================================
-- #   BANCO DE DADOS ORACLE - 20.05.2026
-- # ====================================
-- # Continuação dos Exercícios:

-- # 21. Exibir o nome e e-mail de todos os clientes. Ordenar o resultado por nome.
SELECT cli_nome, cli_email
FROM CLIENTE
ORDER BY cli_nome ASC;


-- # 22. Exibir o nome e e-mail dos clientes que possuem email do gmail.
SELECT cli_nome, cli_email
FROM CLIENTE
WHERE cli_email LIKE '%@email.com'
ORDER BY cli_nome ASC;


-- # 23. Exibir o nome dos clientes que não possuem email.
SELECT cli_nome
FROM CLIENTE
WHERE cli_email IS NULL
ORDER BY cli_nome ASC;
-- Nunhum cliente tem os dados como null, então nenhuma informação foi encontrada


-- # 24. Exibir o Status e o nome do cliente.
SELECT cli_status, cli_nome
FROM CLIENTE
ORDER BY cli_nome ASC;


-- # 25. Quantos clientes estão ativos?
SELECT COUNT(*) AS total_clientes_ativos
FROM CLIENTE
WHERE cli_status = 'A';

-- # 26. Quantos clientes estão inativos?
SELECT COUNT(*) AS total_clientes_inativos
FROM CLIENTE
WHERE cli_status = 'I';


-- # 27. Exibir a quantidade de clientes por Status.
SELECT cli_status, COUNT(*) AS quantidade_clientes
FROM CLIENTE
GROUP BY cli_status
ORDER BY cli_status ASC;


-- # 28. Exibir o código, nome e preço de todos os itens do cardápio.
SELECT car_codigo, car_nome, car_preco
FROM CARDAPIO
ORDER BY car_nome ASC;


-- # 29. Exibir o nome da categoria, código, nome e preço de todos os itens do cardápio.
SELECT categoria.cat_nome, cardapio.car_codigo, 
       cardapio.car_nome, cardapio.car_preco
FROM categoria, cardapio
WHERE categoria.cat_codigo = cardapio.cat_codigo
ORDER BY categoria.cat_nome ASC, cardapio.car_nome ASC;


-- # 30. Quais formas de pagamento o restaurante utiliza?
Select fpg_nome 
From formapagamento;


-- # 31. Exibir a quantidade de clientes do restaurante.
SELECT COUNT(*) AS total_clientes
FROM CLIENTE;


-- # 32. Quais lanches iniciam com a letra "A".
SELECT car_codigo, car_nome, car_preco
FROM CARDAPIO
WHERE cat_codigo = 101 
  AND car_nome LIKE 'A%'
ORDER BY car_nome ASC;
-- nunhum lanche da minha tabela tinha a primeira letra como 'a' entao nenhuma linha foi encontrada

-- # 33. Quais itens do cardápio possuem "queijo" no nome.
SELECT car_codigo, car_nome, car_preco
FROM CARDAPIO
WHERE LOWER(car_nome) LIKE '%queijo%'
ORDER BY car_nome ASC;
-- nunhum lanche tinha queijo no nome :(

-- # 34. Quais itens da categoria Doces estão com preço abaixo de 20.00.
SELECT cardapio.car_codigo, cardapio.car_nome, cardapio.car_preco
FROM categoria, cardapio
WHERE categoria.cat_codigo = cardapio.cat_codigo AND
      categoria.cat_nome   = 'Doces' AND
      cardapio.car_preco   < 20.00
ORDER BY cardapio.car_preco ASC;


-- # 35. (duplicidade) Exibir a categoria dos itens que nunca foram vendidos.
SELECT DISTINCT categoria.cat_nome
FROM categoria, cardapio
WHERE categoria.cat_codigo = cardapio.cat_codigo AND
      cardapio.car_codigo NOT IN (SELECT itempedido.car_codigo FROM itempedido)
ORDER BY categoria.cat_nome ASC;
-- todos os itens ja foram vendidos

-- # 36. Exibir a média mensal de faturamento durante o ano de 2026.
SELECT AVG(faturamento_mensal) AS media_mensal_2026
FROM (
    SELECT EXTRACT(MONTH FROM ped_data) AS mes, SUM(ped_valorTotal) AS faturamento_mensal
    FROM PEDIDO
    WHERE EXTRACT(YEAR FROM ped_data) = 2026
    GROUP BY EXTRACT(MONTH FROM ped_data)
);