-- A1: Number Classifier using GOTO
DECLARE
  v_num NUMBER := 15;   -- change to test: 15, -7, 0
BEGIN
  IF v_num > 0 THEN
    GOTO lbl_positive;
  ELSIF v_num < 0 THEN
    GOTO lbl_negative;
  ELSE
    GOTO lbl_zero;
  END IF;

  <<lbl_positive>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
  IF MOD(v_num, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is also EVEN');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' is also ODD');
  END IF;
  GOTO lbl_done;

  <<lbl_negative>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
  GOTO lbl_done;

  <<lbl_zero>>
  DBMS_OUTPUT.PUT_LINE('The number is ZERO');

  <<lbl_done>>
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/
