CREATE OR REPLACE VIEW UserSalaryIncrease AS
SELECT
    u.User_Id,
    u.First_Name || ' ' || u.Last_Name AS Full_Name,
    CASE
        WHEN t.Deadline >= SYSDATE THEN
            CASE
                WHEN COUNT(t.Task_Id) >= 5 THEN u.Salary * 1.1 
                 -- If the deadline has not yet arrived and the number of missions is 5 or more, the salary is increased by 10%
                ELSE u.Salary
            END
        ELSE u.Salary
    END AS Salary,
    t.Deadline,
    t.Status
FROM
    Users u
LEFT JOIN
    Task t ON u.User_Id = t.Assigned_To_User_Id
GROUP BY
    u.User_Id, u.First_Name, u.Last_Name, u.Salary, t.Deadline, t.Status;
