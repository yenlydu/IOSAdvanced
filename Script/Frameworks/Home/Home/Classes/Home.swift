import UIKit
import FirebaseAnalytics
import FirebasePerformance

public class Home: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    public var viewModel: HomeViewModel!
    public var router: HomeViewRouting!
    public var presenter: HomePresenter!

    override public func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchFlags { [weak self] viewModel in
            self?.viewModel = viewModel
            self?.tableView.reloadData()
        }
        customPerformanceTrace()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [
            "view": "Home",
            "event": "viewWillAppear"
        ])
    }
    
    func customPerformanceTrace() {
        guard let url = URL(string: "https://www.google.com") else { return }
        guard let metric = HTTPMetric(url: url, httpMethod: .get) else { return }

        metric.start()
        let request: URLRequest = URLRequest(url:url)
        let session = URLSession(configuration: .default)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            let dataTask = session.dataTask(with: request) { (urlData, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    metric.responseCode = httpResponse.statusCode
                    metric.stop()
                }
            }
            dataTask.resume()
        }
    }
}

extension Home: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.countries[indexPath.row]
        let view = router.getDetail(country: country)
        Analytics.logEvent(AnalyticsEventSelectItem, parameters: [
            "view": "Home",
            "event": "onFlagSelection",
			"selectedFlag": country.name
        ])
		print("ICICICICICICICICICI")
		Analytics.logEvent("AnalyticsEventSelectCountry", parameters: nil)
		navigationController?.pushViewController(view, animated: true)
    }
}

extension Home: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countries.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HomeCell else {
            fatalError("Could not dequeue reusable cell \(cellIdentifier)")
        }

        cell.configure(with: viewModel.countries[indexPath.row])
        return cell
    }
}
