--join grabs 715 out of 846 astronaut rows
SELECT name, mission, mission_name 
FROM 
    astronaut_v2 AS a 
    JOIN mission_info AS s ON a.mission = s.mission_name; 

-- levenshtein(a.mission, s.mission_name) < 5;
-- ask amelia to add fuzzystrmatch to s23_group48 schema so I can easily match mission names to each other based on levenshtein distance
-- dont need levenshtein, muddles results
-- 

EXPLAIN ANALYZE
SELECT COUNT(*), ugrad_major, unemployement_rate
FROM college_employment_statistics AS e 
    JOIN astronaut_v2 AS a ON lower(e.major) = lower(a.ugrad_major)
GROUP BY ugrad_major, unemployement_rate
ORDER BY COUNT(*) DESC;

CREATE INDEX astronaut_v2_major_index ON astronaut_v2(ugrad_major);

EXPLAIN ANALYZE
SELECT COUNT(*), ugrad_major, unemployement_rate
FROM college_employment_statistics AS e 
    JOIN astronaut_v2 AS a ON lower(e.major) = lower(a.ugrad_major)
GROUP BY ugrad_major, unemployement_rate
ORDER BY COUNT(*) DESC;

-- derek business question
SELECT COUNT(*)
FROM  
    (SELECT name, DATE_PART('year', launch_date) - DATE_PART('year', birth_date) AS age
    FROM 
        astronaut_v2 AS a 
        JOIN mission_info AS s ON a.mission = s.mission_name
    WHERE DATE_PART('year', launch_date) - DATE_PART('year', birth_date) > 50) as cte;