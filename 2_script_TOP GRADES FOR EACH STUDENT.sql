-- OBJECTIVE: TOP GRADES FOR EACH STUDENT
USE dev_university;

-- Final Report
SELECT 
	g.grades_student_id AS 'Student ID', 
	CONCAT(s.students_firstName, ' ', s.students_lastName) AS 'Student Full Name', 
	MAX(g.grades_score) AS 'Top Grade'
FROM grades g
JOIN courses c ON g.grades_course_id = c.courses_id
JOIN students s ON g.grades_student_id = s.students_id
GROUP BY g.grades_student_id
ORDER BY MAX(g.grades_score) DESC;

-- Basic List of Student ID's & Grades score
SELECT g.grades_student_id, g.grades_score
FROM grades g
JOIN courses c ON g.grades_course_id = c.courses_id;

-- Report All Grades for each student
SELECT 
	g.grades_student_id AS 'Student ID', 
    CONCAT(s.students_firstName, ' ', s.students_lastName) AS 'Student Full Name', 
    g.grades_score AS 'Individual Grades'
FROM grades g
JOIN courses c ON g.grades_course_id = c.courses_id
JOIN students s ON g.grades_student_id = s.students_id
ORDER BY g.grades_student_id ASC;

