# Exercise #1:
# Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number of 
# male employees whose highest salaries have been below the all-time average:

WITH cte_avg_salary AS (
SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries),
cte_male_highest_salary AS (
SELECT 
e.emp_no, MAX(s.salary) AS Male_Highest_Salary
FROM
employees.salaries s
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY emp_no
ORDER BY emp_no)
SELECT 
SUM(CASE WHEN c2.Male_Highest_Salary < c1.Average_Salary THEN 1 ELSE 0 END) AS Male_Highest_Salary__Below_Average,
COUNT(e.emp_no) AS total_number_of_male_employees
FROM employees.employees e
INNER JOIN cte_male_highest_salary c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte_avg_salary c1;

# Jawapan daripada Solution:

USE employees;
WITH cte1 AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no
)
SELECT
SUM(CASE WHEN c2.max_salary < c1.avg_salary THEN 1 ELSE 0 END) AS highest_salaries_below_avg
FROM employees e
JOIN cte2 c2 ON c2.emp_no = e.emp_no
JOIN cte1 c1;

# Exercise #2:
# Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of 
# male employees whose highest salaries have been below the all-time average:

WITH cte_avg_salary AS (
SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries),
cte_male_highest_salary AS (
SELECT 
e.emp_no, MAX(s.salary) AS Male_Highest_Salary
FROM
employees.salaries s
INNER JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY emp_no
ORDER BY emp_no)
SELECT 
COUNT(CASE WHEN c2.Male_Highest_Salary < c1.Average_Salary THEN c2.Male_Highest_Salary ELSE NULL END) AS Male_Highest_Salary__Below_Average,
COUNT(e.emp_no) AS total_number_of_male_employees
FROM employees.employees e
INNER JOIN cte_male_highest_salary c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte_avg_salary c1;

# Jawapan daripada Solution:

USE employees;
WITH cte_avg_salary AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS (
SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no
)
SELECT
COUNT(CASE WHEN c2.max_salary < c1.avg_salary THEN c2.max_salary ELSE NULL END) AS max_salary
FROM employees e
JOIN cte_m_highest_salary c2 ON c2.emp_no = e.emp_no
JOIN cte_avg_salary c1;

# Exercise #3:
# Does the result from the previous exercise change if you used the Common Table Expression (CTE) for the male 
# employees' highest salaries in a FROM clause, as opposed to in a join?

USE employees;
WITH cte_avg_salary AS (
SELECT AVG(salary) AS avg_salary FROM salaries
),
cte_m_highest_salary AS (
SELECT s.emp_no, MAX(s.salary) AS max_salary
FROM salaries s JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no
)
SELECT
COUNT(CASE WHEN c2.max_salary < c1.avg_salary THEN c2.max_salary ELSE NULL END) AS max_salary
FROM cte_m_highest_salary c2
JOIN cte_avg_salary c1;


