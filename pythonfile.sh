import pandas as pd
from datetime import timedelta
import git

# Loading the Google Sheets file into a DataFrame in CSV format
file_path = "Assignment_Timecard.xlsx - Sheet1.csv"  
#path of the file
df = pd.read_csv(/home/ec2-user/python)

# functions for checking the conditions
def worked_days(employee_schedule):
    
    pass

def short_break(employee_schedule):
    pass

def long_shift(employee_schedule):
    pass

#records and applying conditions
for index, row in df.iterrows():
    if worked_days(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Worked for 7 consecutive days")
    
    if short_break(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Has a short break between shifts")

    if long_shift(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Worked for more than 14 hours in a shift")

#push to a public repository
repo = git.Repo.init("/home/ec2-user/python")  
repo.index.add(["pythonfile.sh"])  
repo.index.commit("my first commit")
origin = repo.create_remote('origin', url='https://github.com/Dhanashri-shelake/practice-task.git')
origin.push()
