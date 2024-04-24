# "Create a variable, called ‘v_emp_no’, 
# where you will store the output of the procedure you created in the last exercise.
# Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
# Finally, select the obtained output."

DROP PROCEDURE IF EXISTS employees.emp_no;
DELIMITER $$
CREATE PROCEDURE employees.emp_no(IN p_first_name VARCHAR(14), IN p_last_name VARCHAR(16), OUT p_emp_no INT)
BEGIN
SELECT
    emp_no
INTO p_emp_no
FROM
    employees.employees 
WHERE employees.employees.first_name = p_first_name AND employees.employees.last_name = p_last_name;
END $$
DELIMITER ;

SET @v_emp_no = 0;
CALL employees.emp_no('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;