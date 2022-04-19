select ceil(sum(dif)) as total_hours from (
	select start_date ,end_date ,
	case 
		when start_date <= ('2022-03-01'::timestamp) and end_date >= ('2022-03-31'::timestamp) then (date_part('days', '2021-03-31'::timestamp  - '2021-03-01'::timestamp) - 8) * 8
		when start_date <= ('2022-03-01'::timestamp) and end_date < ('2022-03-31'::timestamp) then (date_part('days', end_date  - '2022-03-01'::timestamp) - (30 / date_part('days', end_date  - '2022-03-01'::timestamp)))*8
		when start_date >= ('2022-03-01'::timestamp) and end_date >= ('2022-03-31'::timestamp) then (date_part('days', '2021-03-31'::timestamp  - start_date )-8) *8
	end as dif
	from assignments 
	where (DATE '2022-03-01', DATE '2022-03-31') OVERLAPS (start_date, end_date)
) as sum_hours
