# Exercise #1:
# Write a query containing a window function to obtain all salary values that employee number 10560 has 
# ever signed a contract for.
# Order and display the obtained salary values from highest to lowest.:

SELECT
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM 
employees.salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Exercise #2:
# Write a query that upon execution, displays the number of salary contracts that 
# each manager has ever signed while working in the company.

SELECT 
    t1.emp_no, COUNT(salary) AS no_of_salary_contract
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
GROUP BY emp_no;

# Exercise #3:
# Write a query that upon execution retrieves a result set containing all salary values that employee 
# 10560 has ever signed a contract for. 
# Use a window function to rank all salary values from highest to lowest in a way that 
# equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.

SELECT
emp_no,
salary,
RANK() OVER w AS rank_num
FROM 
employees.salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Exercise #4:
# Write a query that upon execution retrieves a result set containing all salary values that employee 10560 
# has ever signed a contract for. 
# Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear 
# the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.

SELECT 
emp_no,
salary,
DENSE_RANK() OVER w AS dense_rank_num
FROM 
employees.salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);