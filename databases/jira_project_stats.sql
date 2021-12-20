-- Attempt to rank Jira projects by activity in current year (high number is more activity) --
-- This example assumes MySQL --
-- SUBSTITUTE your jira database name for "jiradb" below --
-- YEAR(...) returns a number, NOT a datetime --
USE jiradb;
SELECT
    p.pkey,
    p.pname,
    SUM(stat.howMANY) AS howMANY
FROM
((SELECT
    i.PROJECT,
    COUNT(*) AS howMANY
FROM
    jiraissue AS i
WHERE
    YEAR(i.CREATED) >= YEAR(CURDATE())
    OR YEAR(i.UPDATED) >= YEAR(CURDATE())
GROUP BY i.PROJECT)
UNION ALL
(SELECT
    i.PROJECT,
    COUNT(*) AS howMANY
FROM
    jiraaction AS a
    JOIN jiraissue AS i
    ON a.issueid = i.ID
WHERE
    YEAR(a.CREATED) >= YEAR(CURDATE())
    OR YEAR(a.UPDATED) >= YEAR(CURDATE())
GROUP BY
    i.PROJECT)) AS stat
JOIN project AS p
    ON stat.PROJECT = p.ID
GROUP BY
    p.pkey, p.pname
ORDER BY howMANY DESC
;
