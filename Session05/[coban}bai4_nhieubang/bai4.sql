use BTSsession5;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);


CREATE TABLE Order_items (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price INT
);

INSERT INTO Customers VALUES 
(1, 'Nguyen Van A'),
(2, 'Tran Thi B');

INSERT INTO Orders VALUES 
(101, '2026-09-01', 1),
(102, '2026-09-02', 2);

INSERT INTO Order_items VALUES 
(101, 1, 'Laptop', 1, 15000000),
(101, 1, 'Chuot', 2, 200000),
(102, 2, 'Ban phim', 1, 1000000);

SELECT 
    Orders.order_id, 
    Orders.order_date, 
    Customers.customer_name
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT 
    Orders.order_id, 
    Customers.customer_name, 
    Order_items.product_name, 
    Order_items.quantity, 
    Order_items.price
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Order_items ON Orders.order_id = Order_items.order_id;

SELECT 
    Orders.order_id, 
    Customers.customer_name, 
    SUM(Order_items.quantity * Order_items.price) AS tong_tien
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Order_items ON Orders.order_id = Order_items.order_id
GROUP BY Orders.order_id, Customers.customer_name;

SELECT 
    Orders.order_id, 
    Customers.customer_name, 
    SUM(Order_items.quantity * Order_items.price) AS tong_tien
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Order_items ON Orders.order_id = Order_items.order_id
GROUP BY Orders.order_id, Customers.customer_name
HAVING tong_tien > 10000000;