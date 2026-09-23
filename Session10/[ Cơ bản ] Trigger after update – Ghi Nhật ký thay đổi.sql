CREATE DATABASE SESSION10;
USE SESSION10;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

INSERT INTO employees (first_name, last_name, salary, email, phone_number) VALUES
('An', 'Nguyen Van', 15000000.00, 'an.nguyen@email.com', '0901234561'),
('Binh', 'Tran Thi', 18000000.00, 'binh.tran@email.com', '0901234562'),
('Cuong', 'Le Hoang', 12000000.00, 'cuong.le@email.com', '0901234563'),
('Dung', 'Pham Minh', 20000000.00, 'dung.pham@email.com', '0901234564'),
('Em', 'Hoang Thi', 16500000.00, 'em.hoang@email.com', '0901234565'),
('Giang', 'Phan Vo', 25000000.00, 'giang.phan@email.com', '0901234566'),
('Hanh', 'Doan Duc', 14000000.00, 'hanh.doan@email.com', '0901234567'),
('Khoa', 'Vu Huy', 22000000.00, 'khoa.vu@email.com', '0901234568'),
('Lam', 'Bui Thanh', 19000000.00, 'lam.bui@email.com', '0901234569'),
('Mai', 'Trinh Tu', 17500000.00, 'mai.trinh@email.com', '0901234570');

DELIMITER //

CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log (employee_id, old_salary, new_salary, change_date)
        VALUES (NEW.id, OLD.salary, NEW.salary, NOW());
    END IF;
END //

DELIMITER ;


SELECT id, first_name, last_name, salary FROM employees;

UPDATE employees 
SET salary = 18000000.00 
WHERE id = 1;

UPDATE employees 
SET salary = 14500000.00 
WHERE id = 3;

UPDATE employees 
SET phone_number = '0999999999' 
WHERE id = 2;

SELECT * FROM salary_log;