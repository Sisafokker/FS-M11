-- OBJECTIVE: AVERAGE GRADE BY COURSE
USE dev_university;

-- Final Report.
SELECT 
	c.courses_id AS 'Course ID', 
	c.courses_name AS 'Course Name', 
	AVG(g.grades_score) AS 'Average Grade'
FROM courses c
LEFT JOIN grades g ON c.courses_id = g.grades_course_id
GROUP BY c.courses_id, c.courses_name
ORDER BY AVG(g.grades_score) ASC;


-- Final Report (as long as everyone has grades applied).
SELECT 
	c.courses_id AS 'Course ID', 
	c.courses_name AS 'Course Name', 
	AVG(g.grades_score) AS 'Average Grade'
FROM courses c
JOIN grades g ON c.courses_id = g.grades_course_id
GROUP BY c.courses_id, c.courses_name
ORDER BY AVG(g.grades_score) ASC;