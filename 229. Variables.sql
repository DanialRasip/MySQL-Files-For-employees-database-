# Guna query ni untuk SET Variable yang valuenya sama dengan SP sebelum ni:

SET @v_avg_salary = 0;
CALL employees.employees_average_salary_out(11300, @v_avg_salary);
SELECT @v_avg_salary;

