CREATE OR REPLACE PACKAGE pkg_tasks AS
  PROCEDURE insert_task(
  p_task_id             task.task_ıd%type,
  p_title               task.tıtle%type,
  p_description         task.descrıptıon%type,
  p_deadline            task.deadlıne%type,
  p_status              task.status%type,
  p_priority            task.prıorıty%type,
  p_creator_user_id     task.creator_user_ıd%type,
  p_assigned_to_user_id task.assıgned_to_user_ıd%type
 );
 PROCEDURE update_task(
  p_task_id             task.task_ıd%type,
  p_title               task.tıtle%type,
  p_description         task.descrıptıon%type,
  p_deadline            task.deadlıne%type,
  p_status              task.status%type,
  p_priority            task.prıorıty%type,
  p_creator_user_id     task.creator_user_ıd%type,
  p_assigned_to_user_id task.assıgned_to_user_ıd%type
  );
  PROCEDURE delete_task(
   p_task_id             task.task_ıd%type);
END pkg_tasks;

CREATE OR REPLACE PACKAGE BODY pkg_tasks AS

  PROCEDURE insert_task(
    p_task_id             task.task_ıd%type,
    p_title               task.tıtle%type,
    p_description         task.descrıptıon%type,
    p_deadline            task.deadlıne%type,
    p_status              task.status%type,
    p_priority            task.prıorıty%type,
    p_creator_user_id     task.creator_user_ıd%type,
    p_assigned_to_user_id task.assıgned_to_user_ıd%type) AS
  BEGIN
    INSERT INTO task(task_ıd,tıtle,descrıptıon,deadlıne,status,prıorıty,creator_user_ıd,assıgned_to_user_ıd)
    VALUES(p_task_id,p_title,p_description,p_deadline,p_status,p_priority,p_creator_user_id,p_assigned_to_user_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Insertion Error',sqlcode, sqlerrm);
  END insert_task;

  PROCEDURE update_task(
    p_task_id             task.task_ıd%type,
    p_title               task.tıtle%type,
    p_description         task.descrıptıon%type,
    p_deadline            task.deadlıne%type,
    p_status              task.status%type,
    p_priority            task.prıorıty%type,
    p_creator_user_id     task.creator_user_ıd%type,
    p_assigned_to_user_id task.assıgned_to_user_ıd%type) AS
  BEGIN 
    UPDATE task
     SET tıtle=p_title,
        descrıptıon=p_description,
        deadlıne=p_deadline,
        status=p_status,
        prıorıty=p_priority,
        creator_user_ıd=p_creator_user_id,
        assıgned_to_user_ıd=p_assigned_to_user_id
    WHERE
        task_ıd = p_task_id;
    COMMIT;
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Update Error',sqlcode, sqlerrm);
  END update_task;
   PROCEDURE delete_task(
   p_task_id             task.task_ıd%type) AS
    BEGIN
     DELETE FROM task 
      WHERE task_ıd=p_task_id ;
           EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Delete Error',sqlcode, sqlerrm);
    END delete_task;
END pkg_tasks;
