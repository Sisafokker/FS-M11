-- OBJECTIVE: AVERAGE GRADES BY PROFESSOR
USE dev_university;

-- Final Report
SELECT 
	p.professors_id AS 'Professor ID', 
	CONCAT(p.professors_firstName, ' ', p.professors_lastName) AS 'Professor Full Name',  
	AVG(g.grades_score) AS 'Average Grade'
FROM enrolprofessor ep
JOIN professors p ON ep.enrolprofessor_professors_id = p.professors_id
JOIN grades g ON ep.enrolprofessor_courses_id = g.grades_course_id
GROUP BY p.professors_id;

-- List of all Grades given by each professor
SELECT 
	p.professors_id AS 'Professor ID', 
	CONCAT(p.professors_firstName, ' ', p.professors_lastName) AS 'Professor Name',  
	g.grades_score AS 'Individual Grades'
FROM enrolprofessor ep
JOIN professors p ON ep.enrolprofessor_professors_id = p.professors_id
JOIN grades g ON ep.enrolprofessor_courses_id = g.grades_course_id;

