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
emp_no int not null,
dept_no varchar not null,
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

-- Create new table for retiring employees
drop table retirement_info;

select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');
-- Check the table
select * from retirement_info;

-- Joining departments and dept_manager tables
select departments.dept_name,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no

-- Joining retirement_info and dept_emp tables
select retirement_info.emp_no,
retirement_info.first_name,
retirement_info.last_name,
dept_emp.to_date
from retirement_info
left join dept_emp
on retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables using nicknames
select ri.emp_no,
ri.first_name,
ri.last_name,
de.to_date
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
select departments.dept_name,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no;

-- Joining departments and dept_manager tables with nicknames
select d.dept_name,
dm.emp_no,
dm.from_date,
dm.to_date
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Left join retirement_info and dept_info into current_emp
select ri.emp_no,
ri.first_name,
ri.last_name,
de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date=('9999-01-01');

-- Employee count by department number
select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

-- Place employee count by department number into a table
select count(ce.emp_no), de.dept_no
into emp_dept_count
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

select * from emp_dept_count;

select * from salaries
order by to_date desc;

-- Create Emp_Info table
select e.emp_no,
e.first_name,
e.last_name,
e.gender,
s.salary,
de.to_date
into emp_info
from employees as e
join salaries as s
on (e.emp_no = s.emp_no)
join dept_emp as de
on (e.emp_no = de.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
and (e.hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

-- List of managers per department
select dm.dept_no,
d.dept_name,
dm.emp_no,
ce.last_name,
ce.first_name,
dm.from_date,
dm.to_date
into manager_info
from dept_manager as dm
join departments as d
on (dm.dept_no = d.dept_no)
join current_emp as ce
on (dm.emp_no = ce.emp_no);

-- Create dept_info table
select ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
into dept_info
from current_emp as ce
join dept_emp as de
on (ce.emp_no = de.emp_no)
join departments as d
on (de.dept_no = d.dept_no);

select ri.emp_no,
first_name,
last_name,
d.dept_name
into sales_team
from retirement_info ri
join dept_emp as de
on (ri.emp_no = de.emp_no)
join departments as d
on (de.dept_no = d.dept_no)
where d.dept_name = 'Sales'

select ri.emp_no,
first_name,
last_name,
d.dept_name
into sales_devl_team
from retirement_info ri
join dept_emp as de
on (ri.emp_no = de.emp_no)
join departments as d
on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales','Development')