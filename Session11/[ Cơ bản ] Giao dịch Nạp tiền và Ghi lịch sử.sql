USE session11;
DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    log_message VARCHAR(255) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(accountID)
);

DELIMITER //

CREATE PROCEDURE deposit_with_logging(
    IN p_account_id INT,
    IN p_amount DECIMAL(15, 2)
)
BEGIN
 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Giao dịch thất bại: Đã xảy ra lỗi, hệ thống đã hoàn tác (ROLLBACK)' AS message;
    END;


    START TRANSACTION;

    UPDATE accounts 
    SET balance = balance + p_amount 
    WHERE accountID = p_account_id;

    INSERT INTO transactions (account_id, amount, log_message) 
    VALUES (p_account_id, p_amount, 'Nạp tiền vào tài khoản');


    COMMIT;
    SELECT 'Nạp tiền thành công!' AS message;

END //

DELIMITER ;

SELECT accountID, balance AS balance_before FROM accounts WHERE accountID = 3;

CALL deposit_with_logging(3, 1000000.00);

SELECT accountID, balance AS balance_after FROM accounts WHERE accountID = 3;


SELECT * FROM transactions WHERE account_id = 3;