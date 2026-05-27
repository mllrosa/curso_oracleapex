# ===================================
#  BANCO DE DADOS ORACLE - 29.04.2026
# ===================================

# Categoria
# 100 - Bebidas
# 101 - Lanches
# 102 - Sobremesa
# 103 - Salgados
# 104 - Doces
# 105 - Pizzas


# Cardápio
# car_codigo  car_nome   car_preco   car_unidade   car_peso     cat_codigo
# 500         Agua        4.00       1               500        100
# 501         X-Salada   25.00       1               150        101 

# FORMAPAGTO
# fpg_codigo   fpg_nome
# 800          Dinheiro
# 801          Cartão de Débito
# 802          Cartão de Crédito
# 803          PIX

# Escreva a instrução SQL para:

# 1. 8 do pedido; número do item, código e nome do item do cardápio, quantidade, valor unitário e valor total do item.

# ==================================
# BANCO DE DADOS ORACLE - 13.05.2026
# ==================================

# SELECT cliente.cli_nome, pedido.ped_numero, pedido.ped_data, 
#                cardapio.car_nome, itempedido.itm_quantidade
# FROM cliente, pedido, itempedido, cardapio
# WHERE cliente.cli_codigo           = pedido.cli_codigo AND
#                pedido.ped_numero     = itempedido.ped_numero AND
#                itempedido.car_codigo = cardapio.car_codigo AND
#                cliente.cli_nome            = "Marcelo"
# ORDER BY pedido.ped_data, cardapio.car_nome;

# SELECT cliente.cli_nome AS "Nome", pedido.ped_numero AS "n° Pedido",
#                pedido.ped_data AS "Data",  cardapio.car_nome AS "Nome Produto",               
#                itempedido.itm_quantidade AS "Quantidade"
# FROM cliente, pedido, itempedido, cardapio
# WHERE cliente.cli_codigo           = pedido.cli_codigo AND
#                pedido.ped_numero     = itempedido.ped_numero AND
#                itempedido.car_codigo = cardapio.car_codigo AND
#                cliente.cli_nome            = "Marcelo"
# ORDER BY pedido.ped_data, cardapio.car_nome;

# SELECT cliente.cli_nome, garcom.gar_nome
# FROM cliente, pedido, itempedido, garcom
# WHERE cliente.cli_codigo           = pedido.cli_codigo AND
#                pedido.ped_numero     = itempedido.ped_numero AND
#                itempedido.gar_codigo = garcom.gar_codigo

# SELECT c.cli_nome, g.gar_nome
# FROM cliente AS c, pedido AS p, itempedido AS i, garcom AS g
# WHERE c.cli_codigo           = p.cli_codigo AND
#                p.ped_numero      = i.ped_numero AND
#                i.gar_codigo          = g.gar_codigo

# Na prática, SGBD executa da seguinte forma:

#     FROM cliente AS c, pedido AS p, itempedido AS i, garcom AS g
#     WHERE c.cli_codigo           = p.cli_codigo AND
#                    p.ped_numero      = i.ped_numero AND
#                    i.gar_codigo          = g.gar_codigo
#     SELECT c.cli_nome, g.gar_nome


# SELECT categoria.cat_nome, cardapio.car_nome, cardapio.car_preco
# FROM categoria INNER JOIN cardapio USING(cat_codigo)
# ORDER BY categoria.cat_nome, cardapio.car_nome;

# SELECT categoria.cat_nome, cardapio.car_nome, cardapio.car_preco
# FROM categoria INNER JOIN cardapio ON(categoria.cat_codigo = cardapio.cat_codigo);

# Dado:
#     aluno{ ra, nome, email, codigocurso }
#     curso{ codcurso, nome, duracao}

# Exibir o nome do aluno e o curso
#     SELECT aluno.nome, curso.nome
#     FROM aluno INNER JOIN curso ON(aluno.codigocurso = curso.codcurso);

#     ** não é possível utilizar o Using, pois o nome do campo que associa
#         as tabelas possuem nomes diferentes.


# SELECT cliente.cli_nome
# FROM cliente INNER JOIN pedido USING(cli_codigo)
#                        INNER JOIN formapagamento USING(fpg_codigo)
# WHERE formapagamento.fpg_nome = "PIX";



# SELECT cardapio.car_codigo, cardapio.car_nome
# FROM cardapio
# WHERE cardapio.car_codigo NOT IN (SELECT              
#                                                                distinct(itempedido.car_codigo)
#                                                                FROM itempedido
#                                                             );

# SELECT alu_nome, alu_nota
# FROM aluno
# WHERE alu_nota >  ( SELECT AVG(alu_nota) 
#                                    FROM Aluno
#                                   );


# SELECT cardapio.car_codigo, cardapio.car_nome, itempedido.car_codigo
# FROM cardapio OUTER LEFT JOIN itempedido USING(car_codigo)
# WHERE itempedido.car_codigo IS NULL;

# ====================================
#   BANCO DE DADOS ORACLE - 20.05.2026
# ====================================
# Continuação dos Exercícios:
# 21. Exibir o nome e e-mail de todos os clientes. Ordenar o resultado por nome.
# 22. Exibir o nome e e-mail dos clientes que possuem email do gmail.
# 23. Exibir o nome dos clientes que não possuem email.
# 24. Exibir o Status e o nome do cliente.
# 25. Quantos clientes estão ativos?
# 26. Quantos clientes estão inativos?
# 27. Exibir a quantidade de clientes por Status.
# 28. Exibir o código, nome e preço de todos os itens do cardápio.
# 29. Exibir o nome da categoria, código, nome e preço de todos os itens do cardápio.
# 30. Quais formas de pagamento o restaurante utiliza?
# 31. Exibir a quantidade de clientes do restaurante.
# 32. Quais lanches iniciam com a letra "A".
# 33. Quais itens do cardápio possuem "queijo" no nome.
# 34. Quais itens da categoria Doces estão com preço abaixo de 20.00.
# 35. (duplicidade) Exibir a categoria dos itens que nunca foram vendidos.
# 36. Exibir a média mensal de faturamento durante o ano de 2026.
