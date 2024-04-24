# Exercise #1:
# Store the highest contract salary values of all male employees in a temporary table called male_max_salaries:

# DS1:

SELECT 
emp_no, MAX(salary)
FROM 
employees.salaries
GROUP BY emp_no;

# DS2:

SELECT 
*
FROM 
employees.employees
WHERE gender = 'M';

CREATE TEMPORARY TABLE male_max_salaries
WITH emp_no_male AS (
SELECT * FROM employees.employees WHERE gender = 'M'),
highest_contract_salary_values AS (
SELECT e.emp_no, MAX(s.salary) FROM employees.salaries s JOIN emp_no_male e ON e.emp_no = s.emp_no 
GROUP BY e.emp_no
ORDER BY e.emp_no)
SELECT * FROM highest_contract_salary_values;

# Solution #1:

CREATE TEMPORARY TABLE male_max_salaries
SELECT
    s.emp_no, MAX(s.salary)
FROM
    employees.salaries s
        JOIN
    employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;

# Exercise 2:
# Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries 
# temporary table you created in the previous exercise:

SELECT * FROM male_max_salaries;
