SELECT  name , handle  FROM users 
WHERE id in(select  user_id  FROM user_skills
	WHERE skill_id = 1 AND (level ='competent' OR level ='proficent' OR level ='expert')  
OR skill_id = 13
GROUP BY user_id 
HAVING COUNT(*)>1) AND enabled = 't';



