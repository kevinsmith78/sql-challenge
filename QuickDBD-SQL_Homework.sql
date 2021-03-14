-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/d6oRy3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employee" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(15)   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" varchar(10)   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar   NOT NULL
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("emp_title");

