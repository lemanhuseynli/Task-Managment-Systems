This report shows the time spent on each task and which user is tracking time.
CREATE OR REPLACE VIEW TimeTrackingReport AS
SELECT
    t.Task_Id,
    t.Title,
    tt.Start_Time,
    tt.End_Time,
    tt.Duration_,
    u.First_Name || ' ' || u.Last_Name AS Tracked_By
FROM
    Time_Tracking tt
JOIN
    Task t ON tt.Task_Id = t.Task_Id
JOIN
    Users u ON tt.User_Id = u.User_Id;
