CREATE OR REPLACE PACKAGE pkg_task_details AS
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
 PROCEDURE insert_task_template(
  p_template_id            task_template.template_ıd%type,
  p_template_name          task_template.template_name%type,
  p_template_description   task_template.template_descrıptıon%type
 );
 PROCEDURE update_task_template(
  p_template_id            task_template.template_ıd%type,
  p_template_name          task_template.template_name%type,
  p_template_description   task_template.template_descrıptıon%type
 );
 PROCEDURE delete_task_template(
  p_template_id            task_template.template_ıd%type
 );
  PROCEDURE insert_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type,
  p_task_id                task_template_assignment.task_ıd%type,
  p_template_id            task_template_assignment.template_ıd%type
 );
 PROCEDURE update_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type,
  p_task_id                task_template_assignment.task_ıd%type,
  p_template_id            task_template_assignment.template_ıd%type
 );
 PROCEDURE delete_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type
 );
  PROCEDURE insert_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type,
  p_task_id              time_tracking.task_ıd%type,
  p_start_time           time_tracking.start_tıme%type,
  p_end_time             time_tracking.end_tıme%type,
  p_duration_            time_tracking.duratıon_%type,
  p_user_id              time_tracking.user_ıd%type
 );
 PROCEDURE  update_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type,
  p_task_id              time_tracking.task_ıd%type,
  p_start_time           time_tracking.start_tıme%type,
  p_end_time             time_tracking.end_tıme%type,
  p_duration_            time_tracking.duratıon_%type,
  p_user_id              time_tracking.user_ıd%type
 );
 PROCEDURE delete_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type
 );
  PROCEDURE insert_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_task_id              progress_report.task_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type,
  p_notes                progress_report.notes%type,
  p_report_date_time     progress_report.report_date_tıme%type
 );
 PROCEDURE  update_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_task_id              progress_report.task_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type,
  p_notes                progress_report.notes%type,
  p_report_date_time     progress_report.report_date_tıme%type
 );
 PROCEDURE delete_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type
 );
 PROCEDURE  update_progress_percentage(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type
 );
 PROCEDURE insert_to_do_list(
  p_list_id           to_do_list.lıst_ıd%type,
  p_list_name         to_do_list.lıst_name%type,
  p_list_description  to_do_list.lıst_descrıptıon%type,
  p_user_id           to_do_list.user_ıd%type
 );
 PROCEDURE  update_to_do_list(
  p_list_id           to_do_list.lıst_ıd%type,
  p_list_name         to_do_list.lıst_name%type,
  p_list_description  to_do_list.lıst_descrıptıon%type,
  p_user_id           to_do_list.user_ıd%type
 );
 PROCEDURE delete_to_do_list(
   p_list_id          to_do_list.lıst_ıd%type
 );

 END pkg_task_details;
 
 
 CREATE OR REPLACE PACKAGE BODY pkg_task_details AS

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
      log_error('Task Dependency Insertion Error',sqlcode, sqlerrm);
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
       log_error('Task Dependency Update Error:',sqlcode,sqlerrm);
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
       log_error('Task Dependency Delete Error:',sqlcode,sqlerrm);
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
       log_error('Task Tag Insertion Error:',sqlcode,sqlerrm);
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
       log_error('Task Tag Update Error:',sqlcode,sqlerrm);
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
       log_error('Task Tag Delete Error:',sqlcode,sqlerrm);
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
       log_error('Task Tag Assignment Insertion Error:',sqlcode,sqlerrm);
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
        log_error('Task Tag Assignment Update Error:',sqlcode,sqlerrm);
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
        log_error('Task Tag Assignment Delete Error:',sqlcode,sqlerrm);
  END delete_task_tag_assignment;
  
  PROCEDURE insert_task_template(
  p_template_id            task_template.template_ıd%type,
  p_template_name          task_template.template_name%type,
  p_template_description   task_template.template_descrıptıon%type) AS
  
  BEGIN
    INSERT INTO task_template(template_ıd,template_name,template_descrıptıon)
    VALUES(p_template_id,p_template_name,p_template_description);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
        log_error('Task Template Insertion Error:',sqlcode,sqlerrm);
 END insert_task_template;
 
 PROCEDURE update_task_template(
  p_template_id            task_template.template_ıd%type,
  p_template_name          task_template.template_name%type,
  p_template_description   task_template.template_descrıptıon%type) AS
  
   BEGIN
    UPDATE task_template
       SET template_name=p_template_name,
           template_descrıptıon=p_template_description
          WHERE template_ıd=p_template_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Template Update Error:',sqlcode,sqlerrm);
 END update_task_template;
 
 PROCEDURE delete_task_template(
  p_template_id            task_template.template_ıd%type) AS
  
   BEGIN 
     DELETE FROM task_template
      WHERE template_ıd=p_template_id ;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
      log_error('Task Template Delete Error:',sqlcode,sqlerrm);
  END delete_task_template;
  
 PROCEDURE insert_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type,
  p_task_id                task_template_assignment.task_ıd%type,
  p_template_id            task_template_assignment.template_ıd%type) AS
   BEGIN
    INSERT INTO task_template_assignment(assıgnment_ıd,task_ıd,template_ıd)
    VALUES(p_assignment_id,p_task_id,p_template_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Template Assignment Insertion Error:',sqlcode,sqlerrm);
 END insert_task_template_assignment;
  
 PROCEDURE update_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type,
  p_task_id                task_template_assignment.task_ıd%type,
  p_template_id            task_template_assignment.template_ıd%type) AS
  
   BEGIN
    UPDATE task_template_assignment
       SET task_ıd=p_task_id,
           template_ıd=p_template_id
          WHERE assıgnment_ıd=p_assignment_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Template Assignment Update Error:',sqlcode,sqlerrm);
 END update_task_template_assignment;
  
 PROCEDURE delete_task_template_assignment(
  p_assignment_id          task_template_assignment.assıgnment_ıd%type) AS
   
  BEGIN 
     DELETE FROM task_template_assignment
      WHERE assıgnment_ıd=p_assignment_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       log_error('Task Template Assignment Delete Error:',sqlcode,sqlerrm);
  END delete_task_template_assignment;
  
  PROCEDURE insert_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type,
  p_task_id              time_tracking.task_ıd%type,
  p_start_time           time_tracking.start_tıme%type,
  p_end_time             time_tracking.end_tıme%type,
  p_duration_            time_tracking.duratıon_%type,
  p_user_id              time_tracking.user_ıd%type) AS

  BEGIN
    INSERT INTO time_tracking(tıme_trackıng_ıd,task_ıd,start_tıme,end_tıme,duratıon_,user_ıd)
    VALUES(p_time_tracking_id,p_task_id,p_start_time,p_end_time,p_duration_,p_user_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       log_error('Time Tracking Insertion Error:',sqlcode,sqlerrm);
 END insert_time_tracking;
 
 PROCEDURE update_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type,
  p_task_id              time_tracking.task_ıd%type,
  p_start_time           time_tracking.start_tıme%type,
  p_end_time             time_tracking.end_tıme%type,
  p_duration_            time_tracking.duration_%type,
  p_user_id              time_tracking.user_ıd%type) AS
  
   BEGIN
    UPDATE time_tracking
       SET task_ıd=p_task_id,
           start_tıme=p_start_time,
           end_tıme=p_end_time,
           duration_=p_duration_,
           user_ıd=p_user_id
          WHERE tıme_trackıng_ıd=p_time_tracking_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
      log_error('Time Tracking Update Error:',sqlcode,sqlerrm);
 END update_time_tracking;

  
 PROCEDURE delete_time_tracking(
  p_time_tracking_id     time_tracking.tıme_trackıng_ıd%type) AS
  
  BEGIN 
     DELETE FROM time_tracking
      WHERE tıme_trackıng_ıd=p_time_tracking_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       log_error('Time Tracking Delete Error:',sqlcode,sqlerrm);
  END delete_time_tracking;
  
 PROCEDURE insert_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_task_id              progress_report.task_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type,
  p_notes                progress_report.notes%type,
  p_report_date_time     progress_report.report_date_tıme%type) AS
  
  BEGIN
    INSERT INTO progress_report(progress_report_ıd,task_ıd,progress_percentage,notes,report_date_tıme)
    VALUES( p_progress_report_id, p_task_id,p_progress_percentage,p_notes,p_report_date_time);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
      log_error('Progress Report Insertion Error:',sqlcode,sqlerrm);
 END insert_progress_report;
 
 
 
 PROCEDURE  update_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_task_id              progress_report.task_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type,
  p_notes                progress_report.notes%type,
  p_report_date_time     progress_report.report_date_tıme%type) AS
  
   BEGIN
    UPDATE progress_report
       SET task_ıd=p_task_id,
           progress_percentage=p_progress_percentage,
           notes=p_notes,
           report_date_tıme=p_report_date_time
          WHERE progress_report_ıd=p_progress_report_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
      log_error('Progress Report Update Error:',sqlcode,sqlerrm);
 END update_progress_report;
 
 
 PROCEDURE delete_progress_report(
  p_progress_report_id   progress_report.progress_report_ıd%type) AS

 BEGIN 
     DELETE FROM progress_report
      WHERE progress_report_ıd=p_progress_report_id ;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       log_error('Progress Report Delete Error:',sqlcode,sqlerrm);
  END delete_progress_report;
  
  
  
  PROCEDURE  update_progress_percentage(
  p_progress_report_id   progress_report.progress_report_ıd%type,
  p_progress_percentage  progress_report.progress_percentage%type) AS
   
   BEGIN
    UPDATE progress_report
       SET  progress_percentage=p_progress_percentage
          WHERE progress_report_ıd=p_progress_report_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('Progress Percentage Update Error:'||SQLERRM);
 END update_progress_percentage;
 
 PROCEDURE insert_to_do_list(
  p_list_id           to_do_list.lıst_ıd%type,
  p_list_name         to_do_list.lıst_name%type,
  p_list_description  to_do_list.lıst_descrıptıon%type,
  p_user_id           to_do_list.user_ıd%type) AS
  
   BEGIN
    INSERT INTO to_do_list(lıst_ıd,lıst_name,lıst_descrıptıon,user_ıd)
    VALUES( p_list_id,p_list_name,p_list_description,p_user_id);
    COMMIT;          
     EXCEPTION
   WHEN OTHERS THEN
     ROLLBACK;
       raise_error('To Do List Insertion Error:'||SQLERRM);
 END insert_to_do_list;
 
 
 PROCEDURE  update_to_do_list(
  p_list_id           to_do_list.lıst_ıd%type,
  p_list_name         to_do_list.lıst_name%type,
  p_list_description  to_do_list.lıst_descrıptıon%type,
  p_user_id           to_do_list.user_ıd%type) AS
  
   BEGIN
    UPDATE to_do_list
       SET  lıst_name=p_list_name,
            lıst_descrıptıon=p_list_description,
            user_ıd=p_user_id
          WHERE lıst_ıd=p_list_id;
    COMMIT;
 EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('To Do List Update Error:'||SQLERRM);
 END update_to_do_list;
 
 
 PROCEDURE delete_to_do_list(
   p_list_id           to_do_list.lıst_ıd%type) AS
   
    BEGIN 
     DELETE FROM to_do_list
      WHERE lıst_ıd=p_list_id;
     COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
     ROLLBACK;
       raise_error('To Do List Delete Error:'||SQLERRM);
  END delete_to_do_list;
 
END pkg_task_details;

 
 
