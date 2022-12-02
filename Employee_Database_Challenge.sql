-- Use Dictinct with Orderby to remove duplicate rows
SELECT employees.emp_no, employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date

INTO retirement_info
FROM employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

SELECT * FROM retirement_info;

	
SELECT * FROM titles;
SELECT * FROM employees;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_info.emp_no) retirement_info.emp_no,
retirement_info.first_name,
retirement_info.last_name,
retirement_info.title

INTO unique_titles
FROM retirement_info
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles.titles


SELECT COUNT(unique_titles.title), unique_titles.title
Into retiring_titles
FROM unique_titles
GROUP by unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
on (titles.emp_no = employees.emp_no )
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by emp_no;

SELECT * FROM mentorship_eligibility;