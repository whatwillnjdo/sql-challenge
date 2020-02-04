--List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.employee_number, e.last_name, e.first_name, e.gender, es.salary
from employees e, employee_salaries es
where e.employee_number = es.employee_number;


--List employees who were hired in 1986.

select * 
from employees 
where extract(year FROM "hire_date") = 1986;

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

select de.department_number, de.department_name,
	   et.employee_number, es.first_name, es.last_name,
	   et.from_date, et.to_date
from employee_titles et 
join employees es on es.employee_number = et.employee_number
join employee_departments ed on ed.employee_number = et.employee_number
join departments de on de.department_number = ed.department_number
where et.title='Manager'
order by de.department_number;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select de.department_number, es.employee_number, es.last_name,
	   es.first_name, de.department_name
from employees es
join employee_departments ed on ed.employee_number = es.employee_number
join departments de on de.department_number = ed.department_number;

--List all employees whose first name is "Hercules" and last names begin with "B."

select *
from employees 
where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select es.employee_number, es.last_name,
	   es.first_name, de.department_name
from employees es
join employee_departments ed on ed.employee_number = es.employee_number
join departments de on de.department_number = ed.department_number and de.department_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select es.employee_number, es.last_name,
	   es.first_name, de.department_name
from employees es
join employee_departments ed on ed.employee_number = es.employee_number
join departments de on de.department_number = ed.department_number and de.department_name in ('Sales', 'Development')
order by de.department_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(1) count_number_employees_by_last_name
from employees 
group by last_name order by count_number_employees_by_last_name desc;

--A view for average salary and title

create view average_salary_by_title as
select et.title, round(avg(salary), 2) average_salary
from employee_titles et 
join employee_salaries es on et.employee_number = es.employee_number
group by et.title;


--A view for salary and employee

create view salary_for_employee as
select et.employee_number, es.salary
from employees et 
join employee_salaries es on et.employee_number = es.employee_number;