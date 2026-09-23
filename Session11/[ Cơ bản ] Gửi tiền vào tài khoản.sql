CREATE DATABASE SESSION11;
USE SESSION11;
CREATE TABLE accounts (
    accountID INT AUTO_INCREMENT PRIMARY KEY,
    balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00
);

CREATE TABLE transactions (
    transactionID INT AUTO_INCREMENT PRIMARY KEY,
    fromAccountID INT NOT NULL,
    toAccountID INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fromAccountID) REFERENCES accounts(accountID),
    FOREIGN KEY (toAccountID) REFERENCES accounts(accountID)
);

INSERT INTO accounts (balance) VALUES
(5000000.00),
(10000000.00),
(2500000.00),
(12000000.00),
(7500000.00),
(3000000.00),
(15000000.00),
(800000.00),
(4200000.00),
(9000000.00);
SELECT * FROM ACCOUNTS;

SELECT accountID, balance AS balance_before 
FROM accounts 
WHERE accountID = 1;


START TRANSACTION;


UPDATE accounts 
SET balance = balance + 1000000.00 
WHERE accountID = 1;


COMMIT;

SELECT accountID, balance AS balance_after 
FROM accounts 
WHERE accountID = 1;