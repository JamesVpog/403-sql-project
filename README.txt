How to reproduce data
'run.txt' reproduces the entire s23_group48 database on codd. Running this in codd will create the normalized tables, as 'run.txt' itself executes three .sql files and one .txt file.
Simply typing '\i run.txt' in codd is sufficient to reproduce the tables. (The 'ownership.sql' file may need to be removed from 'run.txt' for grading purposes. More on that below.) 

The rest of this README goes into detail as to what each file does, as well as the python scripts (fix.py is not necessary to be run, but connect.py gets the data visualization). 
In order of execution, these files are:

table_create.sql
This handles the creation of all initial tables (note all of these tables are actually dropped later on during the normalization process). One thing to note is that
it sets the user's search path to 's23_group48'. If this is not desired for grading purposes, this can be commented out (it is the first line in the file). Three
tables are created: astronaut, college, and space_missions.

copy_cmds.txt
This file handles the copying of the dataset information into the created tables from 'table_create.sql'. It also includes the transaction portion of the project as
outlined in the report. This file originally used the unmodified datasets; however, 'fix.py' was the Python script executed to create the new datasets. This was done
for normalization purposes. Thus, the file uses the second iteration of the astronaut dataset and the third iteration of the space missions dataset.

table_normalize.sql
This file handles all of the queries used to normalize (BCNF) the tables: creating new tables, adding primary and foreign keys, adding id attributes, and dropping
the old tables. Notably, 'college' is split into two tables: 'college_employment_statistics' and 'college_earnings'. 'space_missions' is split into two tables:
'mission_info' and 'rocket_info'. 'astronaut' is turned into the 'astronaut_v2' table.

ownership.sql
This file sets the ownership of all created tables to members of 's23_group48'. For grading purposes, this file may not be necessary to run (especially since the
grader is not a part of the s23_group48 group). Thus, it can be removed from 'run.txt' if deemed necessary; all the tables are already in their normalized forms
after running 'table_normalize.sql'. This file only allowed our group members to be able to modify tables as needed throughout the semester (not having it would
mean the user that ran 'run.txt' would be the owner of the tables, and no one else could modify them).

fix.py
This file is not needed to be run by the graders, as we have provided all of the datasets used in the project within the 'data' folder. However we have provided
it in the submission as it is considered an 'artifact'. The main purpose of this file was to get the tables to BCNF. This file is what created the 'astroworld2.csv',
'space_missions2.csv', and 'space_missions3.csv'. This was necessary because each astronaut in 'astroworld.csv' had multiple missions in a single row, which would not
satisfy BCNF. 'space_missions.csv' was modified to remove extraneous missions and mission information. As a whole, this file allows the astronaut and space mission tables
to be joined. Only 'astroworld2.csv' and 'space_missions3.csv' are what is used for the normalized tables.

connect.py
This file can be run by the graders as it gets the graph used in the data visualization portion of the report. This connects the user to codd and executes the query
used for the data visualization (age of astronauts at time of launch), using matplotlib in order to create the histogram (saves to 'ages.png'). Note that it currently 
uses a group member's information in its current form; line 8 would need to be modified to use the grader's information, and line 11 can be commented out if it is not
necessary to change the grader's search path.
