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
where (birth_date between '1965-01-01' and '1965-12-31')

-- Only the Most Recent Titles
select 
first_name,
last_name,
count(*)
from potential_mentors
group by 
first_name,
last_name
having count(*) > 1;

select distinct on (first_name, last_name) * 
into dis_pot_mentor
from potential_mentors

select count(title), title 
into count_titles
from dis_pot_mentor
group by title

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
