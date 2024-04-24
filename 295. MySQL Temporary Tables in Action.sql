# Contoh Referring to Common Table Expressions in a WITH Clause:

# DS1:

SELECT 
emp_no, MAX(salary)
FROM 
employees.salaries
GROUP BY emp_no;

# DS2:

SELECT 
*
FROM 
employees.employees
WHERE hire_date > '2000-01-01';

# Gabungkan DS1 & DS2 dalam CTE & JOIN:

USE employees;
WITH emp_hired_after_jan_2000 AS (
SELECT * FROM employees.employees WHERE hire_date > '2000-01-01'),
highest_contract_salary_values AS (
SELECT e.emp_no, MAX(s.salary) FROM employees.salaries s JOIN emp_hired_after_jan_2000 e ON e.emp_no = s.emp_no 
GROUP BY e.emp_no)
SELECT * FROM highest_contract_salary_values;

USE employees;
WITH highest_contract_salary_values AS (
SELECT e.emp_no, MAX(s.salary) FROM employees.salaries s JOIN (
SELECT * FROM employees.employees WHERE hire_date > '2000-01-01') e ON e.emp_no = s.emp_no 
GROUP BY e.emp_no)
SELECT * FROM highest_contract_salary_values;

USE employees;
SELECT
e.emp_no, MAX(s.salary)
FROM 
employees e
JOIN
salaries s ON e.emp_no = s.emp_no AND e.hire_date > '2000-01-01'
GROUP BY e.emp_no;