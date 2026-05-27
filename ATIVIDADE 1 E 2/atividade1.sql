# Tarefa 03 - SQL - Restaurante - 1 a 20

# -- Escreva a instrução SQL para:

# -- 1. Exibir os dados dos clientes.
# select * from cliente

# -- 2. Exibir os dados das formas de pagamento.
# select * from formapagamento

# -- 3. Exibir os dados das categorias.
# select * from categoria

# -- 4. Exibir os itens do cardápio (código, nome, preço e categoria), organizar por categoria e nome do item.
# select CAR_CODIGO, CAR_NOME, CAR_PRECO,	CAT_CODIGO from cardapio

# -- 5. Exibir os dados do(s) pedido(s) da cliente "Claudia".

# -- 6. Alterar a descrição da categoria Massas para Guloseimas.

# -- 7. Adicionar a categoria Massas.
# -- 8. Adicionar o garçom Mário.
# insert into garcom values (404, 'Mário', '15/09/2005', '10h - 22h')

# update table garcom set 404 where gar_codigo = 400
# select * from garcom
# -- 9. Exibir o número do pedido, a quantidade de pessoas na mesa, o valor total do pedido e o valor de cada pessoa.
# -- 10. Exibir a quantidade de itens do cardápio por categoria.
# -- 11. Exibir a quantidade de itens consumidos em cada pedido.
# -- 12. Quais foram os itens já consumidos pela cliente "Marcia".
# -- 13. Exibir a categoria dos itens que nunca foram vendidos.
# -- 14. Exibir o nome dos clientes que nunca pediram "Guloseimas"
# -- 15. Exibir o faturamento no mês de setembro/2024.
# -- 16. Exibir o faturamento no mês de setembro/2024 organizado por forma de pagamento.
# -- 17. Exibir o faturamento do mês de setembro/2024, organizado por categoria.
# -- 18. Exibir o(s) nome(s) dos garçons que já atenderam a cliente "Veronice".
# -- 19. Qual foi o valor do maior pedido?
# -- 20. Quais clientes possuem pedidos maiores que a média dos pedidos da cliente Veronice?.  Exibir o nome do cliente, numero, data  e hora do pedido; número do item, código e nome do item do cardápio, quantidade, valor unitário e valor total do item.
