--normalize college dataset by BCNF
DROP TABLE IF EXISTS college_employment_statistics;
DROP TABLE IF EXISTS college_earnings;
CREATE TABLE college_employment_statistics AS 
    SELECT major_code, major, employed_count, employed_count_full_time_year_round, unemployed_count, unemployement_rate
    FROM college;
ALTER TABLE college_employment_statistics ADD PRIMARY KEY (major_code);

CREATE TABLE college_earnings AS 
    SELECT major_code, major,major_category, total_count, median_earnings, p25th_earnings, p75th_earnings
    FROM college;
ALTER TABLE college_earnings ADD PRIMARY KEY(major, major_code);
DROP TABLE college;

/* remove price since it is 72% null*/
--SELECT COUNT(*) AS rows, COUNT(*) - COUNT(price) AS num_nulls_price, (COUNT(*) - COUNT(price)::FLOAT) / COUNT(*) * 100 AS percentage_null FROM space_missions;
ALTER TABLE space_missions DROP COLUMN price;
ALTER TABLE astronaut DROP COLUMN alma_mater;

-- normalize space-missions
ALTER TABLE space_missions ADD COLUMN id SERIAL;
ALTER TABLE space_missions ADD PRIMARY KEY (id, company, mission_name);

DROP TABLE IF EXISTS rocket_info;
CREATE TABLE rocket_info AS 
    SELECT id, company, mission_name, rocket, rocket_status
    FROM space_missions;
ALTER TABLE rocket_info ADD PRIMARY KEY (id, company, mission_name, rocket);

DROP TABLE IF EXISTS mission_info;
CREATE TABLE mission_info AS
    SELECT id, company, mission_name, location, launch_time, launch_date, rocket, mission_status
    FROM space_missions;
ALTER TABLE mission_info ADD PRIMARY KEY (id, company);
   

-- normalize astronaut 
DROP TABLE IF EXISTS astronaut_v2;
CREATE TABLE astronaut_v2 AS 
    SELECT name, 
        year_selected,
        group_number,
        status,
        birth_date,
        birth_place,
        gender,
        ugrad_major,
        grad_major,
        military_rank,
        military_branch,
        space_flights,
        space_flights_hr,
        space_walks,
        space_walks_hr,
        LTRIM(unnest(string_to_array(missions, ','))) AS mission,
        death_date,
        death_mission
    FROM astronaut;
DROP TABLE astronaut;

ALTER TABLE astronaut_v2 ADD COLUMN id SERIAL;
ALTER TABLE astronaut_v2 ADD PRIMARY KEY (id, name);

-- SELECT name, mission, mission_name, launch_date, ugrad_major 
-- FROM astronaut_v2 AS a JOIN space_missions AS s ON levenshtein(a.mission, s.mission_name) < 5; 
-- ask amelia to add fuzzystrmatch to s23_group48 schema so I can easily match mission names to each other based on levenshtein distance
