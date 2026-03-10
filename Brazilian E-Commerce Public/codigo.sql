SELECT
--Escrever as queries que solicitei (Faturamento mensal, Top 10 Clientes, Categorias).
  strftime('%Y-%m', olist_orders.order_purchase_timestamp) AS mes,
  SUM(olist_order_payments.payment_value) AS faturamento
FROM olist_orders
JOIN olist_order_payments
ON olist_orders.order_id = olist_order_payments.order_id
GROUP BY mes
ORDER BY faturamento DESC;

--Top 10 Clientes

SELECT 
olist_customers.customer_unique_id AS clientes,
SUM (olist_order_payments.payment_value) As Total_pagamento

FROM olist_orders
JOIN olist_order_payments
ON olist_order_payments.order_id = olist_orders.order_id
JOIN olist_customers
ON olist_orders.customer_id = olist_customers.customer_id
GROUP BY olist_customers.customer_id
ORDER BY Total_pagamento DESC
LIMIT 10

---Categorias

SELECT DISTINCT
product_category_name

FROM olist_products
ORDER BY product_category_name

SELECT
  t.product_category_name_english AS categoria,
  SUM(p.payment_value)           AS faturamento
FROM olist_orders o
JOIN olist_order_items i
  ON o.order_id = i.order_id
JOIN olist_products pr
  ON i.product_id = pr.product_id
JOIN product_category_name_translation t
  ON pr.product_category_name = t.product_category_name
JOIN olist_order_payments p
  ON o.order_id = p.order_id
GROUP BY categoria
ORDER BY faturamento DESC
LIMIT 10;


