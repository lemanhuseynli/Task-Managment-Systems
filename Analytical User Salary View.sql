CREATE OR REPLACE VIEW AnalyticalUserSalary AS
SELECT
    u.User_Id,
    u.First_Name || ' ' || u.Last_Name AS Full_Name,
    u.Salary AS Base_Salary,
    t.Deadline,
    t.Status,
    CASE
        WHEN t.Deadline >= SYSDATE THEN u.Salary
        ELSE u.Salary * 1.1
    END AS Adjusted_Salary,
    CASE
        WHEN t.Status = 'Completed' THEN 'Completed On Time'
        WHEN t.Status = 'Completed' AND t.Deadline < SYSDATE THEN 'Completed Late'
        WHEN t.Status = 'In Progress' THEN 'In Progress'
        ELSE 'Open'
    END AS Task_Status,
    RANK() OVER (ORDER BY t.Deadline) AS Task_Deadline_Rank
FROM
    Users u
JOIN
    Task t ON u.User_Id = t.Assigned_To_User_Id;
