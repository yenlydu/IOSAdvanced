import UIKit
import Core
import Home
import Detail

struct Router: HomeViewRouting {

    func getDetail(country: Country) -> UIViewController {
        return DetailBuilder().build(country: country)
    }
}
