# Datasets 2 in CTE & Final Solution (Method 3):

WITH cte_DS2 AS (SELECT AVG(salary) AS Average_Salary FROM employees.salaries)
SELECT
SUM(CASE WHEN s.salary > c.Average_Salary THEN 1 ELSE 0 END) AS no_female_salaries_above_average_w_sum,
COUNT(CASE WHEN s.salary > c.Average_Salary THEN s.salary ELSE NULL END) AS no_female_salaries_above_average_w_count,
COUNT(s.salary) AS total_of_salary_contracts
FROM
employees.salaries s
INNER JOIN
employees.employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
CROSS JOIN
cte_DS2 c;