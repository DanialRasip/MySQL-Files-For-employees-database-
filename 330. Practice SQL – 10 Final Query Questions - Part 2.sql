# Question 6:
# Create a procedure that asks you to insert an employee number and that will obtain an output containing
# the same number, as well as the number and name of the last department the employee has worked in.
# Finally, call the procedure for employee number 10010.
# If you've worked correctly, you should see that employee number 10010 has worked for department
# number 6 - "Quality Management"

USE employees;
SELECT
e.emp_no,
de.dept_no,
d.dept_name
FROM
employees e 
JOIN 
dept_emp de ON e.emp_no = de.emp_no
JOIN
departments d ON de.dept_no = d.dept_no
WHERE de.from_date = (SELECT MAX(from_date) FROM dept_emp de WHERE de.emp_no = e.emp_no)
GROUP BY 
e.emp_no, d.dept_name;

DROP PROCEDURE IF EXISTS employees.emp_info;
DELIMITER $$
CREATE PROCEDURE employees.emp_info(IN p_emp_no INT)
BEGIN
SELECT
e.emp_no, de.dept_no, d.dept_name
FROM
employees.employees e 
JOIN 
employees.dept_emp de ON e.emp_no = de.emp_no
JOIN
employees.departments d ON de.dept_no = d.dept_no
WHERE e.emp_no = p_emp_no AND de.from_date = (SELECT MAX(from_date) FROM dept_emp de WHERE de.emp_no = e.emp_no)
GROUP BY 
e.emp_no, d.dept_name;
END $$
DELIMITER ;

CALL employees.emp_info(10010);

# Question 7:
# How many contracts have been registered in the ‘salaries’ table with duration of more than one year and
# of value higher than or equal to $100,000?
# Hint: You may wish to compare the difference between the start and end date of the salaries contracts.

SELECT 
COUNT(salary)
FROM
employees.salaries
WHERE 
DATEDIFF(to_date, from_date) > 365 AND salary >= 100000;

# Question 8:
# Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the
# hire date to equal the current date. Format the output appropriately (YY-mm-dd).
# Extra challenge: You can try to declare a new variable called 'today' which stores today's data, and then
# use it in your trigger!
# After creating the trigger, execute the following code to see if it's working properly. 

#999905

SELECT * FROM employees.employees ORDER BY emp_no DESC;

DELIMITER $$
CREATE TRIGGER employees.before_employees_insert
BEFORE INSERT ON employees.employees
FOR EACH ROW
BEGIN
IF NEW.hire_date > (SELECT CURDATE())
THEN 
SET NEW.hire_date = CURDATE();
END IF;
END $$

INSERT employees.employees VALUES ('999905', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

# Question 9:
#Define a function that retrieves the largest contract salary value of an employee. Apply it to employee
# number 11356.
# In addition, what is the lowest contract salary value of the same employee? You may want to create a new
# function that to obtain the result. 

SELECT * FROM employees.salaries;

SELECT emp_no, MAX(salary) AS highest_salary FROM employees.salaries
GROUP BY emp_no
HAVING emp_no = 11356;

SELECT emp_no, MIN(salary) AS lowest_salary FROM employees.salaries
GROUP BY emp_no
HAVING emp_no = 11356;

DROP FUNCTION IF EXISTS employees.f_emp_highest_salary;
DELIMITER $$
CREATE FUNCTION employees.f_emp_highest_salary(p_emp_no INT) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
DECLARE v_highest_salary DECIMAL (10,2);
SELECT 
    MAX(salary)
INTO 
v_highest_salary
FROM
    employees.salaries s 
WHERE s.emp_no = p_emp_no;
RETURN v_highest_salary;
END $$
DELIMITER ;

SELECT f_emp_highest_salary(11356);

DROP FUNCTION IF EXISTS employees.f_emp_lowest_salary;
DELIMITER $$
CREATE FUNCTION employees.f_emp_lowest_salary(p_emp_no INT) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
DECLARE v_lowest_salary DECIMAL (10,2);
SELECT 
    MIN(salary)
INTO 
v_lowest_salary
FROM
    employees.salaries s 
WHERE s.emp_no = p_emp_no;
RETURN v_lowest_salary;
END $$
DELIMITER ;

SELECT f_emp_lowest_salary(11356);

# Exercise 10
# Based on the previous example, you can now try to create a function that accepts also a second parameter which would be a character sequence. 
# Evaluate if its value is 'min' or 'max' and based on that retrieve either the lowest or the highest salary (using the same logic and code 
# from Exercise 9). If this value is a string value different from ‘min’ or ‘max’, then the output of the function should return 
# the difference between the highest and the lowest salary.

DROP FUNCTION IF EXISTS f_salary;
DELIMITER $$
CREATE FUNCTION f_salary (p_emp_no INTEGER, p_min_or_max varchar(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_salary_info DECIMAL(10,2);
SELECT
    CASE
        WHEN p_min_or_max = 'max' THEN MAX(s.salary)
        WHEN p_min_or_max = 'min' THEN MIN(s.salary)
        ELSE MAX(s.salary) - MIN(s.salary)
    END AS salary_info
INTO v_salary_info FROM
    employees.salaries s 
WHERE
    s.emp_no = p_emp_no;
RETURN v_salary_info;
END$$
DELIMITER ;

select employees.f_salary(11356, 'min');
select employees.f_salary(11356, 'max');
select employees.f_salary(11356, 'maxxx');




