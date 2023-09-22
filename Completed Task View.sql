--This report shows details of completed tasks and which user completed them.
CREATE OR REPLACE VIEW CompletedTasks AS
SELECT
    t.Task_Id,
    t.Title,
    t.Description,
    t.Deadline,
    t.Status,
    u.First_Name || ' ' || u.Last_Name AS Completed_By
FROM
    Task t
JOIN
    Users u ON t.Assigned_To_User_Id = u.User_Id
WHERE
    t.Status = 'Completed';
    
