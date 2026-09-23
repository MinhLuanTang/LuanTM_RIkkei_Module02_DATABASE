USE inventorymanagement;
DELIMITER //

CREATE TRIGGER BeforeInsertProduct
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Số lượng sản phẩm thêm mới không được nhỏ hơn 0!';
    END IF;
END //

DELIMITER ;

INSERT INTO products (productName, quantity) 
VALUES ('Tai nghe bị lỗi kho', -5);

INSERT INTO products (productName, quantity) 
VALUES ('Bàn phím mới', 20);

SELECT * FROM products;