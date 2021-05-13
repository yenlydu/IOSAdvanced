# ios-course-advanced

## Flag


Before doing anything make sure you have xcodegen installed and up to date on you computer using this command:

"brew install xcodegen"


To modify the project's paramaters or add frameworks or dependencies, edit the project.yml file located in XcodeGen directory.


To create or update Flag.xcodeproj file run the following command inside this directory:

"xcodegen -s ./project.yml -p ./"


Once you have run the xcodegen command, you may encouter the following error: "Multiple commands produce '....'".

To solve this issue simply navigate Open target -> Build phases -> Copy Bundle Resources and remove the Info.plist file.

This manipulation is to be done EACH TIME the xcodegen command is ran.
