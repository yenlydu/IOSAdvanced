# ios-course-advanced

## Flag


RCValues.swift file stores and handles the remote controled values from Firebase.

To use those variables in the code invoke them with 'RCValues.sharedInstance.string(forKey: .variable)' if it is a string.

To set up a new remote control value:
	- create it in the remote control pannel in Firebase
	- add it to the ValueKey enum in KCValues.swift
	- set a default value to the variable with loadDefaultValues() method
	- fetch the value in Firebase using getchCloudValues() method
