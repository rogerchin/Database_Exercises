USE join_test_db;

--Find the name of all departments currently managed by women

SELECT CONCAT(e.first_name, ' ',e.last_name) AS 'Manager', d.dept_name AS 'Department Name'
FROM employees as e
JOIN dept_manager as dm ON dm.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = dm.dept_no
WHERE gender = 'F' AND dm.to_date > now() AND dm.from_date <= now();

--Find the current titles of employees currently working in the Customer Service Department

SELECT t.title AS 'Title', COUNT(e.emp_no) AS 'Count'
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE de.to_date > NOW()
AND t.to_date > NOW()
AND d.dept_name = 'Customer Service'
GROUP BY t.title;

-- Finds the current salary of all the current managers
SELECT d.dept_name AS 'Department Name' , CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM employees AS e
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
JOIN salaries AS s ON s.emp_no = e.emp_no
WHERE s.to_date > now() AND s.from_date <= now() AND dm.to_date > now() AND dm.from_date <=now() GROUP BY(e.first_name);

--Find the names of all current employees, their department name, and their current manager's name. 240,124 Rows.

--wrong way
SELECT
	FirstSet.Name,
	FirstSet.Department,
	SecondSet.Manager
FROM(
	SELECT CONCAT(e.first_name, ' ', e.last_name) AS Name, d.dept_name AS Department, d.dept_no AS number 
	FROM employees AS e
	JOIN dept_emp AS de ON de.emp_no = e.emp_no
	JOIN departments AS d ON d.dept_no = de.dept_no
	WHERE de.to_date > now() AND de.from_date <= now() GROUP BY(e.first_name)
) AS FirstSet
INNER JOIN (
	SELECT CONCAT(e.first_name, ' ', e.last_name) AS Manager, d.dept_no as number
	FROM employees AS e
	JOIN dept_emp AS de ON de.emp_no = e.emp_no
	JOIN dept_manager AS dm ON dm.emp_no = de.emp_no
	JOIN departments AS d ON d.dept_no = dm.dept_no
) AS SecondSet 
ON FirstSet.number = SecondSet.number;

--right way
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Name', d.dept_name AS 'Department', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager'
FROM employees as e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS managers ON dm.emp_no = managers.emp_no
WHERE de.to_date > NOW()
AND dm.to_date > NOW();