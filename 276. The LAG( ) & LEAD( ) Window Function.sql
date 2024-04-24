# Contoh LAG( ) & LEAD( ) WF:

SELECT
emp_no,
salary,
LAG(salary) OVER() AS previous_salary,
LEAD(salary) OVER() AS next_salary,
salary - LAG(salary) OVER() AS diff_current_previous_salary,
LEAD(salary) OVER() - salary AS diff_next_current_salary
FROM
employees.salaries
WHERE emp_no = 10001;

# Contoh 2 LAG( ) & LEAD( ) WF:

SELECT
emp_no,
salary,
LAG(salary) OVER(w) AS previous_salary,
LEAD(salary) OVER(w) AS next_salary,
salary - LAG(salary) OVER(w) AS diff_current_previous_salary,
LEAD(salary) OVER(w) - salary AS diff_next_current_salary
FROM
employees.salaries
WHERE emp_no = 10001
WINDOW w AS (ORDER BY salary ASC);