import UIKit
import LightweightCharts

class WatchListPresenter: WatchListPresenterLogic {
    weak var viewController: WatchListDisplayLogic?
    
    func presentGraphDetails(history: History) {
        var data = [BarData]()
        
        
        if let prices = history.prices {
            data = prices.compactMap({
                (price) -> BarData? in


                if let time = price.date,
                    let openValue = price.open,
                    let highValue = price.high,
                    let lowValue = price.low,
                    let closevalue = price.close {
                    return BarData(time: .string(convertTimeToString(time: time)), open: openValue, high: highValue, low: lowValue, close: closevalue)
                } else {
                    return nil
                }
            })
            
        }
        
        viewController?.showChart(historyData: data)
    }
    
    func errorScreen() {
        viewController?.showErrorScreen()
    }
    
    func convertTimeToString(time: Double) -> String {
        
        let date = Date(timeIntervalSince1970: time)
                 let dateFormatter = DateFormatter()
                 dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
                 dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = "yyyy-MM-dd"
                 dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
}
