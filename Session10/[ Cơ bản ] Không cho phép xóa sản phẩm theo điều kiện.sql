USE inventorymanagement;
DELIMITER //

CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
    IF OLD.quantity > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không thể xóa sản phẩm có số lượng tồn kho lớn hơn 10!';
    END IF;
END //

DELIMITER ;


INSERT INTO products (productName, quantity) VALUES
('Sản phẩm A (Kho > 10)', 15),
('Sản phẩm B (Kho <= 10)', 5);


DELETE FROM products WHERE productName = 'Sản phẩm A (Kho > 10)';

DELETE FROM products WHERE productName = 'Sản phẩm B (Kho <= 10)';

SELECT * FROM products;