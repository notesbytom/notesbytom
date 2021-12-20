-- example query to review Confluence user content-creation activity over the current year
-- a number is assigned to estimate number of creation-interactions by each user
-- this example assumes MySQL database, replace "confluence" with your confluence-database-name

use confluence;

select 
  um.username, 
  SUM(stat.howMany) as how_many 
FROM 
  (
    select creator as user_key,count(*) as howMany from CONTENT where YEAR(creationdate) >= YEAR(CURDATE()) group by creator 
    UNION ALL 
    select lastmodifier as user_key,count(*) as howMany from CONTENT where YEAR(lastmoddate) >= YEAR(CURDATE()) group by lastmodifier
  ) AS stat 
  JOIN user_mapping um 
  ON stat.user_key = um.user_key 
group by 
  stat.user_key 
having 
  how_many > 1 
order by 
  how_many desc
;
