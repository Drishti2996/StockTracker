import UIKit

struct WatchListConfigurator {
    //MARK: - create Watchlist view controller
    static func createViewController(stockName: String) -> UIViewController {
        let viewController = WatchListViewController(stockName: stockName)
        let presenter = WatchListPresenter()
        let interactor = WatchListInteractor(presenter: presenter)
        let router = WatchListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        return viewController
    }
}
