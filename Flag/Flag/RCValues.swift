//
//  RCValues.swift
//  Flag
//
//  Created by Victor Derveaux on 13/05/2021.
//

import FirebaseRemoteConfig

enum ValueKey: String {
	case cellBackgroundColor
	case countryNameIsUppercased
}

class RCValues {
	static let sharedInstance = RCValues()

	private init() {
		loadDefaultValues()
		fetchCloudValues()
	}

	func loadDefaultValues() {
		let appDefaults: [String: Any?] = [
			ValueKey.cellBackgroundColor.rawValue: "#FBB04B",
			ValueKey.countryNameIsUppercased.rawValue: "false"
		]
		RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
	}
		
	func activateDebugMode() {
		let settings = RemoteConfigSettings()
		// WARNING: Don't actually do this in production!
		settings.minimumFetchInterval = 0
		RemoteConfig.remoteConfig().configSettings = settings
	}
		
	func fetchCloudValues() {
		// 1
		activateDebugMode()

		// 2
		RemoteConfig.remoteConfig().fetch { [weak self] _, error in
			if let error = error {
				print("Uh-oh. Got an error fetching remote values \(error)")
				// In a real app, you would probably want to call the loading
				// done callback anyway, and just proceed with the default values.
				// I won't do that here, so we can call attention
				// to the fact that Remote Config isn't loading.
				return
			}

			// 3
			RemoteConfig.remoteConfig().activate { _, _ in
				print("Retrieved values from the cloud!")
				let cellBackgroundColorString = RemoteConfig.remoteConfig()
					.configValue(forKey: "cellBackgroundColor")
					.stringValue ?? "undefined"
				let countryNameIsUppercasedString = RemoteConfig.remoteConfig()
					.configValue(forKey: "countryNameIsUppercased")
					.stringValue ?? "undefined"
				print("Our app's cells background color is \(cellBackgroundColorString)")
				print("Our app's countries name are uppercased:  \(countryNameIsUppercasedString)")
			}
		}
	}
	
	func color(forKey key: ValueKey) -> UIColor {
		let colorAsHexString = RemoteConfig.remoteConfig()[key.rawValue]
			.stringValue ?? "#FFFFFF"
		let convertedColor = UIColor(named: colorAsHexString)!
		return convertedColor
	}
	
	func string(forKey key: ValueKey) -> String {
		RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? ""
	}
}
