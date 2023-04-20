import psycopg2
import getpass
import matplotlib
matplotlib.use('Agg')

password = getpass.getpass('Password: ')

conn = psycopg2.connect(
    host="codd.mines.edu",
    database="csci403",
    user="jvongphasouk",
    port=5433,
    password= password)
		

cur = conn.cursor()

cur.execute("SET search_path TO s23_group48")

query = """
SELECT name, DATE_PART('year', launch_date) - DATE_PART('year', birth_date) AS age, mission
FROM 
    astronaut_v2 AS a 
    JOIN mission_info AS s ON a.mission = s.mission_name; """
         

cur.execute(query)

resultset = cur.fetchall()
ages = []

for row in resultset:
    name, age, mission = row
    ages.append(age)

#data science

import matplotlib.pyplot as plt

plt.hist(ages)
plt.title('Age of Astronauts at time of Launch')
plt.xlabel('Age')
plt.savefig('ages.png')


