# Pewlett-Hackard-Analysis-Challenge
Pewlett-Hackard-Analysis-Challenge using PostgreSQL, pgAdmin

## Overview of the Project:

### Project Background:


PH is a large company with several thousand employees. HP is 
	- offering retirement package for those who met certain criteria.
	- Which position needs to be filled in the future as the upcoming retirement will leave thousands of job openings.

The purpose of this project is to help Bobby who is an up and coming HR analyst at a large company with several thousand employees who are due for retirement soon.  The task is to perform employee research to determine:
	- Who will be retiring in the next few years
	- How many positions the company will need to fill
	
This analysis will future proof HP by generating a list of all employees who are eligible for the retirement package.


### Purpose:

Since the initial analysis determined that a lot of employees will be eligible for retirement, the company wants to do additional analysis to determine:  
- The Number of Retiring Employees by Title
- The Employees Eligible for the Mentorship Program to train the new hires


## Source:

- ProsgreSQL
- PGAdmin

## Analysis/Results:

Currently the employee information is available in CSV files, mainly Excel and VBA is used to work with the data. 
Now company is upgrading to SQL. Project involves building employee database with SQL queries [Employee_Database_Challenge.sql](Queries/Employee_Database_Challenge.sql) by applying data modeling, engineering, and analysis skills. Entity Relationship Diagram (ERD) [EmployeeDB.png](EmployeeDB.png) was created to help with the analysis.

The Number of Retiring Employees by Title:

1. Using the ERD, created a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. [retirement_titles.csv](Data/retirement_titles.csv)
2. Using the DISTINCT ON statement created a table that contains the most recent title of each employee. [unique_titles.csv](Data/unique_titles.csv)
3. Created a final table that has the number of retirement-age employees by most recent job title using the count function.[retiring_titles.csv](Data/retiring_titles.csv)

The Employees Eligible for the Mentorship Program:

4. Using the ERD, created a mentorship-eligibility table that holds the employees who are eligible to participate in a mentorship program. [mentorship_eligibility.csv](Data/mentorship_eligibility.csv)


## Summary:
	
90,398 employees will be retiring from the company.

1549 employees will be eligible to participate in the mentorship program.

The unique titles that will be retiring are:

- Senior Engineer
- Senior Staff
- Engineer
- Staff
- Tecnique Leader
- Assistant Engineer
- Manager


Additional query [mentorship_titles.csv](Data/mentorship_titles.csv) which should the count of mentorship titles showed the following results:
- There are plenty of Senior Engineer, Senior Staff, Engineer and Staff available to train the new hires.
- There are less of Technique Leader, Assistant Engineer and Staff available to train the new hires.
- In the Mentorship pool, there aren't any Manager titles.

Additional query revealed that the 2 managers who are retiring are from the Sales and Research Department. Results are in the [retirement_title_dept.csv](Data/retirement_title_dept.csv) file.
