CREATE DATABASE bank;
USE bank;
CREATE TABLE accounts (
    acc_id INT PRIMARY KEY,
    acc_name VARCHAR(50),
    balance INT
);
SET autocommit = 0;
START TRANSACTION;
INSERT INTO accounts VALUES
(1, 'Ali', 50000),
(2, 'Sara', 30000);
UPDATE accounts SET balance = balance - 5000 WHERE acc_id = 1;
UPDATE accounts SET balance = balance + 5000 WHERE acc_id = 2;
SELECT * FROM accounts;
COMMIT;
SELECT * FROM accounts;
ROLLBACK;
SELECT * FROM accounts;
DELIMITER //
CREATE PROCEDURE add_account(
    IN id INT,
    IN name VARCHAR(50),
    IN bal INT
)
BEGIN
    INSERT INTO accounts VALUES (id, name, bal);
END //
DELIMITER ;
-- Call procedure to insert new record
CALL add_account(3, 'Ahmed', 20000);
select * from accounts
DELIMITER //
CREATE FUNCTION get_balance(aid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE bal INT;
    SELECT balance INTO bal FROM accounts WHERE acc_id = aid;
    RETURN bal;
END //
DELIMITER ;
SELECT get_balance(1);
SELECT get_balance(3);










