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

-- normalize space-missions
-- normalize astronaut 
ALTER TABLE astronaut ADD COLUMN id SERIAL;
ALTER TABLE astronaut ADD PRIMARY KEY (id);

ALTER TABLE college ADD PRIMARY KEY (major_code);
ALTER TABLE space_missions ADD COLUMN id SERIAL;
ALTER TABLE space_missions ADD PRIMARY KEY (id);