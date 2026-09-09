use BTSsession5;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) NOT NULL
);

INSERT INTO products (product_name, category, price) VALUES
('iPhone 15 Pro', 'Dien thoai', 28000000),
('Samsung Galaxy S24', 'Dien thoai', 22000000),
('Redmi Note 13', 'Dien thoai', 5000000),
('MacBook Air M2', 'Laptop', 24000000),
('Dell Inspiron', 'Laptop', 15000000),
('Chuot Logitech', 'Phu kien', 500000),
('Ban phim Co', 'Phu kien', 1500000);

SELECT product_id, product_name, category, price 
FROM products 
WHERE price > (SELECT AVG(price) FROM products);

SELECT product_id, product_name, category, price 
FROM products 
WHERE (category, price) IN (
    SELECT category, MAX(price) 
    FROM products 
    GROUP BY category
);


SELECT product_id, product_name, category, price 
FROM products 
WHERE category IN (
    SELECT category 
    FROM products 
    WHERE price > 20000000
);