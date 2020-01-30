create table departments 
(
	department_number varchar(6) primary key,
	department_name varchar(50) not null
);

COPY departments(department_number,department_name) 
FROM '/Users/nj/PostgreSQL/sql-challenge/EmployeeSQL/Resources/departments.csv' DELIMITER ',' CSV HEADER;

drop table employees;

create table employees 
(
	employee_number int primary key,
	birth_date date not null,
	first_name varchar(50) not null,
	last_name varchar(50),
	gender varchar(1) not null,
	hire_date date not null
);

COPY employees(employee_number,birth_date,first_name,last_name,gender,hire_date) 
FROM '/Users/nj/PostgreSQL/sql-challenge/EmployeeSQL/Resources/employees.csv' DELIMITER ',' CSV HEADER;

create table employee_departments
(
	employee_number int references employees(employee_number),
	department_number varchar(6) references departments(department_number),
	from_date date not null,
	to_date date default '9999-01-01',
	primary key (employee_number, department_number)
);

COPY employee_departments(employee_number,department_number,from_date,to_date) 
FROM '/Users/nj/PostgreSQL/sql-challenge/EmployeeSQL/Resources/dept_emp.csv' DELIMITER ',' CSV HEADER;

create table employee_salaries
(
	employee_number int references employees(employee_number),
	salary int,
	from_date date not null,
	to_date date default '9999-01-01',
	primary key (employee_number, salary, from_date)
);

COPY employee_salaries(employee_number,salary,from_date,to_date) 
FROM '/Users/nj/PostgreSQL/sql-challenge/EmployeeSQL/Resources/salaries.csv' DELIMITER ',' CSV HEADER;

create table employee_titles
(
	employee_number int references employees(employee_number),
	title varchar(100),
	from_date date not null,
	to_date date default '9999-01-01',
	primary key (employee_number, title, from_date)
);

COPY employee_titles(employee_number,title,from_date,to_date) 
FROM '/Users/nj/PostgreSQL/sql-challenge/EmployeeSQL/Resources/titles.csv' DELIMITER ',' CSV HEADER;
