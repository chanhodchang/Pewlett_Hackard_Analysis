# Pewlett_Hackard_Analysis
Using SQL to organize and create new databases as per manager's requests.

## Project Overview
Used SQL to organize retirement info about employees born around 1952-1955 and hired around 1985-1988.

In the challenge project, SQL was used to find potential mentors and mentees within the company.

## Resources
- Date Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: PostgreSQL 11.5, pgAdmin4 4.16

## Summary

The project was to find the potential retirement of several employees within the company and then within the sales and develpoment teams.

1. Created 6 different tables using the csv files as references to create and file the tables.
2. Used the WHERE function to pinpoint my search to find the desired employees ready for retirement
3. Used JOINS to create new types of tables that grabbed data from two or more tables.

The challenge project was to find potential mentors and mentees with the company. There was also an issue of duplicates which had to be fixed and counted.

1. RIGHT JOINS were first used to create a table of potential employees who were fit to become a mentor.
2. From this there was a realizaton of duplicates so the DISTINCT function was used to only grab the distinct values to create a new table.
3. The COUNT function was then used to find the count of the different titles within the company.
4. Lastly, a new table was created to list out the potential employees who were fit to become a mentee.