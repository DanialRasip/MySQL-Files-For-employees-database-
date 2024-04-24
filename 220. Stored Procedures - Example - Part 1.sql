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