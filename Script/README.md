# ios-course-advanced

## Flag


Use the directory Template for the Scripting part of the project.
You will need to replace `__TEMPLATE__` from directory/file names and contents with the given parameter.

eg: `./CreateFramework <Name> [--path <path>]`

To use the script :
   Pass the generated framework name
   Optional : Pass the path where the framework should be generated

To use those generated frameworks, you will need to add them into the Flag/Podfile.
Step to follow:
   Open Flag/Podfile
   In the section "target '__TEMPLATE__' do", please add "pod '__YOUR_FRAMEWORK__', :path => '__PATH_TO_PODSPEC__'
   Add wanted source code files manually
   Do pod install