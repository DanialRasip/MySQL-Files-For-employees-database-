# Question 1:
# Find the average salary of the male and female employees in each department.

USE employees;
SELECT
e.gender, d.dept_name, d.dept_no, AVG(s.salary) AS Average_Salary
FROM
employees e 
JOIN
salaries s ON e.emp_no = s.emp_no
JOIN
dept_emp de ON e.emp_no = de.emp_no
JOIN
departments d ON de.dept_no = d.dept_no
GROUP BY 
e.gender, d.dept_name
ORDER BY
d.dept_no; 

# Question 2:
# Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.

SELECT 
MIN(dept_no) AS Lowest_Dept_No,
MAX(dept_no) AS Highest_Dept_No
FROM
employees.dept_emp;

# Question 3:

# Obtain a table containing the following three fields for all individuals whose employee number is not
# greater than 10040:
# - employee number
# - the lowest department number among the departments where the employee has worked in (Hint: use
# a subquery to retrieve this value from the 'dept_emp' table)
# - assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020,
# and '110039' to those whose number is between 10021 and 10040 inclusive.
# Use a CASE statement to create the third field. 

SELECT 
emp_no, MIN(dept_no)
FROM employees.dept_emp
GROUP BY emp_no
ORDER BY emp_no;

SELECT
emp_no,
(SELECT
MIN(dept_no)
FROM
dept_emp de
WHERE
e.emp_no = de.emp_no) AS lowest_dept_no,
CASE WHEN emp_no <= 10020 THEN 10022
ELSE 10039
END AS Manager_ID
FROM
employees.employees e
WHERE emp_no <= 10040
GROUP BY emp_no;

# Question 4:
# Retrieve a list of all employees that have been hired in 2000

SELECT * FROM employees.employees 
WHERE YEAR(hire_date) = 2000; 

# Question 5:
# Retrieve a list of all employees from the ‘titles’ table who are engineers.
# Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior engineers.
# After LIKE, you could indicate what you are looking for with or without using parentheses. Both options are
# correct and will deliver the same output. We think using parentheses is better for legibility and that’s why
# it is the first option we’ve suggested. 

# Dalam table titles, ada banyak job position engineer (Senior, Engineer, Assistant)
# Kena gunakan LIKE & NOT LIKE supaya mudah kerja kita

SELECT 
title
FROM 
employees.titles
GROUP BY title
ORDER BY title;

SELECT 
*
FROM 
employees.titles
WHERE title = 'Engineer' OR title = 'Senior Engineer' OR title = 'Assistant Engineer';

SELECT 
    *
FROM
    employees.titles
WHERE
    title LIKE('%Engineer%');
    
SELECT 
    *
FROM
    employees.titles
WHERE
    title LIKE('%Senior Engineer%');








