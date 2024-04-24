# DS 1 (Normal + CTE):

SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries;

# DS 2 (Normal + CTE):

SELECT 
e.emp_no, MAX(s.salary) AS Highest_Salary
FROM
employees.salaries s 
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY emp_no
ORDER BY emp_no;

# DS 2, Ver. 2 (Normal + CTE):

SELECT 
e.emp_no, MAX(s.salary) AS Highest_Salary
FROM
employees.salaries s 
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no
WHERE e.gender = 'F'
GROUP BY emp_no
ORDER BY emp_no;

WITH CTE1 AS (SELECT 
e.emp_no, MAX(s.salary) AS Highest_Salary
FROM
employees.salaries s 
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY emp_no
ORDER BY emp_no)
SELECT emp_no FROM CTE1;

# Contoh penggunaan multiple SC dalam CTE:

WITH cte1 AS (
SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries),
cte2 AS (
SELECT 
e.emp_no, MAX(s.salary) AS Female_Highest_Salary
FROM
employees.salaries s 
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY emp_no
ORDER BY emp_no)
SELECT 
SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END) AS Female_Highest_Salary_w_Sum,
COUNT(e.emp_no) AS total_number_of_female_employees
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Version 2):

WITH cte1 AS (
SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries),
cte2 AS (
SELECT 
e.emp_no, MAX(s.salary) AS Female_Highest_Salary
FROM
employees.salaries s 
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no)
SELECT 
SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END) AS Female_Highest_Salary_w_Sum,
COUNT(e.emp_no) AS total_number_of_female_employees
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1
WHERE e.gender = 'F';