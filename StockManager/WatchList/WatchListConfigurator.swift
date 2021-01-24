import UIKit

struct WatchListConfigurator {
    // create Location Tracker view controller
    static func createViewController() -> UIViewController {
        let viewController = WatchListViewController()
        let presenter = WatchListPresenter()
        let interactor = WatchListInteractor(presenter: presenter)
        let router = WatchListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
