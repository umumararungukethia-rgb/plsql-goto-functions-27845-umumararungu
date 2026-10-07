-- A3: Illegal GOTO and Fix
-- Run PART 1 first (it is EXPECTED to fail with PLS-00375), then PART 2.

-- PART 1: ILLEGAL GOTO
-- PL/SQL does not allow a GOTO to jump INTO an IF block.
BEGIN
  GOTO lbl_inside_if;
  IF 1 = 1 THEN
    <<lbl_inside_if>>
    DBMS_OUTPUT.PUT_LINE('Jumped into an IF block');
  END IF;
END;
/

-- PART 2: FIXED VERSION
-- Fix: place the label at the same (outer) level as the GOTO, not inside the IF.
BEGIN
  GOTO lbl_target;

  <<lbl_target>>
  DBMS_OUTPUT.PUT_LINE('Fixed: label is at the same block level, so GOTO works');
END;
/
