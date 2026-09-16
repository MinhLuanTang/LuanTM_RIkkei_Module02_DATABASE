CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price DOUBLE,
    category_id INT,
    FOREIGN KEY (category_id)
    REFERENCES categories (id)
);


INSERT into categories (name) VALUES 
    ('Điện thoại'),
    ('Laptop'),
    ('Phụ kiện');
INSERT INTO products (name, price, category_id) VALUES 
    ('iPhone 15', 20000000, 1),
    ('Laptop Dell', 15000000, 2),
    ('Tai nghe Bluetooth', 500000, 3);


UPDATE products 
SET price = 19500000 
WHERE id = 1;

DELETE FROM products 
WHERE id = 3;

SELECT * FROM products 
ORDER BY price DESC;

SELECT categories.name, COUNT(products.id) AS so_luong
FROM categories LEFT JOIN products ON categories.id = products.category_id
GROUP BY categories.name;