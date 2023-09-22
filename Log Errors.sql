CREATE TABLE log_errors(
 Calling_Program    VARCHAR2(300),
 Error_Code         NUMBER,
 Error_Description  VARCHAR2(1000),
 Log_Timestamp      TIMESTAMP);
 
 CREATE OR REPLACE PROCEDURE log_error(
  p_calling_program     log_errors.callıng_program%type,
  p_error_code          log_errors.error_code%type,
  p_error_description   log_errors.error_descrıptıon%type)
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO log_errors
  VALUES
  ( p_calling_program,p_error_code,p_error_description,sysdate);
  COMMIT;
END log_error;
