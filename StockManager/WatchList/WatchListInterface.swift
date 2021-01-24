import UIKit
import LightweightCharts

protocol WatchListBusinessLogic {
    func fetchHistory(searchText: String?)
}

protocol WatchListPresenterLogic {
    func presentGraphDetails(history: History) 
    func errorScreen()
  
}

protocol WatchListDisplayLogic: class {
    func showChart(historyData: [BarData])
    func showErrorScreen()
}

protocol WatchListRouterLogic {}
