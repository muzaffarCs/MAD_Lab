### Student Information

**Name:** Muzaffar Ali  
**Roll Number:** 42313007  
**Course:** CS 442 - Mobile Application Development

### Personal Parameters

- **myThreshold:** 12
- **mySeedColor:** Colors.amber

### Features

- Use the `+` button to increase the counter.
- Use the refresh button to reset the counter.
- Keep track of how many times the counter has been reset.
- When the counter above the individual barrier, show "You're on a roll!"
- A customized theme for the application
- Show the student's name and roll number.

### App Screenshot

![Running Flutter App](/Screenshot%202026-09-11%20154502.png)

### Reflection

Flutter is informed by `setState()` that the screen has to be rebuilt because the widget's state has changed. Flutter re-runs the build process and shows the updated value when the counter inside `setState()` changes. Changing the variable by itself does not alert Flutter to the need for a screen refresh in the absence of `setState()`.