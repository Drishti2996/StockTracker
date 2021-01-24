import UIKit
import LightweightCharts

protocol StockChartBusinessLogic {
    func fetchHistory(searchText: String?)
}

protocol StockChartPresenterLogic {
    func presentGraphDetails(history: History) 
    func errorScreen()
}

protocol StockChartDisplayLogic: class {
    func showChart(historyData: [BarData])
    func showErrorScreen()
}

protocol StockChartRouterLogic {
    func routeToWatchList(stockName: String)
}
