-- Tests for B1-B4
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- B1 fn_annual_salary ---');
  DBMS_OUTPUT.PUT_LINE('Emp 101: ' || fn_annual_salary(101));
  DBMS_OUTPUT.PUT_LINE('Emp 999 (missing): ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- B2 fn_years_of_service ---');
  DBMS_OUTPUT.PUT_LINE('Emp 103: ' || fn_years_of_service(103));
  DBMS_OUTPUT.PUT_LINE('Emp 999 (missing): ' || NVL(TO_CHAR(fn_years_of_service(999)), 'NULL'));

  DBMS_OUTPUT.PUT_LINE('--- B3 fn_calculate_tax ---');
  DBMS_OUTPUT.PUT_LINE('50000  -> ' || fn_calculate_tax(50000));
  DBMS_OUTPUT.PUT_LINE('80000  -> ' || fn_calculate_tax(80000));
  DBMS_OUTPUT.PUT_LINE('150000 -> ' || fn_calculate_tax(150000));
  BEGIN
    DBMS_OUTPUT.PUT_LINE('-5 -> ' || fn_calculate_tax(-5));
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('-5 -> error caught: ' || SQLERRM);
  END;

  DBMS_OUTPUT.PUT_LINE('--- B4 fn_dept_name ---');
  DBMS_OUTPUT.PUT_LINE('Dept 10: ' || fn_dept_name(10));
  DBMS_OUTPUT.PUT_LINE('Dept 99 (missing): ' || fn_dept_name(99));
END;
/
