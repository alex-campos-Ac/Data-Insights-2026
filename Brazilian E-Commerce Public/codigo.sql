SELECT 
--Ver o ID do pedido e a cidade do cliente que comprou.
c.customer_city As clientes,
o.order_id As pedidos
FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id
ORDER BY clientes DESC


--Ver o ID do pedido e a cidade do cliente que comprou.
SELECT 
c.customer_city As clientes,
o.order_id As pedidos
FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id
WHERE c.customer_city = 'curitiba'
ORDER BY clientes DESC

--Conte quantos pedidos foram feitos em cada cidade
SELECT 
c.customer_city AS cidade,
COUNT (o.order_id) pedidos
FROM olist_customers c
JOIN olist_orders o
ON c.customer_id = o.customer_id
GROUP BY cidade
ORDER BY pedidos DESC