USE employees_db;

--employees with the same hire date as employee 101010 using a sub-query
SELECT CONCAT(first_name, ' ',last_name) AS 'Name', hire_date AS 'Hire Date'
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);

--Find all the titles held by all employees with the first name Aamod
SELECT title AS 'Title'
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
);

--Find all the department managers were are Female
SELECT CONCAT(first_name, ' ', last_name) AS 'Female Managers'
FROM employees
WHERE gender = 'F' AND emp_no IN (
	SELECT emp_no
	FROM dept_manager
);

--Find all the department names that have Female managers
SELECT dept_name AS 'Department Names'
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN(
		SELECT emp_no
		FROM employees
		WHERE gender = 'F'
));