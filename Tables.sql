
CREATE TABLE Users(
 User_Id         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 First_Name      VARCHAR2(100) NOT NULL,
 Last_Name       VARCHAR2(100) NOT NULL,
 Email           VARCHAR2(100) NOT NULL UNIQUE,
 Phone_Number    VARCHAR2(100) NOT NULL UNIQUE,
 Job_Id          VARCHAR2(20) NOT NULL,
 Salary          NUMBER
 );
CREATE TABLE Task(
 Task_Id                 NUMBER PRIMARY KEY,
 Title                   VARCHAR2(100) NOT NULL,
 Description             VARCHAR2(1000),
 Deadline                DATE NOT NULL,
 Status                  VARCHAR2(100) NOT NULL,
 Priority                VARCHAR2(100),
 Creator_User_Id         NUMBER,
 Assigned_To_User_Id     NUMBER
 );
 
 ALTER TABLE Task 
 ADD CONSTRAINT chk_task_status CHECK(Status IN ('Open','In Progress','Completed'));

 ALTER TABLE Task
 ADD CONSTRAINT fk_creator_user_id
 FOREIGN KEY (Creator_User_Id)
 REFERENCES Users(User_Id);

 ALTER TABLE Task
 ADD CONSTRAINT fk_assigned_to_User_id
 FOREIGN KEY (Assigned_To_User_Id)
 REFERENCES Users(User_Id);
 
CREATE TABLE Task_Dependency(
 Dependency_Id    NUMBER PRIMARY KEY,
 Parent_Task_Id   NUMBER,
 Sub_Task_Id      NUMBER
 );
 
 ALTER TABLE Task_Dependency
 ADD CONSTRAINT fk_parent_task_id
 FOREIGN KEY (Parent_Task_Id)
 REFERENCES Task(Task_Id);

 ALTER TABLE Task_Dependency
 ADD CONSTRAINT fk_sub_task_id
 FOREIGN KEY (Sub_Task_Id)
 REFERENCES Task(Task_Id);
 
CREATE TABLE Task_Tag(
 Tag_Id      NUMBER PRIMARY KEY,
 Tag_Name    VARCHAR2(100) UNIQUE
 );

CREATE TABLE Task_Tag_Assignment(
 Assignment_Id NUMBER PRIMARY KEY,
 Task_Id      NUMBER,
 Tag_Id       NUMBER
 );
 
 ALTER TABLE Task_Tag_Assignment
 ADD CONSTRAINT fk_task_id
 FOREIGN KEY (Task_Id)
 REFERENCES Task(Task_ID);
 
 ALTER TABLE Task_Tag_Assignment
 ADD CONSTRAINT fk_tag_id
 FOREIGN KEY (Tag_Id)
 REFERENCES Task_Tag(Tag_ID);
 
CREATE TABLE Task_Notification(
 Notification_Id         NUMBER PRIMARY KEY,
 Task_Id                 NUMBER,
 User_Id                 NUMBER,
 Notification_Message    VARCHAR2(1000),
 Notification_Date_Time  DATE
);

 ALTER TABLE Task_Notification
 ADD CONSTRAINT fk_task_notification_id 
 FOREIGN KEY (Task_Id)
 REFERENCES Task(Task_Id);
 
 ALTER TABLE Task_Notification
 ADD CONSTRAINT fk_user_notification_id 
 FOREIGN KEY (User_Id)
 REFERENCES Users(User_Id);
 
 CREATE TABLE Task_Template(
 Template_Id           NUMBER PRIMARY KEY,
 Template_Name         VARCHAR2(100),
 Template_Description  VARCHAR2(1000)
 );
 
CREATE TABLE Task_Template_Assignment(
 Assignment_Id         NUMBER PRIMARY KEY,
 Task_Id               NUMBER,
 Template_Id           NUMBER
 );
 
 ALTER TABLE Task_Template_Assignment
 ADD CONSTRAINT fk_template_task_id 
 FOREIGN KEY (Task_Id)
 REFERENCES Task(Task_Id);
 
 ALTER TABLE Task_Template_Assignment
 ADD CONSTRAINT fk_template__id 
 FOREIGN KEY (Template_Id)
 REFERENCES Task_Template(Template_Id);
 
 CREATE TABLE Time_Tracking(
 Time_Tracking_Id      NUMBER PRIMARY KEY,
 Task_Id               NUMBER,
 Start_Time            DATE,
 End_Time              DATE,
 Duration_             NUMBER,
 User_Id               Number
 );
 
 ALTER TABLE Time_Tracking
 ADD CONSTRAINT fk_time_tracking_task_id 
 FOREIGN KEY (Task_Id)
 REFERENCES Task(Task_Id);
 
 ALTER TABLE Time_Tracking
 ADD CONSTRAINT fk_time_tracking_user_id 
 FOREIGN KEY (User_Id)
 REFERENCES Users(User_Id);
 
 CREATE TABLE Progress_Report(
 Progress_Report_Id     NUMBER PRIMARY KEY,
 Task_Id                NUMBER,
 Progress_Percentage    VARCHAR2(10),
 Notes                  VARCHAR2(1000),
 Report_Date_Time       DATE
 );
 
 ALTER TABLE Progress_Report
 ADD CONSTRAINT fk_progress_task_id 
 FOREIGN KEY (Task_Id)
 REFERENCES Task(Task_Id);
 
 CREATE TABLE To_Do_List(
 List_Id               NUMBER PRIMARY KEY,
 List_Name             VARCHAR2(100),
 List_Description      VARCHAR2(1000),
 User_Id           NUMBER
 );
 
 ALTER TABLE To_Do_List
 ADD CONSTRAINT fk_to_do_list_user_id 
 FOREIGN KEY (User_Id)
 REFERENCES Users(User_Id);
 

