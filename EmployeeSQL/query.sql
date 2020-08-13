--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
		ON(emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;
	
--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT * from employees
	WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the MANAGER of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT depts.dept_no,
	depts.dept_name,
	deptm.emp_no,
	emp.last_name,
	emp.first_name
FROM dept_manager as deptm
	INNER JOIN departments as depts
	ON (depts.dept_no = deptm.dept_no)
		INNER JOIN employees as emp
		ON (deptm.emp_no = emp.emp_no)
ORDER BY depts.dept_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT depte.emp_no,
	emp.last_name,
	emp.first_name,
	depts.dept_name
FROM dept_emp as depte
	INNER JOIN departments as depts
	ON (depts.dept_no = depte.dept_no)
		INNER JOIN employees as emp
		ON (depte.emp_no = emp.emp_no)
ORDER BY emp.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees

WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. List all employees in the Sales department including their: 
--employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
	FROM employees as emp
		INNER JOIN dept_emp
		ON (emp.emp_no = dept_emp.emp_no)
		INNER JOIN departments as depts
		ON (depts.dept_no = dept_emp.dept_no)
WHERE depts.dept_name = 'Sales';
		

--7. List all employees in the Sales and Development departments including their: 
--employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
	FROM employees as emp
		INNER JOIN dept_emp
		ON (emp.emp_no = dept_emp.emp_no)
		INNER JOIN departments as depts
		ON (depts.dept_no = dept_emp.dept_no)
WHERE depts.dept_name IN ('Sales', 'Development')
ORDER BY emp.emp_no;

--8. In descending order(desc), list the frequency count of employee last names
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) desc;

