INSERT INTO lab.sales (customer_id, amount) VALUES (1, 120.50);
INSERT INTO lab.sales (customer_id, amount) VALUES (1, 80.00);
INSERT INTO lab.sales (customer_id, amount) VALUES (2, 240.00);

SELECT customer_id, COUNT(*) AS orders, SUM(amount) AS revenue
FROM lab.sales
GROUP BY customer_id
ORDER BY revenue DESC;

EXPLAIN
SELECT customer_id, SUM(amount)
FROM lab.sales
GROUP BY customer_id;

SELECT projection_name, anchor_table_name
FROM v_catalog.projections
WHERE anchor_table_name = 'sales';
