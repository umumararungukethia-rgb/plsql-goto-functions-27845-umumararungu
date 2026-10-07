-- Tests for C1 fn_validate_payroll
BEGIN
  FOR r IN (SELECT emp_id, emp_name FROM employees ORDER BY emp_id) LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(r.emp_id || ' ' || r.emp_name, 14) || ' -> ' || fn_validate_payroll(r.emp_id));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RPAD('999 (missing)', 14) || ' -> ' || fn_validate_payroll(999));
END;
/
