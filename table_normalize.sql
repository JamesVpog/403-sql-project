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
ALTER TABLE astronaut DROP COLUMN college;

-- normalize space-missions
ALTER TABLE space_missions ADD COLUMN id SERIAL;
ALTER TABLE space_missions ADD PRIMARY KEY (id, company, mission_name);

-- normalize astronaut 
ALTER TABLE astronaut ADD COLUMN id SERIAL;
ALTER TABLE astronaut ADD PRIMARY KEY (id);

