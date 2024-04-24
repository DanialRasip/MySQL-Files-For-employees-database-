# Guna query ni untuk dapatkan average salary untuk kedua2 gender (M & F)
# Dengan menggunakan JOIN:

SELECT 
    t1.gender, AVG(t2.salary) AS Average_Salary
FROM
    employees.employees t1
        LEFT JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
GROUP BY t1.gender
ORDER BY  t1.gender ASC;
