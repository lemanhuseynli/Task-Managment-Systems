CREATE OR REPLACE PACKAGE pkg_task_details AS
 PROCEDURE raise_error(p_error_message VARCHAR2);
  
 PROCEDURE insert_task_dependency(
  p_dependency_id    task_dependency.dependency_ıd%type,
  p_parent_task_id   task_dependency.parent_task_ıd%type,
  p_sub_task_id      task_dependency.sub_task_ıd%type
 );
 PROCEDURE update_task_dependency(
  p_dependency_id    task_dependency.dependency_ıd%type,
  p_parent_task_id   task_dependency.parent_task_ıd%type,
  p_sub_task_id      task_dependency.sub_task_ıd%type
 );
 PROCEDURE delete_task_dependency(
  p_dependency_id    task_dependency.dependency_ıd%type
 );
 PROCEDURE insert_task_tag(
  p_tag_id           task_tag.tag_ıd%type,
  p_tag_name         task_tag.tag_name%type
 );
 PROCEDURE update_task_tag(
  p_tag_id           task_tag.tag_ıd%type,
  p_tag_name         task_tag.tag_name%type
 );
 PROCEDURE delete_task_tag(
  p_tag_id           task_tag.tag_ıd%type
 );
 PROCEDURE insert_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type,
  p_task_id          task_tag_assignment.task_ıd%type,
  p_tag_id           task_tag_assignment.tag_ıd%type
 );
 PROCEDURE update_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type,
  p_task_id          task_tag_assignment.task_ıd%type,
  p_tag_id           task_tag_assignment.tag_ıd%type
 );
 PROCEDURE delete_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type
 );
 END pkg_task_details;
 
 
 CREATE OR REPLACE PACKAGE BODY pkg_task_details AS
  PROCEDURE raise_error(p_error_message VARCHAR2) AS
   BEGIN
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20000, p_error_message);
  END raise_error;

 PROCEDURE insert_task_dependency(
  p_dependency_id    task_dependency.dependency_ıd%type,
  p_parent_task_id   task_dependency.parent_task_ıd%type,
  p_sub_task_id      task_dependency.sub_task_ıd%type
   ) AS
  BEGIN
    INSERT INTO task_dependency(dependency_ıd,parent_task_ıd,sub_task_ıd)
    VALUES(p_dependency_id,p_parent_task_id,p_sub_task_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Dependency Insertion Error:'||SQLERRM);
  END insert_task_dependency;
  
  PROCEDURE update_task_dependency(
   p_dependency_id    task_dependency.dependency_ıd%type,
   p_parent_task_id   task_dependency.parent_task_ıd%type,
   p_sub_task_id      task_dependency.sub_task_ıd%type
   ) AS
   BEGIN
    UPDATE task_dependency
       SET parent_task_ıd=p_parent_task_id,
            sub_task_ıd=p_sub_task_id
          WHERE dependency_ıd=p_dependency_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Dependency Update Error:'||SQLERRM);
 END update_task_dependency;
 
  PROCEDURE delete_task_dependency(
   p_dependency_id    task_dependency.dependency_ıd%type) AS
    BEGIN 
     DELETE FROM task_dependency 
      WHERE  dependency_ıd=p_dependency_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Dependency Delete Error:'||SQLERRM);
 END delete_task_dependency;
 
 
 PROCEDURE insert_task_tag(
  p_tag_id           task_tag.tag_ıd%type,
  p_tag_name         task_tag.tag_name%type) AS
 
 BEGIN
    INSERT INTO task_tag(tag_ıd,tag_name)
    VALUES(p_tag_id,p_tag_name);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Insertion Error:'||SQLERRM);
 END insert_task_tag;
 
 PROCEDURE update_task_tag(
  p_tag_id           task_tag.tag_ıd%type,
  p_tag_name         task_tag.tag_name%type) AS
  
   BEGIN
    UPDATE task_tag
       SET tag_name=p_tag_name
          WHERE tag_ıd=p_tag_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Update Error:'||SQLERRM);
 END update_task_tag;
  
 PROCEDURE delete_task_tag(
  p_tag_id           task_tag.tag_ıd%type)AS
 BEGIN 
     DELETE FROM task_tag 
      WHERE  tag_ıd=p_tag_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Delete Error:'||SQLERRM);
  END delete_task_tag;
  
  PROCEDURE insert_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type,
  p_task_id          task_tag_assignment.task_ıd%type,
  p_tag_id           task_tag_assignment.tag_ıd%type) AS
  
  BEGIN
    INSERT INTO task_tag_assignment(assıgnment_ıd,task_ıd,tag_ıd)
    VALUES(p_assignment_id,p_task_id,p_tag_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Assignment Insertion Error:'||SQLERRM);
 END insert_task_tag_assignment;
  
 PROCEDURE update_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type,
  p_task_id          task_tag_assignment.task_ıd%type,
  p_tag_id           task_tag_assignment.tag_ıd%type) AS
  
   BEGIN
    UPDATE task_tag_assignment
       SET task_ıd=p_task_id,
           tag_ıd=p_tag_id
          WHERE assıgnment_ıd=p_assignment_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Assignment Update Error:'||SQLERRM);
 END update_task_tag_assignment;
 
 PROCEDURE delete_task_tag_assignment(
  p_assignment_id    task_tag_assignment.assıgnment_ıd%type) AS
  
   BEGIN 
     DELETE FROM task_tag_assignment 
      WHERE  assıgnment_ıd=p_assignment_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Task Tag Assignment Delete Error:'||SQLERRM);
  END delete_task_tag_assignment;
END pkg_task_details;

 
 
