# Complete Solution untuk video no.273:

SELECT
t3.dept_no,
t3.dept_name,
t1.emp_no,
RANK() OVER w AS department_salary_ranking,
t2.salary,
t2.from_date AS salary_from_date,
t2.to_date AS salary_to_date,
t1.from_date AS dept_manager_from_date,
t1.to_date AS dept_manager_to_date
FROM 
employees.dept_manager t1
JOIN
employees.salaries t2 ON t2.emp_no = t1.emp_no
AND t2.from_date BETWEEN t1.from_date AND t1.to_date
AND t2.to_date BETWEEN t1.from_date AND t1.to_date
JOIN
employees.departments t3 ON t3.dept_no = t1.dept_no
WINDOW w AS (PARTITION BY t1.dept_no ORDER BY salary DESC);