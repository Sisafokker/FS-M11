-- OBJECTIVE: SORT STUDENTS BY ENROLLED COURSES
USE dev_university;

-- Final Report
SELECT 
	s.students_id AS 'Student ID', 
	CONCAT(s.students_firstName, ' ', s.students_lastName) AS 'Student Full Name', 
	c.courses_name AS 'Course Name'
FROM enrolstudent es
JOIN students s ON es.enrolstudent_students_id = s.students_id
JOIN courses c ON es.enrolstudent_courses_id = c.courses_id
ORDER BY c.courses_name;
