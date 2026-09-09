-- vẫn xài dữ liệu ở bài 1 --
USE BAITAPSESSION4;
SELECT student_id, full_name, birth_date 
FROM students 
WHERE YEAR(birth_date) BETWEEN 2003 AND 2005;

SELECT student_id, full_name, birth_date 
FROM students 
WHERE gender IN ('Nam', 'Nu');

SELECT student_id, full_name, birth_date 
FROM students 
WHERE student_id IN ('SV001', 'SV004', 'SV005');