CREATE OR REPLACE PACKAGE pkg_users AS
 
 PROCEDURE insert_user(
  p_first_name   users.fırst_name%type,
  p_last_name    users.last_name%type,
  p_email        users.emaıl%type,
  p_phone_number users.phone_number%type,
  p_job_id       users.job_ıd%type,
  p_salary       users.salary%type);
 
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
/
CREATE OR REPLACE PACKAGE BODY pkg_users AS
  PROCEDURE insert_user(
    p_first_name  users.fırst_name%type,
    p_last_name   users.last_name%type,
    p_email       users.emaıl%type,
    p_phone_number users.phone_number%type,
    p_job_id      users.job_ıd%type,
    p_salary      users.salary%type) AS
  BEGIN 
    INSERT INTO users(fırst_name,last_name, emaıl, phone_number, job_ıd, salary)
    VALUES(p_first_name, p_last_name, p_email, p_phone_number, p_job_id, p_salary);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      log_error(' User Insertion Error',sqlcode, sqlerrm);
  END insert_user;

  PROCEDURE update_user( 
    p_user_id    users.user_ıd%type,
    p_first_name users.fırst_name%type,
    p_last_name  users.last_name%type,
    p_email      users.emaıl%type,
    p_phone_number users.phone_number%type,
    p_job_id       users.job_ıd%type,
    p_salary       users.salary%type) AS
  BEGIN 
    UPDATE users
    SET
      fırst_name = p_first_name,
      last_name = p_last_name,
      emaıl = p_email,
      phone_number = p_phone_number,
      job_ıd = p_job_id,
      salary = p_salary
    WHERE
      user_ıd = p_user_id;
    COMMIT;
  EXCEPTION 
    WHEN OTHERS THEN
     log_error('User Update Error',sqlcode, sqlerrm);
  END update_user;

  PROCEDURE delete_user(
    p_user_id users.user_ıd%type) AS
  BEGIN
    DELETE FROM users
    WHERE user_ıd = p_user_id;
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      log_error('User Delete Error',sqlcode, sqlerrm);
  END delete_user;
END PKG_USERS;

