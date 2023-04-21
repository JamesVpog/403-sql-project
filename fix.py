import re
import pandas as pd

# fixes the astroworld.csv and space_missions.csv to be able to join them

# outputs the cleaned dataset, astroworld2.csv and space_missions3.csv


def remove_parenthesis_and_content(string):
    return re.sub(r'\([^()]*\)', '', re.sub(r'-|\s', '', string))

def remove_everything_after_left_parenthesis(string):
    #and everything after a comma because bcnf
    substr = re.sub(r'\(.*$', '', string)
    substr = re.sub(r'-|\s', '', substr)
    return re.sub(r'\,.*$', '', substr)
     
#astronaut fix, stored in astroworld2.csv
df3 = pd.read_csv("data/astroworld.csv")

df3["Missions"] = df3["Missions"].map(remove_parenthesis_and_content, na_action='ignore')
df3.to_csv('data/astroworld2.csv', sep=",", index=False, header=True)


# space_missions fix, stored in new space_missions.csv files
## remove extraneous missions and mission info
df = pd.read_csv("data/space_missions2.csv")

df['Mission'] = df['Mission'].map(remove_everything_after_left_parenthesis)

df.to_csv('data/space_missions3.csv', sep=',' , index=False, header=True)

### not every mission in space_missions has a recorded astronaut in missions