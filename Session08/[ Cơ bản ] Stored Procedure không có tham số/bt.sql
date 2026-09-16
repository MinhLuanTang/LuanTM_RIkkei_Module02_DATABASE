CREATE PROCEDURE sp_get_all_students()
SELECT student_id, full_name, class_name FROM students;
CALL sp_get_all_students();