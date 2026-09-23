USE session11;
UPDATE accounts SET balance = 2000000.00 WHERE accountID = 4;
UPDATE accounts SET balance = 0.00 WHERE accountID = 5;

DELIMITER //

CREATE PROCEDURE transfer_money(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(15, 2)
)
BEGIN

    DECLARE v_sender_balance DECIMAL(15, 2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Giao dịch thất bại: Đã xảy ra lỗi hệ thống, giao dịch đã được ROLLBACK!' AS message;
    END;

    START TRANSACTION;

 
    SELECT balance INTO v_sender_balance 
    FROM accounts 
    WHERE accountID = p_sender_id;

    IF v_sender_balance IS NULL THEN
        ROLLBACK;
        SELECT 'Giao dịch thất bại: Tài khoản người gửi không tồn tại!' AS message;

    ELSEIF v_sender_balance < p_amount THEN
        ROLLBACK;
        SELECT 'Giao dịch thất bại: Số dư tài khoản người gửi không đủ!' AS message;

    ELSE
        UPDATE accounts 
        SET balance = balance - p_amount 
        WHERE accountID = p_sender_id;

        UPDATE accounts 
        SET balance = balance + p_amount 
        WHERE accountID = p_receiver_id;

        COMMIT;
        SELECT 'Chuyển tiền thành công!' AS message;
    END IF;

END //

DELIMITER ;

SELECT accountID, balance FROM accounts WHERE accountID IN (4, 5);

CALL transfer_money(4, 5, 300000.00);

SELECT accountID, balance FROM accounts WHERE accountID IN (4, 5);