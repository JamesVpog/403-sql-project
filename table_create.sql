
/* first dataset creation */
DROP TABLE IF EXISTS astronaut;

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

/* \copy astronaut FROM 'astroworld.csv' WITH ( format csv, header); */