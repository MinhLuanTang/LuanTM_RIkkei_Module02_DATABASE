CREATE VIEW v_order_info AS
SELECT 
    orders.id AS order_id,
    orders.order_date,
    customers.name AS customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.id;