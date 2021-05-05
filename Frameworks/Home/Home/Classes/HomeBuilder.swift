import UIKit
import Core

public class HomeBuilder {
    
    public init() {}

    public func build(countries: [Country]) -> UIViewController {
        let presenter = HomePresenter(countries: countries)
        let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "Home") as! Home
        viewController.presenter = presenter
        return viewController
    }
}
