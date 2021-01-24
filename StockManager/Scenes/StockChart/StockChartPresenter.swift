import UIKit
import LightweightCharts

class StockChartPresenter: StockChartPresenterLogic {
    weak var viewController: StockChartDisplayLogic?
    // MARK: - to present graph details
    func presentGraphDetails(history: History) {
        var data = [BarData]()
        
        let sortedPrice = history.prices?.sorted(by: { $0.date! < $1.date! })
        if let prices = sortedPrice {
            data = prices.compactMap({
                (price) -> BarData? in

                if let time = price.date,
                    let openValue = price.open,
                    let highValue = price.high,
                    let lowValue = price.low,
                    let closevalue = price.close {
                    return BarData(time: .string(time.convertTimeToString()), open: openValue, high: highValue, low: lowValue, close: closevalue)
                } else {
                    return nil
                }
            })
            
        }
        viewController?.showChart(historyData: data)
    }
    
    //MARK: - show error screen
    func errorScreen() {
        viewController?.showErrorScreen()
    }
}
