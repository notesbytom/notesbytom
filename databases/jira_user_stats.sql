-- Attempt to rank Jira users by activity in current year (high number is more activity) --
-- This example assumes MySQL --
-- SUBSTITUTE your jira database name for "jiradb" below --
-- YEAR(...) returns a number, NOT a datetime --
USE jiradb;
SELECT
    user,
    -- person.display_name,
    IF(person.active,'','Inactive') AS inactive,
    IF(person.deleted_externally,'AD_Deleted','') AS ad_deleted,
    SUM(num) AS num
FROM
(
    SELECT author AS user, COUNT(*) AS num FROM jiraaction WHERE YEAR(CREATED) >= YEAR(CURDATE()) OR YEAR(UPDATED) >= YEAR(CURDATE()) GROUP BY author
    UNION ALL
    SELECT reporter AS user, COUNT(*) AS num FROM jiraissue WHERE YEAR(CREATED) >= YEAR(CURDATE()) OR YEAR(UPDATED) >= YEAR(CURDATE()) GROUP BY reporter
    UNION ALL
    SELECT assignee AS user, COUNT(*) AS num FROM jiraissue WHERE YEAR(CREATED) >= YEAR(CURDATE()) OR YEAR(UPDATED) >= YEAR(CURDATE()) GROUP BY assignee
    # UNION ALL
    # SELECT lead AS user, COUNT(*) AS num FROM project GROUP BY lead
    # UNION ALL
    # SELECT lead AS user, COUNT(*) AS num FROM component WHERE lead IS NOT NULL GROUP BY lead
) AS stat
LEFT JOIN cwd_user AS person ON stat.user = person.user_name
GROUP BY user, inactive, ad_deleted
ORDER BY num DESC
;
