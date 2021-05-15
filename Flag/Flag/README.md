# ios-course-advanced

## Flag


RCValues.swift file stores and handles the remote controled values from Firebase.

To use those variables in the code invoke them with 'RCValues.sharedInstance.string(forKey: .variable)' if it is a string.

To set up a new remote control value:
	- create it in the remote control pannel in Firebase
	- add it to the ValueKey enum in KCValues.swift
	- set a default value to the variable with loadDefaultValues() method
	- fetch the value in Firebase using getchCloudValues() method
    
### SwiftLint

SwiftLint is a tool to enforce Swift style and conventions

#### Installation

- Add `pod 'SwiftLint'` to your `Podfile`
- Invoke SwiftLint in your Script Build Phase using:

```sh
if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

#### Configuration file

- Create `.swiftlint.yml` file
- Edit file and add the following:

```yaml
disabled_rules:
- trailing_whitespace
- force_cast
excluded:
- Carthage
- Pods
- SwiftLint/Common/3rdPartyLib
line_length:
    warning: 150
    error: 200
    ignores_function_declarations: true
    ignores_comments: true
    ignores_urls: true
function_body_length:
    warning: 300
    error: 500
function_parameter_count:
    warning: 6
    error: 8
type_body_length:
    warning: 300
    error: 500
file_length:
    warning: 1000
    error: 1500
    ignore_comment_only_lines: true
cyclomatic_complexity:
    warning: 15
    error: 25
reporter: "xcode"
```

### SwiftGen

SwiftGen is a tool to automatically generate boilerplate code for resources of the project.

#### Installation

- Add `pod 'SwiftGen', '~> 6.0'` to your `Podfile`
- Invoke SwiftGen in your Script Build Phase using:

```sh
if [[ -f "${PODS_ROOT}/SwiftGen/bin/swiftgen" ]]; then
  "${PODS_ROOT}/SwiftGen/bin/swiftgen" …
else
  echo "warning: SwiftGen is not installed. Run 'pod install --repo-update' to install it."
fi
```

#### Configuration file

- Run `swiftgen config init`
- Edit `swiftgen.yml` to adapt to project

For example:
```yaml
strings:
  inputs:
    - Flag/Resources/en.lproj
  outputs:
    - templateName: structured-swift5
      output: Flag/Generated/Strings.swift
xcassets:
  inputs:
    - Flag/Resources/Assets.xcassets
    - Flag/Resources/Flags.xcassets
  outputs:
    - templateName: swift5
      params:
        forceProvidesNamespaces: true
      output: Flag/Generated/XCAssets.swift
```

#### Usage

```
// For images:
let franceFlag = Asset.Flags.franceFlag.image

// For strings
let franceStr = L10n.france
```

### Firebase

#### Analytics

Thanks to Firebase Analytics, developer can log event of their app and understand how users use the app.

For exemple every time a user is on the home view, or user select a flag.

##### Installation

1. Add `pod 'Firebase/Analytics'` to your `Podfile`
2. `pod install`
3. Add `import FirebaseAnalytics` to your project

##### Usage

```
// name: The name of the event
// parameters: Parameters to log
Analytics.logEvent(name: AnalyticsEventScreenView, parameters: [
    "view": "Home",
    "event": "viewWillAppear"
])
```
#### Performance

Thanks to Firebase Performance, developer can automatically measure app startup time, HTTP network requests,...

##### Installation

1. Add `pod 'Firebase/Performance'` to your `Podfile`
2. `pod install`
3. Add `import FirebasePerformance` to your project

##### Usage

Basic example of how to measure network requests 

```
guard let url = URL(string: "https://www.somethingToFetch.com") else { return }
guard let metric = HTTPMetric(url: url, httpMethod: .get) else { return }

metric.start()
let request: URLRequest = URLRequest(url: url)
let session = URLSession(configuration: .default)
let dataTask = session.dataTask(with: request) { (data, response, error) in
    if let httpResponse = response as? HTTPURLResponse {
        metric.responseCode = httpResponse.statusCode
    }
    metric.stop()
}
dataTask.resume()
```

#### Common configuration

- Add `import Firebase` in your UIApplicationDelegate
- Add `FirebaseApp.configure()` to `application:didFinishLaunchingWithOptions:` method
