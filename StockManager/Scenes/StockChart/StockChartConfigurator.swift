import UIKit

class StockChartConfigurator {
    //MARK: - create Stock Chart view controller
    static func createViewController() -> UIViewController {
        let viewController = StockChartViewController()
        let presenter = StockChartPresenter()
        let interactor = StockChartInteractor(presenter: presenter)
        let router = StockChartRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
