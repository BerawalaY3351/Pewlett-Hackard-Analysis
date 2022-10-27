-- Deliverable 1
SELECT ce.emp_no,
  ce.first_name,
  ce.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO ret_titles
FROM employees AS ce
  INNER JOIN titles AS ti
    ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ce.emp_no;

SELECT * FROM employees
SELECT * FROM titles
SELECT * FROM ret_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
to_date

INTO unique_titles
FROM ret_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- confirm that it looks like this image
SELECT * FROM unique_titles

--Use COUNT() and ORDER BY to get the number of retiring employees in each department
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT (ut.emp_no) DESC;

-- confirm that it looks like this image
SELECT * FROM retiring_titles

--Deliverable 2
SELECT Distinct ON (em.emp_no) em.emp_no, em.first_name, em.last_name, 
					em.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees as em
	INNER JOIN dept_emp as de
	ON (em.emp_no = de.emp_no)
	INNER JOIN titles as ti
	ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;

-- confirm that it looks like this image
SELECT * FROM mentorship_eligibility