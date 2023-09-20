CREATE OR REPLACE PACKAGE pkg_users AS
 PROCEDURE raise_error(p_error_message VARCHAR2);
--This procedure raise_error seems to be created for error handling, by receiving a specific error message,
--undoing the current action of the application and showing the user the specified error message
 PROCEDURE insert_user(
  p_first_name users.fırst_name%type,
  p_last_name  users.last_name%type,
  p_email      users.emaıl%type,
  p_phone_number users.phone_number%type,
  p_job_id      users.job_ıd%type,
  p_salary     users.salary%type);
 
 PROCEDURE update_user(
  p_user_id    users.user_ıd%type,
  p_first_name users.fırst_name%type,
  p_last_name  users.last_name%type,
  p_email      users.emaıl%type,
  p_phone_number users.phone_number%type,
  p_job_id      users.job_ıd%type,
  p_salary     users.salary%type);
 
 PROCEDURE delete_user(
  p_user_id    users.user_ıd%type);
END pkg_users;


CREATE OR REPLACE PACKAGE BODY pkg_users AS
  PROCEDURE raise_error(p_error_message VARCHAR2) AS
  BEGIN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20000, p_error_message);
  END raise_error;

 PROCEDURE insert_user(
  p_first_name users.fırst_name%type,
  p_last_name  users.last_name%type,
  p_email      users.emaıl%type,
  p_phone_number users.phone_number%type,
  p_job_id      users.job_ıd%type,
  p_salary     users.salary%type)IS
BEGIN 
 INSERT INTO users(fırst_name,last_name,emaıl,phone_number,job_ıd,salary)
   VALUES(p_first_name,p_last_name,p_email,p_phone_number,p_job_id,p_salary);
     COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       raise_error('User Insertion Error:'||SQLERRM);
  END insert_user;
  
  PROCEDURE update_user( 
  p_user_id    users.user_ıd%type,
  p_first_name users.fırst_name%type,
  p_last_name  users.last_name%type,
  p_email      users.emaıl%type,
  p_phone_number users.phone_number%type,
  p_job_id      users.job_ıd%type,
  p_salary     users.salary%type)IS
BEGIN 
  UPDATE users
  SET
   fırst_name=p_first_name,
   last_name=p_last_name,
   emaıl=p_email,
   phone_number=p_phone_number,
   job_ıd=p_job_id,
   salary=p_salary
  WHERE
   user_ıd=p_user_id;
COMMIT;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No records were found with the specified User Id.');
    WHEN OTHERS THEN
      ROLLBACK;
      raise_error('User Update Error:'||SQLERRM);
  END update_user;
  
 PROCEDURE delete_user(
    p_user_id    users.user_ıd%type) IS
 BEGIN
   DELETE FROM users
    WHERE user_ıd=p_user_id;
   COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    ROLLBACK;
     raise_error('User Delete Error:'||SQLERRM);
  END delete_user;
END PKG_USERS;

SET SERVEROUTPUT ON;
EXEC pkg_users.insert_user('Leman','Huseynli','hlman9162@gmail.com','+994 70 818 9243','IT',2500);
EXEC pkg_users.insert_user('Nilufer','Memmedova','memmedova333@gmail.com','+994 51 245 5555','IT',3000);
EXEC pkg_users.insert_user('Roya','Eliyeva','roya111@gmail.com','+994 51 450 5050','IT',2300);
EXEC pkg_users.insert_user('Nazperi,'Rehimova','rahimova566@gmail.com','+994 51 450 5151','IT',2700);
EXEC pkg_users.insert_user('Jale','Abdullayeva','jaleabdullayeva@gmail.com','+994 55 470 3467','IT',3400);
EXEC pkg_users.insert_user('Elvina','Karimli','karimlielvina@gmail.com','+994 51 300 5151','SMM',1500);
EXEC pkg_users.insert_user('Konul','Aliyeva','aliyeva2004@gmail.com','+994 51 450 9854','MAN',2000);
EXEC pkg_users.insert_user('Fatime','Hesenova','fatime2345@gmail.com','+994 51 477 9877','BIZNES',3400);
EXEC pkg_users.insert_user('Lamiye','Abbasova','abbasova54@gmail.com','+994 51 450 6634','BIZNES',3400);
EXEC pkg_users.insert_user('Aysel','Salmanova','salmanova777@gmail.com','+994 51 760 7777','DESIGN',3400);
EXEC pkg_users.insert_user('Emiliya','Mahmudova','mahmudova@gmail.com','+994 51 885 6634','DESIGN',3400);
EXEC pkg_users.delete_user(19);
EXEC pkg_users.delete_user(12);
