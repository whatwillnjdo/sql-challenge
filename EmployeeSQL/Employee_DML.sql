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

select * from employee_titles where title='Manager';

