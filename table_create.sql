SET search_path to s23_group48;

/* dataset creation */
DROP TABLE IF EXISTS astronaut;

DROP TABLE IF EXISTS college;

DROP TABLE IF EXISTS space_missions;

CREATE TABLE astronaut(
    name TEXT,
    year_selected NUMERIC(4,0),
    group_number NUMERIC(2,0),
    status TEXT,
    birth_date DATE,
    birth_place TEXT,
    gender TEXT CHECK ( gender in ('Female', 'Male')),
    alma_mater TEXT,
    ugrad_major TEXT,
    grad_major TEXT,
    military_rank TEXT,
    military_branch TEXT,
    space_flights integer,
    space_flights_hr integer,
    space_walks integer,
    space_walks_hr REAL,
    missions TEXT,
    death_date DATE,
    death_mission TEXT
);

CREATE TABLE college(
    major_code NUMERIC(4,0),
    major TEXT,
    major_category TEXT,
    total_count integer,
    employed_count integer,
    employed_count_full_time_year_round integer,
    unemployed_count integer,
    unemployement_rate double precision,
    median_earnings integer,
    p25th_earnings integer,
    p75th_earnings integer
);

CREATE TABLE space_missions(
    company TEXT,
    location TEXT,
    launch_date DATE,
    launch_time TIME,
    rocket TEXT,
    mission_name TEXT,
    rocket_status TEXT CHECK (rocket_status IN ('Retired', 'Active')),
    price TEXT, 
    mission_status TEXT
);