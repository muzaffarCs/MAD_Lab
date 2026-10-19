
# CS442 Flutter Lab: Study Tracker

Name: Muzaffar Ali  
Roll Number: 04072313007

## Numeric Answers

A1: 10

A2: 7

A3: 12

A4: 50

## Written Answers

B1: LabApp, HomePage, StudentCard and GoalBanner are StatelessWidgets because they display configuration or supplied data. Tally, Countdown and BuggyCounter are StatefulWidgets because their State objects contain values that change over time or after button presses.

B2: The Timer must be cancelled in dispose so it does not continue running after the widget is removed. Otherwise, its callback may call setState after the State object has been disposed.

B3: Widgets with constant constructor arguments can often be const, such as LabApp, HomePage, Tally, Countdown, BuggyCounter, SizedBox and constant Text widgets. Const allows Flutter to reuse constant widget instances and avoids recreating equivalent constant objects unnecessarily.
