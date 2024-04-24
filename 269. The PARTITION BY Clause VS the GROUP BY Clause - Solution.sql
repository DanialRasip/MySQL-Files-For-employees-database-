# Exercise #1:
# Find out the lowest salary value each employee has ever signed a contract for. 
# To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword.
# Also, to obtain the desired result set, refer only to data from the “salaries” table.:

SELECT
a.emp_no,
MIN(salary) AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER w AS row_num
FROM employees.salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) AS a
GROUP BY emp_no;

# Exercise #2:
# Again, find out the lowest salary value each employee has ever signed a contract for. 
# Once again, to obtain the desired output, use a subquery containing a window function. 
# This time, however, introduce the window specification in the field list of the given subquery.
# To obtain the desired result set, refer only to data from the “salaries” table.

SELECT
a.emp_no,
MIN(salary) AS max_salary FROM
(SELECT emp_no, 
salary,
ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM employees.salaries) a
GROUP BY emp_no;

# Exercise #3:
# Once again, find out the lowest salary value each employee has ever signed a contract for. 
# This time, to obtain the desired output, avoid using a window function. 
# Just use an aggregate function and a subquery.
# To obtain the desired result set, refer only to data from the “salaries” table.

SELECT 
    a.emp_no, MIN(salary) AS max_salary
FROM
    (SELECT 
        emp_no, salary
    FROM
        employees.salaries) a
GROUP BY emp_no;

# Cara untuk siapkan Task tapi yang paling normal:

SELECT 
    emp_no, MIN(salary) AS max_salary
FROM employees.salaries
GROUP BY emp_no;

SELECT 
    MIN(salary)
FROM
    employees.salaries;

# Exercise #4:
# Once more, find out the lowest salary value each employee has ever signed a contract for. 
# To obtain the desired output, use a subquery containing a window function, as well as a window specification 
# introduced with the help of the WINDOW keyword. 
# Moreover, obtain the output without using a GROUP BY clause in the outer query.
# To obtain the desired result set, refer only to data from the “salaries” table.:

SELECT
a.emp_no,
a.salary AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER w AS row_num
FROM employees.salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)) AS a
WHERE a.ROW_NUM = 1;

# Exercise #5:
# Find out the second-lowest salary value each employee has ever signed a contract for. 
# To obtain the desired output, use a subquery containing a window function, as well as a window specification 
# introduced with the help of the WINDOW keyword. 
# Moreover, obtain the desired result set without using a GROUP BY clause in the outer query.
# To obtain the desired result set, refer only to data from the “salaries” table.:

SELECT
a.emp_no,
a.salary AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER w AS row_num
FROM employees.salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)) AS a
WHERE a.ROW_NUM = 2;
