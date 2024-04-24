# Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, 
# and returns their employee number:

DROP PROCEDURE IF EXISTS employees.emp_info;
DELIMITER $$
CREATE PROCEDURE employees.emp_info(IN p_first_name VARCHAR(14), IN p_last_name VARCHAR(16), OUT p_emp_no INT)
BEGIN
SELECT distinct
    emp_no
INTO p_emp_no
FROM
    employees.employees 
WHERE employees.employees.first_name = p_first_name AND employees.employees.last_name = p_last_name;
END $$
DELIMITER ;

SELECT 
    DISTINCT *
FROM
    employees.employees;

#Jawapan daripada Solution:

DELIMITER $$
CREATE PROCEDURE employees.emp_info_2(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
SELECT
e.emp_no
INTO p_emp_no FROM
employees.employees e
WHERE
e.first_name = p_first_name
AND e.last_name = p_last_name;
END$$
DELIMITER ;

