USE employees_db;
-- All employees with first name Irena, Vidya, and Maya
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name OR ('Irena', 'Vidya', 'Maya');

-- all employees whose name starts with E
SELECT emp_no, first_name
FROM employees
WHERE first_name LIKE 'E%';

-- all employees born in the 90s
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- all employees born on christmas
SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';

-- all employees with q in the last name
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%';


-- Using AND and OR
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- Using AND and OR; Employees whose first name are 'Irena', 'Vidya', and 'Maya' and also male
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

-- Employees whose last name start with E or end with E
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e' OR last_name LIKE 'e%';

-- Employees name who start and end with e
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e' AND last_name LIKE 'e%';

-- Employees who were hired in the 90s and have their birthday on xmas.
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- Last name with q but not qu
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

--Order by ascending first name
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') ORDER BY first_name ASC;

--Order first name ascending and chaining last name to ascending
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') ORDER BY first_name ASC, last_name ASC;

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') ORDER BY last_name ASC, first_name ASC;

--Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
SELECT emp_no, first_name, last_name
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') ORDER BY last_name ASC, first_name ASC;

--Employees with E with emp_no ascending by employee number
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%e' AND last_name LIKE 'e%' ORDER BY emp_no ASC;

--Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' ORDER BY hire_date DESC, birth_date DESC;

