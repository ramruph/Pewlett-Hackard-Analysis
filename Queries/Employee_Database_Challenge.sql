--1 thorugh 7
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
r.emp_no,
r.first_name,
r.last_name,
r.title,
INTO unique_titles
FROM retirement_titles as r 
ORDER BY r.emp_no, to_date DESC;

--retiring tiles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_tables as ut
GROUP BY ut.title
ORDER BY COUNT DESC;



-- Deliverable 2
SELECT DISTINCT ON(emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as t 
ON e.emp_no = t.emp_no 
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;