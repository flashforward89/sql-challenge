--------------------------------Data Analysis----------------


-----1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Employees.sex, Saleries.salary
FROM Employees
INNER JOIN Saleries ON
Employees.emp_no = Saleries.emp_no
ORDER BY Employees.emp_no;
		


-----2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;
		
--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_Managers.emp_no, 
       employees.last_name, employees.first_name
FROM Departments
INNER JOIN dept_managers ON
departments.dept_no = dept_managers.dept_no
INNER JOIN employees ON
dept_managers.emp_no = employees.emp_no
ORDER BY departments.dept_no;

----4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Dept_Emp.dept_no = Departments.dept_no
ORDER BY Departments.dept_name;
		
----5. List all employees whose first name is "Hercules" and last names begin with "B."
select * 
		from employees
		where first_name='Hercules' AND last_name LIKE 'B%';

----6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
----This list includes only those employees who are still working in the Sales department and not previously worked.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales';

----7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
--Put in ascending order by department name
SELECT Employees.emp_no, Employees.last_name, 
       Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_Emp ON
Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON
Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name = 'Sales' 
OR Departments.dept_name = 'Development'
ORDER BY Departments.dept_name;

     
----8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM Employees 
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;