USE session09;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);


INSERT INTO products (product_name, price, stock) VALUES
('Chuột máy tính Logitech G102', 400000.00, 50),
('Bàn phím cơ AKKO 3068', 1200000.00, 30),
('Tai nghe HyperX Cloud II', 1800000.00, 15),
('Lót chuột Gaming Size XL', 150000.00, 100),
('Màn hình Dell UltraSharp 27 inch', 8500000.00, 10),
('Thẻ nhớ MicroSD 64GB', 250000.00, 80),
('Webcam Logitech C920', 1650000.00, 20),
('Loa Bluetooth JBL Flip 5', 2300000.00, 25),
('Ổ cứng SSD Samsung 500GB', 1400000.00, 40),
('RAM DDR4 Kingston 16GB', 950000.00, 60),
('Cáp sạc Type-C Anker', 200000.00, 120),
('Sạc dự phòng Anker 20000mAh', 850000.00, 35),
('Ghế Gaming Secretlab', 9900000.00, 5),
('Đế tản nhiệt Laptop', 350000.00, 45),
('Đồng hồ thông minh Apple Watch S8', 9500000.00, 8),
('Tai nghe AirPods Pro 2', 5800000.00, 18),
('Chuột không dây MX Master 3S', 2400000.00, 22),
('Bàn phím Bluetooth Logitech K380', 650000.00, 55),
('Màn hình Asus TUF 24 inch 165Hz', 4200000.00, 12),
('Hub chuyển đổi USB-C 7 in 1', 750000.00, 40);


DELIMITER //

CREATE PROCEDURE get_high_value_products()
BEGIN
    SELECT 
        product_id,
        product_name,
        price,
        stock
    FROM 
        products
    WHERE 
        price > 1000000;
END //

DELIMITER ;

CALL get_high_value_products();