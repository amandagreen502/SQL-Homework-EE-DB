-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

