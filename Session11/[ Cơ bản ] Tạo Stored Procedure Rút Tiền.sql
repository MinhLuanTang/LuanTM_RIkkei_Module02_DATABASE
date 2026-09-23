USE session11;

DELIMITER //

CREATE PROCEDURE withdraw_money(
    IN p_account_id INT,
    IN p_amount DECIMAL(15, 2)
)
BEGIN
    DECLARE current_balance DECIMAL(15, 2);

    START TRANSACTION;

    UPDATE accounts 
    SET balance = balance - p_amount 
    WHERE accountID = p_account_id;

    SELECT balance INTO current_balance 
    FROM accounts 
    WHERE accountID = p_account_id;

    IF current_balance < 0 THEN
        ROLLBACK;
        SELECT 'Số dư không đủ' AS message;
    ELSE
        COMMIT;
        SELECT 'Rút tiền thành công' AS message;
    END IF;
END //

DELIMITER ;

SELECT accountID, balance AS balance_before FROM accounts WHERE accountID = 2;

CALL withdraw_money(2, 15000000.00);

SELECT accountID, balance AS balance_after_test1 FROM accounts WHERE accountID = 2;

CALL withdraw_money(2, 3000000.00);
SELECT accountID, balance AS balance_after_test2 FROM accounts WHERE accountID = 2;