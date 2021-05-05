import UIKit
import Core

public class DetailBuilder {
    
    public init() {}

    public func build(country: Country) -> UIViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailBuilder.self))
        let viewController = storyboard.instantiateViewController(identifier: "Detail") as! Detail

        viewController.viewModel = .init(image: country.flagAsset, text: country.name)
        return viewController
    }
}
