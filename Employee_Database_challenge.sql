-- Deliverable 1

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
SELECT e.emp_no, first_name, last_name, title, from_date, to_date 
INTO retirement_titles
FROM Employees AS e


-- Join both tables on the primary key.
INNER JOIN Titles as t
ON e.emp_no = t.emp_no


-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;


SELECT * FROM departments

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(title) AS ct, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY ct DESC



-- Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, title
INTO mentorship_eligibility
FROM employees AS e

INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN titles AS t ON e.emp_no = t.emp_no

WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no ASC, t.to_date DESC


-- Summary 

-- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
SELECT count(DISTINCT (emp_no)) FROM retirement_titles

-- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
SELECT COUNT(emp_no) FROM mentorship_eligibility


-- Additional insights
SELECT COUNT(emp_no) FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

SELECT COUNT(*) AS count,title FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC