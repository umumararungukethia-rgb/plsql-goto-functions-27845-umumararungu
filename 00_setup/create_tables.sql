-- 00_setup/create_tables.sql
-- Creates DEPARTMENTS and EMPLOYEES tables with sample data.
-- Salaries are monthly amounts.

BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id   NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

-- No foreign key on dept_id on purpose, so C1 can test an unknown department.
CREATE TABLE employees (
  emp_id    NUMBER PRIMARY KEY,
  emp_name  VARCHAR2(60) NOT NULL,
  dept_id   NUMBER,
  salary    NUMBER(12,2),
  hire_date DATE
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');

INSERT INTO employees VALUES (101, 'Alice',  10,  45000, DATE '2019-03-15');
INSERT INTO employees VALUES (102, 'Brian',  20,  80000, DATE '2017-07-01');
INSERT INTO employees VALUES (103, 'Claire', 10, 150000, DATE '2015-01-20');
INSERT INTO employees VALUES (104, 'David',  30, 250000, DATE '2012-09-10');
INSERT INTO employees VALUES (105, 'Eve',    20,  55000, DATE '2022-05-02');
-- Deliberately problematic rows for the C1 payroll validator:
INSERT INTO employees VALUES (106, 'Frank',  10,      0, DATE '2020-02-02');  -- invalid salary
INSERT INTO employees VALUES (107, 'Grace',  99,  90000, DATE '2021-06-06');  -- unknown department
INSERT INTO employees VALUES (108, 'Henry',  20,  70000, DATE '2030-01-01');  -- future hire date

COMMIT;

SELECT * FROM departments;
SELECT * FROM employees ORDER BY emp_id;
