-- create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles t
ON e.emp_no = t.emp_no
where (e.birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name, 
	last_name,
	title
INTO unique_titles 
FROM retirement_titles 
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM UNIQUE_TITLES;

-- Retrieve number of employees by their most recent job title who are about to retire
SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

-- Create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
where de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01'AND '1965-12-31'
ORDER BY e.emp_no ASC;

Select * from mentorship_eligibilty;


-----Additional Queries
-- total count of titles from the mentorship pool of employees
SELECT COUNT(title),title
INTO mentorship_titles
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count(title) DESC;


-- Employee count by department number from mentorship pool
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	de.dept_no,
	d.dept_name
--	t.title
INTO mentorship_elg_dept
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON de.dept_no = d.dept_no
-- LEFT JOIN titles AS t
-- ON e.emp_no = t.emp_no
where de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01'AND '1965-12-31'
ORDER BY e.emp_no ASC;

Select * from mentorship_elg_dept;


--new query number of people in the mentorship pool by dept
SELECT COUNT(dept_name),dept_name
-- INTO 
FROM mentorship_elg_dept
GROUP BY dept_name
ORDER BY count(dept_name) DESC;




