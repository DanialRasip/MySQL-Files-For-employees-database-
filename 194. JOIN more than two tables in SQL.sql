# Guna query ni untuk dapatkan field first_name, last_name, hire_date, from_date & dept_name
# Dari table employees, dept_manager & departments dengan menggunakan JOIN:

SELECT 
    t1.first_name,
    t1.last_name,
    t1.hire_date,
    t2.from_date,
    t2.dept_no,
    t3.dept_name
FROM
    employees.employees t1
        INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
        INNER JOIN
    employees.departments t3 ON t2.dept_no = t3.dept_no
ORDER BY t1.emp_no;

# Sama macam query dekat atas, cuma tukar position t1 dengan t3 dekat bahagian
# FROM & INNER JOIN:

SELECT 
    t3.first_name,
    t3.last_name,
    t3.hire_date,
    t2.from_date,
    t2.dept_no,
    t1.dept_name
FROM
    employees.departments t1
        INNER JOIN
    employees.dept_manager t2 ON t1.dept_no = t2.dept_no
        INNER JOIN
    employees.employees t3 ON t2.emp_no = t3.emp_no
ORDER BY t3.emp_no;