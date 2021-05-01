import UIKit
import Home
import Detail

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)

        let viewController = HomeBuilder().build()

        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation

        self.window = window
        window.makeKeyAndVisible()
    }
}
