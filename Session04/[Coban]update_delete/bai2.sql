-- Tiếp tục làm việc với bảng students ở bài tập 1 trước đó --
use BAITAPSESSION4;
UPDATE students 
SET email = 'updateroine@gmail.com' 
WHERE email IS NULL;

SELECT * FROM students;

UPDATE students 
SET gender = 'Nam' 
WHERE student_id = 'SV005';

SELECT * FROM students;


DELETE FROM students 
WHERE student_id = 'SV003';

SELECT * FROM students;