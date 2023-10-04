-- OBJECTIVE: STUDENT AND PROFESOR WITH MOST COURSES IN COMMON
USE dev_university;

-- Final Report.
SELECT 
	CONCAT(s.students_firstName, ' ', s.students_lastName) AS 'Student', 
	CONCAT(p.professors_firstName, ' ', p.professors_lastName) AS 'Professor', 
	COUNT(DISTINCT es.enrolstudent_courses_id) AS 'Qty Courses In Common'
FROM enrolstudent es
JOIN enrolprofessor ep ON es.enrolstudent_courses_id = ep.enrolprofessor_courses_id
JOIN students s ON es.enrolstudent_students_id = s.students_id
JOIN professors p ON ep.enrolprofessor_professors_id = p.professors_id
GROUP BY es.enrolstudent_students_id, ep.enrolprofessor_professors_id
ORDER BY COUNT(DISTINCT es.enrolstudent_courses_id) DESC
LIMIT 1;
