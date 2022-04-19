select name, handle from (
	SELECT user_id, COUNT (skill_id) as num_skills
	FROM user_skills
	GROUP BY user_id 
	order by num_skills asc 
	limit 10 ) as foo, users 
where foo.user_id =  users.id and  users.enabled = 't';




