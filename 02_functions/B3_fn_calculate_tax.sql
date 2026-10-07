-- B3: Progressive tax on a monthly salary
-- Illustrative brackets (replace with your instructor's rule if one was given):
--   up to 60000        -> 0%
--   60001 to 100000    -> 20% of the part above 60000
--   above 100000       -> 8000 + 30% of the part above 100000
CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number');
  ELSIF p_salary <= 60000 THEN
    RETURN 0;
  ELSIF p_salary <= 100000 THEN
    RETURN (p_salary - 60000) * 0.20;
  ELSE
    RETURN 8000 + (p_salary - 100000) * 0.30;
  END IF;
END fn_calculate_tax;
/
