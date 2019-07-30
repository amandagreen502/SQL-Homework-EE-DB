CREATE TABLE "departments_data" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments_data" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp_data" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees_data" (
    "emp_no" INT   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees_data" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries_data" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries_data" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles_data" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_manager_data" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dept_emp_data" ADD CONSTRAINT "fk_dept_emp_data_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_data" ("emp_no");

ALTER TABLE "dept_emp_data" ADD CONSTRAINT "fk_dept_emp_data_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments_data" ("dept_no");

ALTER TABLE "employees_data" ADD CONSTRAINT "fk_employees_data_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_data" ("emp_no");

ALTER TABLE "salaries_data" ADD CONSTRAINT "fk_salaries_data_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_data" ("emp_no");

ALTER TABLE "titles_data" ADD CONSTRAINT "fk_titles_data_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_data" ("emp_no");

ALTER TABLE "dept_manager_data" ADD CONSTRAINT "fk_dept_manager_data_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments_data" ("dept_no");

ALTER TABLE "dept_manager_data" ADD CONSTRAINT "fk_dept_manager_data_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees_data" ("emp_no");

select * from departments_data
select * from dept_emp_data
select * from dept_manager_data
select * from employees_data
select * from salaries_data
select * from titles_data

-- 1 List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries_data AS s
INNER JOIN employees_data AS e ON
e.emp_no = s.emp_no;

-- 2 List employees who were hired in 1986.

SELECT * FROM employees_data
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- 3 List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments_data AS d
INNER JOIN dept_manager_data AS m ON
m.dept_no = d.dept_no
JOIN employees_data AS e ON
e.emp_no = m.emp_no;

-- 4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees_data AS e
INNER JOIN dept_emp_data AS d ON
e.emp_no = d.emp_no
INNER JOIN departments_data AS dp ON
dp.dept_no = d.dept_no;

-- 5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees_data
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- 6 List all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees_data AS e
INNER JOIN dept_emp_data AS d ON
e.emp_no = d.emp_no
INNER JOIN departments_data AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Sales';

--7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees_data AS e
INNER JOIN dept_emp_data AS d ON
e.emp_no = d.emp_no
INNER JOIN departments_data AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

-- 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS frequency
FROM employees_data
GROUP BY last_name
ORDER BY frequency DESC;