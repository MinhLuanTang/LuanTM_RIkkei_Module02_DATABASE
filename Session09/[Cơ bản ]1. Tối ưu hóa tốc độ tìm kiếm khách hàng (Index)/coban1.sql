CREATE DATABASE session09;
use session09;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX idx_unique_email ON customers(email);

CREATE INDEX idx_phone ON customers(phone);

INSERT INTO customers (customer_name, email, phone, address) VALUES
('Nguyen Van A', 'a.nguyen@gmail.com', '0901234567', '123 Le Loi, Quan 1, TP.HCM'),
('Tran Thi B', 'b.tran@yahoo.com', '0912345678', '456 Nguyen Hue, Quan 1, TP.HCM'),
('Le Van C', 'c.le@gmail.com', '0901234567', '789 CMT8, Quan 3, TP.HCM'),
('Pham Minh D', 'd.pham@outlook.com', '0988888888', '101 Tran Hung Dao, Da Nang'),
('Hoang Anh E', 'e.hoang@gmail.com', '0933333333', '202 Hoang Dieu, Ha Noi');

SELECT * FROM customers;

SELECT * FROM customers WHERE email = 'a.nguyen@gmail.com';

SELECT * FROM customers WHERE phone = '0901234567';
