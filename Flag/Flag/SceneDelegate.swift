import UIKit
import Home
import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)

		var isUppercased: Bool = false
				
		if (RCValues.sharedInstance.string(forKey: .countryNameIsUppercased) == "true") {
			isUppercased = true
		}

        let countries = [
			Country(flagAsset: Asset.Flags.franceFlag.image, name: L10n.france, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.alsaceFlag.image, name: L10n.alsace, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.algeriaFlag.image, name: L10n.algeria, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.belgiumFlag.image, name: L10n.belgium, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.canadaFlag.image, name: L10n.canada, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.egyptFlag.image, name: L10n.egypt, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.germanyFlag.image, name: L10n.germany, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.italyFlag.image, name: L10n.italy, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.maroccoFlag.image, name: L10n.marocco, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.mexicoFlag.image, name: L10n.mexico, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.netherlandsFlag.image, name: L10n.netherlands, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.portugalFlag.image, name: L10n.portugal, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.spainFlag.image, name: L10n.spain, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.swedenFlag.image, name: L10n.sweden, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.switzerlandFlag.image, name: L10n.switzerland, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.turkeyFlag.image, name: L10n.turkey, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.ukFlag.image, name: L10n.uk, isUppercased: isUppercased),
            Country(flagAsset: Asset.Flags.usaFlag.image, name: L10n.usa, isUppercased: isUppercased)
        ]

        let viewController = HomeBuilder().build(countries: countries) as! Home
        viewController.router = Router()

        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation

        self.window = window
        window.makeKeyAndVisible()
    }
}
