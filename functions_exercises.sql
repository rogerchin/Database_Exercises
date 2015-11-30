USE employees_db;

-- Counting genders between first name Irena, Vidya, or Maya
SELECT COUNT(*), gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
GROUP BY gender;


--Employees with E with concat first and last name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE '%e' AND last_name LIKE 'e%' 

--Number of days they have worked for employees born on xmas and hired in the 90s 
SELECT emp_no, CONCAT(first_name, ' ', last_name), datediff(curdate(), hire_date)
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'; 

