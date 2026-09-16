DELIMITER //

CREATE PROCEDURE sp_get_avg_salary()
BEGIN
    DECLARE v_avg_salary DECIMAL(10,2);

    SELECT AVG(salary) INTO v_avg_salary 
    FROM employees;

    SELECT v_avg_salary AS luong_trung_binh;
END //

DELIMITER ;

CALL sp_get_avg_salary();