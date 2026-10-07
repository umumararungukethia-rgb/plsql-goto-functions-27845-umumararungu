-- A2: Salary Review using GOTO
-- Bands: below 60000 -> 10% raise, below 120000 -> 5%, otherwise 2%
DECLARE
  v_emp_id     employees.emp_id%TYPE := 101;   -- try 101, 102, 103
  v_name       employees.emp_name%TYPE;
  v_salary     employees.salary%TYPE;
  v_new_salary NUMBER;
BEGIN
  SELECT emp_name, salary INTO v_name, v_salary
  FROM employees WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Reviewing: ' || v_name || ' | Current salary: ' || v_salary);

  IF v_salary < 60000 THEN
    GOTO lbl_low_band;
  ELSIF v_salary < 120000 THEN
    GOTO lbl_mid_band;
  ELSE
    GOTO lbl_high_band;
  END IF;

  <<lbl_low_band>>
  v_new_salary := v_salary * 1.10;
  DBMS_OUTPUT.PUT_LINE('Low band: 10% raise -> ' || v_new_salary);
  GOTO lbl_end_review;

  <<lbl_mid_band>>
  v_new_salary := v_salary * 1.05;
  DBMS_OUTPUT.PUT_LINE('Mid band: 5% raise -> ' || v_new_salary);
  GOTO lbl_end_review;

  <<lbl_high_band>>
  v_new_salary := v_salary * 1.02;
  DBMS_OUTPUT.PUT_LINE('High band: 2% raise -> ' || v_new_salary);

  <<lbl_end_review>>
  DBMS_OUTPUT.PUT_LINE('Salary review complete.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' not found.');
END;
/
