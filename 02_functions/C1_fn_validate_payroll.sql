-- C1: Payroll Validator (combines GOTO + functions + exception handling)
-- Returns 'VALID' or 'INVALID: <reason>'. Requires fn_dept_name (B4).
CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
  v_emp employees%ROWTYPE;
  v_msg VARCHAR2(200);
BEGIN
  SELECT * INTO v_emp FROM employees WHERE emp_id = p_emp_id;

  IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
    v_msg := 'Salary must be greater than zero';
    GOTO lbl_invalid;
  END IF;

  IF v_emp.hire_date IS NULL OR v_emp.hire_date > SYSDATE THEN
    v_msg := 'Hire date is missing or in the future';
    GOTO lbl_invalid;
  END IF;

  IF fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
    v_msg := 'Department does not exist';
    GOTO lbl_invalid;
  END IF;

  RETURN 'VALID';

  <<lbl_invalid>>
  RETURN 'INVALID: ' || v_msg;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: Employee not found';
END fn_validate_payroll;
/
