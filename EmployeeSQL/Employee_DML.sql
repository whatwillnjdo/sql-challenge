select e.employee_number, e.last_name, e.first_name, e.gender, es.salary
from employees e, employee_salaries es
where e.employee_number = es.employee_number;
