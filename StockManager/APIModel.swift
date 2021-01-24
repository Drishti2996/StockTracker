//
//  WatchListAPIService.swift
//  TrackLocation
//
//  Created by Drishti Sharma on 19/01/21.
//

import Foundation

struct StockManagerAPIServices {
    
    
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

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completionHandler(nil)
            }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
                completionHandler(nil)
                return
        }

        if let data = data,
            let history = try? JSONDecoder().decode(History.self, from: data) {
            completionHandler(history)
        }else {
            completionHandler(nil)
            }
      })
      dataTask.resume()
    }
}
