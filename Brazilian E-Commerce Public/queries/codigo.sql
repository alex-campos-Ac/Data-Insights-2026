SELECT 
--Verificando o ID do pedido e a cidade do cliente que comprou.
c.customer_city As clientes,
o.order_id As pedidos
FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id
ORDER BY clientes DESC;


--Verificando ID do pedido e a cidade do cliente que comprou, filtrando por 'curitiba'
SELECT 
c.customer_city As clientes,
o.order_id As pedidos
FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id
WHERE c.customer_city = 'curitiba'
ORDER BY clientes DESC;

--Contagem, quantos pedidos foram feitos em cada cidade
SELECT 
c.customer_city AS cidade,
COUNT (o.order_id) pedidos
FROM olist_customers c
JOIN olist_orders o
ON c.customer_id = o.customer_id
GROUP BY cidade
ORDER BY pedidos DESC;

--agrupando por Cidade e calcule a Soma do Valor dos Itens
SELECT 
o.order_id AS id_pedido,
c.customer_city AS cidade_cliente,
i.price AS preço_item,
SUM(i.price) AS soma_itens

FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id

JOIN olist_order_items i
ON o.order_id = i.order_id
GROUP BY cidade_cliente
ORDER BY cidade_cliente ASC

--Média do Valor do Frete por Cidade do Cliente.
SELECT
c.customer_city AS cidade,
i.freight_value AS frete,
o.order_status AS status_entrega,
AVG(freight_value) AS media_valor_frete

FROM olist_order_items  i
JOIN olist_orders o
ON i.order_id = o.order_id
JOIN olist_customers c
ON c.customer_id = o.customer_id
GROUP BY cidade
HAVING AVG(freight_value) > 10
ORDER BY media_valor_frete DESC