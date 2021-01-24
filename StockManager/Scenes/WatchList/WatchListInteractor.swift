import UIKit

class WatchListInteractor: WatchListBusinessLogic {
    let presenter: WatchListPresenterLogic?
    init(presenter: WatchListPresenterLogic) {
        self.presenter = presenter
    }
    
    //MARK: - to fetch Summary data of stock selected and add to watchlist
    func fetchSummary(stockName: String = "ANRM") {
        StockManagerAPIServices.fetchStockSummary (stockName: stockName, completionHandler: { [weak self] (stockData) in
            
            if let data = stockData {
                // TODO: - To be implemented later
               print("Success")
            } else {
                // TODO: - To be implemented later
                print("error")
            }
        })
    }
    
    // TODO:- to fetch watchlist data and populate in tableVeiw
    // To be implemented later
    func fetchWatchListData() {}
}
