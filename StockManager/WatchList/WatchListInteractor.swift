import UIKit
import CoreData

class WatchListInteractor: WatchListBusinessLogic {
    let presenter: WatchListPresenterLogic?
    init(presenter: WatchListPresenterLogic) {
        self.presenter = presenter
    }
    
    
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
