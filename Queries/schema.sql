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