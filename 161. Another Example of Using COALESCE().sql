# Guna query ni untuk dapatkan semua values dari semua field dalam table departments_dup2:

SELECT 
    *
FROM
    employees.departments_dup2
ORDER BY dept_no;

# Guna query ni untuk gantikan NULL values dalam field dept_name dengan default value dalam table departments_dup2:

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department Name Not Provided') AS dept_name
FROM
    employees.departments_dup2;
    
# Guna query ni untuk buktikan COALESCE yang ada 2 arguments sahaja berfungsi sama seperti IFNULL:

SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department Name Not Provided') AS dept_name
FROM
    employees.departments_dup2;
    
# Guna query ni untuk COALESCE yang ada lebih daripada 3 parameters:

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    employees.departments_dup2
ORDER BY dept_no DESC;

# Perfected Version untuk query di atas:

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department Name Not Provided') AS dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    employees.departments_dup2
ORDER BY dept_no ASC;

# Guna query ni untuk COALESCE yang ada 1 argument sahaja:

SELECT 
    dept_no,
    dept_name,
    COALESCE('Department Manager Name') AS fake_column
FROM
    employees.departments_dup2
ORDER BY dept_no ASC;