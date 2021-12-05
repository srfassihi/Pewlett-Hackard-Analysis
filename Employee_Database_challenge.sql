---- DELIVERABLE 1 ----
-- Create initial retirement_titles table including all titles (Step 1 - 6)
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.birth_date between '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.from_date DESC;

-- Confirm table inserted correctly (Step 7)
SELECT * from retirement_titles order by emp_no, from_date DESC;

-- Drop table if error
DROP TABLE retirement_titles;

-- Use Distinct with Orderby to remove duplicate rows (Step 8 - 14)
select DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
from retirement_titles
ORDER BY emp_no, from_date DESC;

SELECT * from unique_titles
ORDER BY emp_no;

-- Create table of retiring titles and counts using group by (Step 15 - 20)
select count(emp_no),
	title
into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc;

SELECT * from retiring_titles;

---- DELIVERABLE 2 ----

-- Create a mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_employee de
ON e.emp_no = de.emp_no
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no, de.from_date DESC;

select * from mentorship_eligibility;
