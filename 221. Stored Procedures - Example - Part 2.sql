# Guna query ni untuk buat procedure
# Yang akan bagi Output: First 1000 records daripada table employees:

USE employees;
DROP PROCEDURE IF EXISTS employees.first_1000_employees;

DELIMITER $$
CREATE PROCEDURE employees.first_1000_employees()
BEGIN
SELECT 
    *
FROM
    employees.employees;
END $$
DELIMITER ;

# Cara pertama untuk INVOKE SP:

CALL employees.first_1000_employees();

# Cara kedua untuk INVOKE SP:

USE employees;
CALL first_1000_employees();