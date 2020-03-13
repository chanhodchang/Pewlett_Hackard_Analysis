# Pewlett_Hackard_Analysis

## Project Overview
Used SQL to organize retirement info about employees born around 1952-1955 and hired around 1985-1988.

In the challenge project, SQL was used to find potential mentors and mentees within the company.

## Resources
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: PostgreSQL 11.5, pgAdmin4 4.16

## Summary

The project was to find the potential retirement of several employees within the company and then within the sales and develpoment teams.

1. Created 6 different tables using the csv files as references to create and file the tables.
2. Used the WHERE function to pinpoint my search to find the desired employees ready for retirement
3. Used JOINS to create new types of tables that grabbed data from two or more tables.

The challenge project was to find potential mentors and mentees with the company. There was also an issue of duplicates which had to be fixed and counted.

1. RIGHT JOINS were first used to create a table of potential employees who were fit to become a mentor.
2. From this there was a realizaton of duplicates so the PARTITION function was used to locate duplicate values and set each values using rnum.
3. The data with the rnum value of 1 is then copied into a new table which ultimately removes the duplicates.
4. The COUNT function was then used to find the count of the different titles within the company.
5. Lastly, a new table was created to list out the potential employees who were fit to become a mentee.

## Analysis

The overall analysis helped put in perceptive of how many people within the company were retiring or not. 
Joins were useful to create new tables that the company could use to analyze the employees within the company. 
New datasets such as emp_info, manager_info, and dept_info show oddities with the data such as lack of salary raises or that only 5 out of departments have managers or that some people have multiple titles.
Below shows the manager_info

| dept_no | dept_name        | emp_no | last_name    | first_name |
|---------|------------------|--------|--------------|------------|
| d003    | Human Resources  | 110183 | Ossenbruggen | Shirish    | 
| d004    | Production       | 110386 | Kieras       | Shem       | 
| d007    | Sales            | 111133 | Zhang        | Hauke      | 
| d008    | Research         | 111534 | Kambil       | Hilary     | 
| d009    | Customer Service | 111692 | Butterworth  | Tonny      | 

The sales_team and sales_devl_team datasets were also created to show employees that were retiring who worked within the Sales and Development teams.
Below shows the count of employees per department

| count | dept_no |
|-------|---------|
| 2199  | d001    |
| 1908  | d002    |
| 1953  | d003    |
| 8174  | d004    |
| 9281  | d005    |
| 2234  | d006    |
| 5860  | d007    |
| 2413  | d008    |
| 2597  | d009    |

The challenge analysis create two different datasets, one for potential mentors and the other for potential mentees. 
The datasets show that there alot employees that are ready to mentor or be mentored.
Below shows the count table of each titles

| count | title              |
|-------|--------------------|
| 4692  | Engineer           |
| 15600 | Senior Engineer    |
| 2     | Manager            |
| 501   | Assistant Engineer |
| 3837  | Staff              |
| 14735 | Senior Staff       |
| 2013  | Technique Leader   |
