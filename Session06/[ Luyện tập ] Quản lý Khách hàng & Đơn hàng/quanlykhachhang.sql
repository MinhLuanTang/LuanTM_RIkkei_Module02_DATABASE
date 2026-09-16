CREATE DATABASE quan_ly_khach_hang;
USE quan_ly_khach_hang;
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);


CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    price DOUBLE,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email) VALUES 
    ('Nguyen Van A', 'anv@gmail.com'),
    ('Tran Thi B', 'btt@gmail.com'),
    ('Le Van C', 'cle@gmail.com');

INSERT INTO orders (customer_id, order_date) VALUES 
    (1, '2024-03-01'),
    (2, '2024-03-02');

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES 
    (1, 1, 1, 19500000),
    (2, 2, 1, 15000000); 

SELECT DISTINCT customers.id, customers.name, customers.email
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

SELECT customers.id, customers.name, customers.email
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.id IS NULL;

SELECT 
    customers.id, 
    customers.name, 
    SUM(order_details.quantity * order_details.price) AS tong_doanh_thu
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
LEFT JOIN order_details ON orders.id = order_details.order_id
GROUP BY customers.id, customers.name;


SELECT DISTINCT customers.id, customers.name, order_details.price AS gia_cao_nhat
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_details ON orders.id = order_details.order_id
WHERE order_details.price = (SELECT MAX(price) FROM order_details);