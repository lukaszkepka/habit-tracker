# Description

Create a new habit that will be tracked by the application. 

# Habit data

## Habit period
Specifies the period in which all logged activities are evaluated against the goal
- Daily - for habits like: drink cup of water 8 times per day
- Weekly - for habits like: go to gym 3 times per week

In the 'weekly' period user can specify the particular days. If the activities are logged in a different day than the specified, it doesn't count to the goal

Examples:
Habit: Go to gym 2 times per week (Tuesday and Thursday)
User needs to log the activity on Tuesday and Thursday to make the week successfull. 

Habit: Go to gym 2 times per week (No specific days)
User needs to log the activity on any two distinct days to make the week successfull. 

## Goal

User needs to specify when the habit period is classified as successful. We have 3 types of goals:

### Yes/No
User specifies if the habit is succesfull if he does specified thing or does not.
Examples:
- Do not use social media (No)
- Describe your day in a dairy (Yes) 

### Numeric
Habits where user needs to do something X times. Optionally he can specify the unit of the value
Examples:
- Stretch 2 times a day (Daily / No unit)
- Read 100 pages a week (Weekly / Unit=Pages)

### Time
Habits where user needs to something for a specified period of time.
Examples:
- Mediate 30 minutes a day

## Notifications

User specifies when to get notification with reminder to log the activity. In most cases user selects just an hour. If the habit is "weekly" and user did not specified any particular day, he can select the days where he will get the notifications.

## Other
- Name
- Description
- Start date 
- End date