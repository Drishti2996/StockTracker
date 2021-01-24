//  StockChartAPIService.swift
//
//  Created by Drishti Sharma on 19/01/21.
//

import Foundation

struct StockManagerAPIServices {
    
    //MARK: - to fetch stock history
    static func stockHistory(searchText: String, completionHandler: @escaping (History?) -> Void) {

        let headers = [
            "x-rapidapi-key": "c5e59aece0mshda6594d797f5b1fp1d8195jsnab684a8cfec1",
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v3/get-historical-data?symbol=AMRN&region=US")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        StockManagerAPIUtility.fetchAPI(request: request, completionHandler: {(data) in
            if let dataRecieved = data {
                let history = try? JSONDecoder().decode(History.self, from: dataRecieved)
                completionHandler(history)
            }else {
                completionHandler(nil)
            }
        })
    }
    
    //MARK: - to fetch stock summary
    static func fetchStockSummary(stockName: String, completionHandler: @escaping (Summary?) -> Void) {
        
        let headers = [
            "x-rapidapi-key": "c5e59aece0mshda6594d797f5b1fp1d8195jsnab684a8cfec1",
            "x-rapidapi-host": "apidojo-yahoo-finance-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=\(stockName)&region=US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        StockManagerAPIUtility.fetchAPI(request: request, completionHandler: {(data) in
            if let dataRecieved = data {
                let summary = try? JSONDecoder().decode(Summary.self, from: dataRecieved)
                completionHandler(summary)
            }else {
                completionHandler(nil)
            }
        })
    }
}
