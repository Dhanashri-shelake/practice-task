import pandas as pd
from datetime import timedelta
import git

# Load the Google Sheets file into a DataFrame (assuming it's in CSV format)
file_path = "Assignment_Timecard.xlsx - Sheet1.csv"
# Replace with the actual file path
df = pd.read_csv(file_path)

# Define the functions to check conditions
def has_worked_consecutive_days(employee_schedule):
    # Implement your logic to check consecutive days here
    pass

def has_short_break(employee_schedule):
    # Implement your logic to check for short breaks here
    pass

def has_long_shift(employee_schedule):
    # Implement your logic to check for long shifts here
    pass

# Iterate over records and apply conditions
for index, row in df.iterrows():
    if has_worked_consecutive_days(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Worked for 7 consecutive days")

    if has_short_break(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Has a short break between shifts")

    if has_long_shift(row):
        print(f"Employee: {row['Name']}, Position: {row['Position']} - Worked for more than 14 hours in a shift")

# Initialize and push to a public GIT repository
repo = git.Repo.init("your_repository_path")  # Replace with your repository path
repo.index.add(["pythonfile.sh"])  # Replace with your script file
repo.index.commit("my first commit")
origin = repo.create_remote('origin', url='https://github.com/Dhanashri-shelake/practice-task.git')
origin.push()

