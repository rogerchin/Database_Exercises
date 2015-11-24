USE employees_db;

-- Using limit to find the first 10 distinct last names starting with Z
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name LIKE 'Z%'
LIMIT 10;

-- first 5 employees born on xmas with descending hire date and descending birth date
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%' ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 ;


-- batch for 10th set
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%' ORDER BY birth_date ASC, hire_date DESC
LIMIT 5 OFFSET 45 ;