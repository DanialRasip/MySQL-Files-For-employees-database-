# Guna query ni untuk dapatkan field emp_no, first_name, last_name & salaries employees
# tapi nak yang salaries employees tu lebih daripada 145,000
# daripada INNER JOIN tables employees & salaries 

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t2.salary
FROM
    employees.employees t1
        LEFT JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
WHERE salary > 145000
GROUP BY t1.emp_no, t1.first_name, t1.last_name, t2.salary
ORDER BY t1.emp_no ASC;