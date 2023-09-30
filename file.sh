#!/usr/bin/env python3
import csv
from datetime import datetime, timedelta

def load_data(/home/ec2-user/python/Assignment_Timecard.xlsx - Sheet1.csv):
    data = []
    with open(/home/ec2-user/python/Assignment_Timecard.xlsx - Sheet1.csv, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            data.append(row)
    return data

def has_consecutive_days(attendance_data, index):
    current_date = datetime.strptime(attendance_data[index]['Date'], '%Y-%m-%d')
    for i in range(1, 7):  # Check for 7 consecutive days
        next_date = current_date + timedelta(days=i)
        next_date_str = next_date.strftime('%Y-%m-%d')
        if not any(entry['Date'] == next_date_str for entry in attendance_data):
            return False
    return True

def main():
    file_path = input("/home/ec2-user/python/Assignment_Timecard.xlsx - Sheet1.csv ")
    attendance_data = load_data(file_path)

    for i in range(1, len(attendance_data)):
        name = attendance_data[i]['Name']
        position = attendance_data[i]['Position']
        start_time = datetime.strptime(attendance_data[i - 1]['Date'], '%Y-%m-%d')
        end_time = datetime.strptime(attendance_data[i]['Date'], '%Y-%m-%d')
        hours_between_shifts = (end_time - start_time).total_seconds() / 3600

        if has_consecutive_days(attendance_data, i):
            print(f"{name}, {position}: Worked for 7 consecutive days")

        if 1 < hours_between_shifts < 10:
            print(f"{name}, {position}: Less than 10 hours between shifts")

        if hours_between_shifts > 14:
            print(f"{name}, {position}: Worked for more than 14 hours in a single shift")

if __name__ == "__main__":
    main()
