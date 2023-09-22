--Completion Rates of Tasks: A view showing the completion rates of tasks. This view calculates the completion percentage of each task.
CREATE OR REPLACE VIEW TaskCompletionRate AS
SELECT
    t.Task_Id,
    t.Title,
    t.Description,
    t.Status,
    COUNT(pr.Progress_Report_Id) AS Completed_Reports,
    COUNT(pr.Progress_Report_Id) / COUNT(t.Task_Id) AS Completion_Rate
FROM
    Task t
LEFT JOIN
    Progress_Report pr ON t.Task_Id = pr.Task_Id
GROUP BY
    t.Task_Id, t.Title, t.Description, t.Status;
