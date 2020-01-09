-- Creating tables for PH-EmployeeDB
Create Table departments (
dept_no varchar(4) not null,
dept_name varchar(40) not null,
primary key (dept_no),
unique (dept_name)
);
create table employees (
emp_no int not null,
birth_date date not null,
first_name varchar(40) not null,
last_name varchar(40) not null,
gender varchar(10) not null,
hire_date date not null,
primary key (emp_no)
);
create table dept_manager (
dept_no varchar(4) not null,
emp_no int not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references departments (dept_no),
primary key (emp_no, dept_no)
);
create table salaries (
emp_no int not null,
salary int not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no),
primary key (emp_no)
);
create table dept_emp (
dept_no varchar(4) not null,
emp_no int not null,
from_date date not null,
to_date date not null,
foreign key (dept_no) references departments (dept_no),
foreign key (emp_no) references employees (emp_no)
);
create table titles (
emp_no int not null,
title varchar(40) not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no)
);

select  * from departments;

-- Retirement eligibility
select first_name, last_name 
from employees
where birth_date between '1952-01-01' and '1955-12-31';

select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';

select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';

select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

-- Retirement eligibility
select first_name, last_name 
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Number of employees retiring
select count(first_name) 
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Create retirement eligibility table
select first_name, last_name 
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;