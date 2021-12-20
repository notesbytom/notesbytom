-- list recent Confluence user logins within the current year
-- replace "confluence" with your confluence-database-name
-- MySQL is assumed for this query example
-- See also: https://confluence.atlassian.com/confkb/how-to-identify-inactive-users-in-confluence-214335880.html

USE confluence;

select 
  SUCCESSDATE,
  PREVSUCCESSDATE,
  um.username 
from 
  logininfo li 
  JOIN user_mapping um 
  ON li.username = um.user_key 
where 
  YEAR(SUCCESSDATE) >= YEAR(CURDATE()) 
order by 
  SUCCESSDATE desc;
  
