DROP PROCEDURE IF EXISTS employees.average_salary_employees;

DELIMITER $$
CREATE PROCEDURE employees.average_salary_employees()
BEGIN
SELECT 
    ROUND(AVG(salary),2)
FROM
    employees.salaries;
END $$
DELIMITER ;

# Cara pertama untuk INVOKE SP:

CALL employees.average_salary_employees();

# Cara kedua untuk INVOKE SP:

USE employees;
CALL average_salary_employees();
