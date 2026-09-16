USE quan_ly_khach_hang;

SELECT 
    p.id AS product_id,
    p.name AS product_name,
    p.price,
    c.name AS category_name
FROM products p
JOIN categories c ON p.category_id = c.id;

SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    COUNT(o.id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;


SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    IFNULL(SUM(od.quantity * od.price), 0) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.name
ORDER BY total_spent DESC
LIMIT 5;

SELECT 
    p.id AS product_id,
    p.name AS product_name,
    p.price
FROM products p
LEFT JOIN order_details od ON p.id = od.product_id
WHERE od.product_id IS NULL;

SELECT DISTINCT 
    c.id AS customer_id,
    c.name AS customer_name,
    c.email
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
JOIN products p ON od.product_id = p.id
WHERE p.category_id = (
    SELECT category_id 
    FROM products 
    GROUP BY category_id 
    ORDER BY COUNT(id) DESC 
    LIMIT 1
);