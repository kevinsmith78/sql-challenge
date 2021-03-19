

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
From employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007';
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007' OR dept_emp.dept_no = 'd005'
ORDER BY dept_no;
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, 
count (last_name) as "SHARED last name"
from employees
Group BY last_name
ORDER BY
COUNT (last_name) DESC;



