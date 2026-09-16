DELIMITER //

CREATE PROCEDURE sp_check_order_value(IN p_total_amount DECIMAL(15,2))
BEGIN

    IF p_total_amount >= 5000000 THEN
        SELECT 'Đơn hàng giá trị cao' AS thong_bao;
    ELSE
        SELECT 'Đơn hàng bình thường' AS thong_bao;
    END IF;
END //

DELIMITER ;

CALL sp_check_order_value(6500000);
CALL sp_check_order_value(2000000); 