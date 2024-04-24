# Guna query ni untuk CREATE PROCEDURE yang akan dapat output:
# Field AVG(salary)
# daripada INNER JOIN table employees & salaries
# & ada IP & OP:

DROP PROCEDURE IF EXISTS employees.employees_average_salary_out;
DELIMITER $$
CREATE PROCEDURE employees.employees_average_salary_out(IN p_emp_no INT, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
    ROUND(AVG(t2.salary),2) AS average_salary
INTO p_avg_salary
FROM
    employees.employees t1
    INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
WHERE t1.emp_no = p_emp_no
GROUP BY t1.emp_no
ORDER BY t1.emp_no;
END $$
DELIMITER ;