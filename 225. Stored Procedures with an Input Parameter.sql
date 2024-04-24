# Guna query ni untuk CREATE PROCEDURE yang akan dapat output:
# Field emp_no, first_name, last_name, salary, from_date, & to date 
# daripada INNER JOIN table employees & salaries
# & ada IP:

DROP PROCEDURE IF EXISTS employees.employees_salary;
DELIMITER $$
CREATE PROCEDURE employees.employees_salary(IN p_emp_no INT)
BEGIN
SELECT 
    t2.emp_no, t1.first_name, t1.last_name, t2.salary, t2.from_date, t2. to_date
FROM
    employees.employees t1
    INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
WHERE t1.emp_no = p_emp_no;
END $$
DELIMITER ;

# Guna query ni untuk CREATE PROCEDURE yang akan dapat output:
# Field hire_date daripada table employees & ada IP:

DROP PROCEDURE IF EXISTS employees.employees_hire_date;
DELIMITER $$
CREATE PROCEDURE employees.employees_hire_date(IN p_emp_no INT)
BEGIN
SELECT 
    hire_date
FROM
    employees.employees 
WHERE employees.employees.emp_no = p_emp_no;
END $$
DELIMITER ;

# Guna query ni untuk CREATE PROCEDURE yang akan dapat output:
# Field emp_no, first_name, last_name, AVG(salary), from_date, & to date 
# daripada INNER JOIN table employees & salaries
# & ada IP:

DROP PROCEDURE IF EXISTS employees.employees_average_salary;
DELIMITER $$
CREATE PROCEDURE employees.employees_average_salary(IN p_emp_no INT)
BEGIN
SELECT 
    t2.emp_no, t1.first_name, t1.last_name, ROUND(AVG(t2.salary),2) AS average_salary, MAX(t2.from_date) AS from_date, MAX(t2. to_date) AS to_date
FROM
    employees.employees t1
    INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
WHERE t1.emp_no = p_emp_no
GROUP BY t1.emp_no
ORDER BY t1.emp_no;
END $$
DELIMITER ;

SELECT 
    t2.emp_no, t1.first_name, t1.last_name, ROUND(AVG(t2.salary),2) AS average_salary, MAX(t2.from_date) AS from_date, MAX(t2. to_date) AS to_date
FROM
    employees.employees t1
    INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
GROUP BY t1.emp_no
ORDER BY t1.emp_no;