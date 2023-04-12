/* allow access to all tables for everyone in group*/
ALTER TABLE IF EXISTS s23_group48.astronaut OWNER TO s23_group48;
ALTER TABLE IF EXISTS s23_group48.college OWNER TO s23_group48; --skips anyways
ALTER TABLE IF EXISTS s23_group48.space_missions OWNER TO s23_group48;
ALTER TABLE IF EXISTS s23_group48.college_employment_statistics OWNER TO s23_group48;
ALTER TABLE IF EXISTS s23_group48.college_earnings OWNER TO s23_group48;