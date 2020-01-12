-- Number of [titles] Retiring
select e.emp_no,
first_name,
last_name,
title,
ti.from_date,
salary
into potential_mentors
from employees as e
right join titles as ti
on e.emp_no = ti.emp_no
right join salaries as s
on e.emp_no = s.emp_no
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select * from potential_mentors;

-- Only the Most Recent Titles
create table mentor_titles as (
	with potential_mentors as
(
	select emp_no, first_name, last_name, title, from_date, salary,
			 ROW_NUMBER() OVER
		(partition by (emp_no, first_name, last_name) order by from_date desc) as rnum   
	from potential_mentors)
select * from potential_mentors where rnum=1);

select * from mentor_titles;

select count(title), title
into count_titles
from mentor_titles
group by title;

select * from count_titles;

-- Who's Ready for a Mentor?
select e.emp_no,
first_name,
last_name,
title,
from_date,
to_date
into potential_mentee
from employees as e
join titles as ti
on e.emp_no = ti.emp_no
where (birth_date between '1965-01-01' and '1965-12-31')
and (to_date = '9999-01-01');
