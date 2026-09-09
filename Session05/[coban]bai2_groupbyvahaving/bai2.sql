use BTSsession5;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(12, 2) NOT NULL
);

INSERT INTO employees (emp_id, full_name, department, salary) VALUES
('1', 'Nguyen Van A', 'IT', 15000000),
('2', 'Tran Thi B', 'IT', 18000000),
('3', 'Le Hoang C', 'IT', 14000000),
('4', 'Pham Minh D', 'IT', 16000000),
('5', 'Vo Thi E', 'Kinh Doanh', 13000000),
('6', 'Hoang Van F', 'Kinh Doanh', 11000000),
('7', 'Dang Thi G', 'Kinh Doanh', 14000000),
('8', 'Bui Minh H', 'Kinh Doanh', 12000000),
('9', 'Ngo Van I', 'Nhan Su', 10000000),
('10', 'Do Thi K', 'Nhan Su', 9000000),
('11', 'Trinh Van L', 'Nhan Su', 11000000);

SELECT 
    department, 
    COUNT(*) AS so_luong_nhan_vien 
FROM employees
GROUP BY department;

SELECT 
    department, 
    ROUND(AVG(salary), 2) AS luong_trung_binh 
FROM employees
GROUP BY department;

SELECT 
    department, 
    COUNT(*) AS so_luong_nhan_vien 
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

SELECT 
    department, 
    ROUND(AVG(salary), 2) AS luong_trung_binh 
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;