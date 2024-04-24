# Contoh UDF (Variable) yang disertakan dalam SELECT:

SET @v_emp_no = 11300;
SELECT
emp_no,
first_name,
last_name,
employees.f_emp_avg_salary(@v_emp_no) AS Average_Salary
FROM 
employees.employees
WHERE 
emp_no = @v_emp_no;