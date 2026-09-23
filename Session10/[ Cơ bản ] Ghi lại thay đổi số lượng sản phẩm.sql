CREATE DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE inventoryChanges (
    changeID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT NOT NULL,
    oldQuantity INT,
    newQuantity INT,
    changeDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (productID) REFERENCES products(productID) ON DELETE CASCADE
);

DELIMITER //

CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.quantity <> NEW.quantity THEN
        INSERT INTO inventoryChanges (productID, oldQuantity, newQuantity, changeDate)
        VALUES (NEW.productID, OLD.quantity, NEW.quantity, NOW());
    END IF;
END //

DELIMITER ;


INSERT INTO products (productName, quantity) VALUES
('Laptop Dell XPS', 10),
('Chuột Logitech G Pro', 50);

SELECT * FROM products;


UPDATE products 
SET quantity = 8 
WHERE productID = 1;

UPDATE products 
SET quantity = 45 
WHERE productID = 2;

SELECT * FROM inventoryChanges;