-- su dung tiep database cua bai quan_ly_khach_hang --
USE quan_ly_khach_hang;

INSERT INTO orders (customer_id, order_date) 
VALUES (1, '2024-03-15');

INSERT INTO order_details (order_id, product_id, quantity, price) 
VALUES 
    (LAST_INSERT_ID(), 1, 2, 19500000),
    (LAST_INSERT_ID(), 2, 1, 15000000);


SELECT 
    SUM(quantity * price) AS tong_doanh_thu_cua_hang
FROM order_details;



SELECT 
    AVG(tong_tien_don_hang) AS doanh_thu_trung_binh_don
FROM (
    SELECT 
        order_id, 
        SUM(quantity * price) AS tong_tien_don_hang
    FROM order_details
    GROUP BY order_id
) AS bang_tam;



SELECT 
    orders.id AS order_id,
    orders.customer_id,
    orders.order_date,
    SUM(order_details.quantity * order_details.price) AS tong_tien
FROM orders
JOIN order_details ON orders.id = order_details.order_id
GROUP BY orders.id, orders.customer_id, orders.order_date
ORDER BY tong_tien DESC
LIMIT 1;


SELECT 
    products.id AS product_id,
    products.name AS product_name,
    SUM(order_details.quantity) AS tong_so_luong_ban
FROM order_details
JOIN products ON order_details.product_id = products.id
GROUP BY products.id, products.name
ORDER BY tong_so_luong_ban DESC
LIMIT 3;