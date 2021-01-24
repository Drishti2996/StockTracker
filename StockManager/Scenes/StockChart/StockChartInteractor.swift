import UIKit

class StockChartInteractor: StockChartBusinessLogic {
    let presenter: StockChartPresenterLogic?
    init(presenter: StockChartPresenterLogic) {
        self.presenter = presenter
    }
    // MARK: - to fetch history data for stock from API
    func fetchHistory(searchText: String?) {
        var text: String?
        if let searchText = searchText {
            text = searchText
        } else {
            text = "AMRN"
        }
        StockManagerAPIServices.stockHistory(searchText: text ?? "AMRN", completionHandler: { [weak self] (history) in
            
            if let data = history {
                self?.presenter?.presentGraphDetails(history: data)
                } else {
            self?.presenter?.errorScreen()
                print("error")
            }
        })
    }
}
