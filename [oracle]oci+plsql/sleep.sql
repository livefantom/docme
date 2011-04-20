  /*
    A simple procedure to wait for 'tm' seconds if DBMS_LOCK.SLEEP is not installed or available
  */

  create or replace PROCEDURE SLEEP(tm IN INTEGER) IS
  V_ERRORCODE NUMBER;
  V_ERRORMESG VARCHAR2(200);
  end_dt      date;
BEGIN
  end_dt := SYSDATE + tm / (24 * 60 * 60);
  WHILE SYSDATE < end_dt LOOP
    NULL;
  END LOOP;
  dbms_output.put_line('i waited ' || to_char(tm) || ' seconds');
  RETURN;
EXCEPTION
  WHEN OTHERS THEN
    V_ERRORCODE := SQLCODE;
    V_ERRORMESG := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('SLEEP Error: ' || V_ERRORCODE || ' ' ||
                         V_ERRORMESG);
    RETURN;
END SLEEP;
/
