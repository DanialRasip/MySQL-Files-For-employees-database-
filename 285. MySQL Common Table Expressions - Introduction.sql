# Contoh penggunaan CTE dalam SQL:

# Datasets 1:

SELECT e.emp_no, s.salary
FROM 
employees.employees e
INNER JOIN
employees.salaries s ON e.emp_no = s.emp_no
WHERE e.gender = 'F'
ORDER BY e.emp_no;

# Atau

SELECT e.emp_no, s.salary
FROM 
employees.employees e
INNER JOIN
employees.salaries s ON e.emp_no = s.emp_no AND e.gender = 'F'
ORDER BY e.emp_no;

# Datasets 2:

SELECT 
AVG(salary) AS Average_Salary
FROM
employees.salaries;

# Datasets 2 in CTE & Final Solution (Method 1):

WITH cte_DS2 AS (SELECT AVG(salary) AS Average_Salary FROM employees.salaries)
SELECT
SUM(CASE WHEN s.salary > c.Average_Salary THEN 1 ELSE 0 END) AS no_female_salaries_above_average,
COUNT(s.salary) AS total_of_salary_contracts
FROM
employees.salaries s
INNER JOIN
employees.employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
CROSS JOIN
cte_DS2 c;

# Datasets 2 in CTE & Final Solution (Method 2):

SELECT
SUM(CASE WHEN s.salary > c.Average_Salary THEN 1 ELSE 0 END) AS no_female_salaries_above_average,
COUNT(s.salary) AS total_of_salary_contracts
FROM
employees.salaries s
INNER JOIN
employees.employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
CROSS JOIN
(SELECT AVG(salary) AS Average_Salary FROM employees.salaries) c;

# Untuk pastikan yang CTE kita berfungsi dengan betul:

WITH cte_DS2 AS (SELECT AVG(salary) AS Average_Salary FROM employees.salaries)
SELECT * FROM cte_DS2;

WITH cte_DS2 AS (SELECT AVG(t1.salary) AS Average_Salary, t2.dept_no FROM employees.salaries t1
INNER JOIN
employees.dept_emp t2 ON t1.emp_no = t2.emp_no
GROUP BY t2.dept_no)
SELECT * FROM cte_DS2;