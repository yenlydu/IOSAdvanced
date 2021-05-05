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

        let countries = [
            Country(flagAsset: Asset.Flags.franceFlag.image, name: L10n.france),
            Country(flagAsset: Asset.Flags.alsaceFlag.image, name: L10n.alsace),
            Country(flagAsset: Asset.Flags.algeriaFlag.image, name: L10n.algeria),
            Country(flagAsset: Asset.Flags.belgiumFlag.image, name: L10n.belgium),
            Country(flagAsset: Asset.Flags.canadaFlag.image, name: L10n.canada),
            Country(flagAsset: Asset.Flags.egyptFlag.image, name: L10n.egypt),
            Country(flagAsset: Asset.Flags.germanyFlag.image, name: L10n.germany),
            Country(flagAsset: Asset.Flags.italyFlag.image, name: L10n.italy),
            Country(flagAsset: Asset.Flags.maroccoFlag.image, name: L10n.marocco),
            Country(flagAsset: Asset.Flags.mexicoFlag.image, name: L10n.mexico),
            Country(flagAsset: Asset.Flags.netherlandsFlag.image, name: L10n.netherlands),
            Country(flagAsset: Asset.Flags.portugalFlag.image, name: L10n.portugal),
            Country(flagAsset: Asset.Flags.spainFlag.image, name: L10n.spain),
            Country(flagAsset: Asset.Flags.swedenFlag.image, name: L10n.sweden),
            Country(flagAsset: Asset.Flags.switzerlandFlag.image, name: L10n.switzerland),
            Country(flagAsset: Asset.Flags.turkeyFlag.image, name: L10n.turkey),
            Country(flagAsset: Asset.Flags.ukFlag.image, name: L10n.uk),
            Country(flagAsset: Asset.Flags.usaFlag.image, name: L10n.usa)
        ]

        let viewController = HomeBuilder().build(countries: countries) as! Home
        viewController.router = Router()

        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation

        self.window = window
        window.makeKeyAndVisible()
    }
}
