# Final Answer (Method 2):

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
COUNT(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN c2.Female_Highest_Salary ELSE NULL END) AS Female_Highest_Salary_w_Sum,
COUNT(e.emp_no) AS total_number_of_female_employees
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Percentage of c2 compared to c1):

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
COUNT(e.emp_no) AS total_number_of_female_employees,
((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(e.emp_no))*100
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Improvement of Percentage of c2 compared to c1):

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
COUNT(e.emp_no) AS total_number_of_female_employees,
ROUND(((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(e.emp_no))*100,2)
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Improvement no.2 of Percentage of c2 compared to c1):

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
COUNT(e.emp_no) AS total_number_of_female_employees,
CONCAT(ROUND(((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(e.emp_no))*100,2), '%')
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Improvement no.3 of Percentage of c2 compared to c1):

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
COUNT(e.emp_no) AS total_number_of_female_employees,
CONCAT(ROUND(((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(e.emp_no))*100,2), '%') AS '% Percentage'
FROM employees.employees e
INNER JOIN cte2 c2 ON c2.emp_no = e.emp_no
CROSS JOIN cte1 c1;

# Final Answer (Improvement no.4 of Percentage of c2 compared to c1):

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
COUNT(c2.emp_no) AS total_number_of_female_employees,
CONCAT(ROUND(((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(c2.emp_no))*100,2), '%') AS '% Percentage'
FROM cte2 c2 
CROSS JOIN cte1 c1;

# Final Answer (Improvement no.4 of Percentage of c2 compared to c1):

WITH cte_avg_salary AS (
SELECT 
AVG(salary) as Average_Salary
FROM
employees.salaries),
cte_female_highest_salary AS (
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
COUNT(c2.emp_no) AS total_number_of_female_employees,
CONCAT(ROUND(((SUM(CASE WHEN c2.Female_Highest_Salary > c1.Average_Salary THEN 1 ELSE 0 END))/COUNT(c2.emp_no))*100,2), '%') AS '% Percentage'
FROM cte_female_highest_salary c2 
CROSS JOIN cte_avg_salary c1;