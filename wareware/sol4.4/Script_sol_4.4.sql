select percentile_disc(0.5) within group (order by end_date) 
from assignments 
where (DATE '2022-03-01', DATE '2022-03-31') OVERLAPS (start_date, end_date)