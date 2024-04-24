# Guna query ni untuk CREATE FUNCTION yang akan bagi RV: v_avg_salary

DROP FUNCTION IF EXISTS employees.f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION employees.f_emp_avg_salary(p_emp_no INT) RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
DECLARE v_avg_salary DECIMAL (10,2);
SELECT 
    AVG(t2.salary)
INTO 
v_avg_salary
FROM
    employees.employees t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
WHERE
    t1.emp_no = p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ;

# Guna query ni untuk gunakan f_emp_avg_salary:

SELECT employees.f_emp_avg_salary (11300);