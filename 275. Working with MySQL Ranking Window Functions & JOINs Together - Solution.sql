# Exercise #1:
# Write a query that ranks the salary values in descending order of all contracts signed by employees 
# numbered between 10500 and 10600 inclusive. 
# Let equal salary values for one and the same employee bear the same rank. 
# Also, allow gaps in the ranks obtained for their subsequent rows.
# Use a join on the “employees” and “salaries” tables to obtain the desired result.

SELECT
t1.emp_no,
t2.salary,
RANK() OVER w AS employees_salary_ranking
FROM 
employees.employees t1
JOIN
employees.salaries t2 ON t2.emp_no = t1.emp_no
AND t1.emp_no >= 10500 
AND t1.emp_no <= 10600
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Jawapan daripada Solution:

SELECT
    e.emp_no,
    RANK() OVER w as employee_salary_ranking,
    s.salary
FROM
employees.employees e
JOIN
    employees.salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

# Exercise #2:
# Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:
# - contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
# - contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
# In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.
# Use a join on the “employees” and “salaries” tables to obtain the desired result.

SELECT
t1.emp_no,
t2.salary,
DENSE_RANK() OVER w AS employees_salary_ranking,
t1.hire_date,
t2.from_date,
(YEAR(t2.from_date) - YEAR(t1.hire_date)) AS years_from_start
FROM 
employees.employees t1
JOIN
employees.salaries t2 ON t2.emp_no = t1.emp_no
AND t1.emp_no >= 10500 
AND t1.emp_no <= 10600
AND (YEAR(t2.from_date) - YEAR(t1.hire_date)) >= 5
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);