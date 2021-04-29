import UIKit
import Home
import Core
import Detail

struct Router: HomeViewRouting {

    func getDetail(country: Country) -> UIViewController {
        return DetailBuilder().build(country: country)
    }
}
