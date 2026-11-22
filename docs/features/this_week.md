# Description

Displays the current week and the active habits.

# Components

## Week view

Contains 7 tiles with day of week and day of the month. It's quite similar to a standard calendar view, but restricted just to the week. The current day is always highlighted. Each day also can be highlighted with different colors depending on the selected habit:
- Green: If the goal was reached for the given day. It applies to daily goals and weekly with specified days
- Red: If the goal was not reached for the given day. It applies to daily goals and weekly with specified days and also only for the days in the past. 
- Blue: Only for the days that are specified in the weekly habit with specified days.

User can switch the selected week by swiping left or right.

## Active habits

It is a list with the habits active in the selected week. Each item on the list contains:
- Habit name
- Goal (30 minutes a day, 3 times a week, 2 times a week (Tue, Thu))
- Icon
    - For the past weeks: Success if the goal was reached in given week, Failure if it was not
    - For the current week: Progress icon

Always one item is selected, by default the first one from the list.