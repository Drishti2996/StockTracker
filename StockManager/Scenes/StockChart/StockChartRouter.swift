import UIKit

class StockChartRouter: StockChartRouterLogic {
    weak var viewController: StockChartViewController?
    // MARK: - route to watchlist
    func routeToWatchList(stockName: String) {
        
        let watchListViewController = WatchListConfigurator.createViewController(stockName: stockName)
    viewController?.navigationController?.pushViewController(watchListViewController, animated: true)
    }
}
