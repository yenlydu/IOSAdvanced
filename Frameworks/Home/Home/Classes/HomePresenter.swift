import UIKit
import Core

public class HomePresenter {
    
    var countries: [Country] = []

    public init(countries: [Country]) {
        self.countries = countries
    }

    public func fetchFlags(onCompletion: (HomeViewModel) -> Void) {
        let viewModel = HomeViewModel(countries: countries)
        onCompletion(viewModel)
    }
}
