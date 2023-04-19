-- SELECT name, mission, mission_name, launch_date, ugrad_major 
-- FROM astronaut_v2 AS a JOIN mission_info AS s ON a.mission = s.mission_name
-- levenshtein(a.mission, s.mission_name) < 5; 
-- ask amelia to add fuzzystrmatch to s23_group48 schema so I can easily match mission names to each other based on levenshtein distance

-- 
SELECT major, ugrad_major, name, e.unemployement_rate
FROM college_employment_statistics AS e 
    JOIN astronaut_v2 AS a ON lower(e.major) = lower(a.ugrad_major);