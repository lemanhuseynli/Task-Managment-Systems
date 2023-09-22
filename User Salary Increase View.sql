CREATE OR REPLACE VIEW UserSalaryIncrease AS
SELECT
    u.User_Id,
    u.First_Name || ' ' || u.Last_Name AS Full_Name,
    CASE
        WHEN t.Deadline >= SYSDATE THEN u.Salary
          -- If the deadline has not yet come, the salary will not change
        ELSE u.Salary * 1.1
          -- If the deadline has passed, the salary is increased by 10%
    END AS Salary,
    t.Deadline,
    t.Status
FROM
    Users u
JOIN
    Task t 
     ON u.User_Id = t.Assigned_To_User_Id;
     
