-- su dung tiep database cua bai quan_ly_khach_hang --
USE quan_ly_khach_hang;

SELECT * 
FROM products
WHERE price BETWEEN 1000000 AND 20000000;

SELECT * 
FROM products
WHERE name LIKE '%iPhone%';

SELECT 
    category_id, 
    AVG(price) AS gia_trung_binh
FROM products
GROUP BY category_id;

SELECT * 
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT * 
FROM products p
WHERE price = (
    SELECT MIN(price) 
    FROM products 
    WHERE category_id = p.category_id
);