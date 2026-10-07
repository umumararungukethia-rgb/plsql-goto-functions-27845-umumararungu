-- B5: Using the functions inside SQL
-- Run each SELECT separately in APEX SQL Commands.

SELECT emp_id,
       emp_name,
       fn_dept_name(dept_id)       AS dept,
       salary,
       fn_annual_salary(emp_id)    AS annual_salary,
       fn_years_of_service(emp_id) AS years_service,
       fn_calculate_tax(salary)    AS monthly_tax
FROM   employees
WHERE  salary > 0
ORDER  BY fn_annual_salary(emp_id) DESC;

-- Functions in WHERE: employees earning more than 1,000,000 a year
SELECT emp_name, fn_annual_salary(emp_id) AS annual_salary
FROM   employees
WHERE  fn_annual_salary(emp_id) > 1000000;
