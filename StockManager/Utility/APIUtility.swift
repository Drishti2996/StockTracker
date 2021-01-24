import Foundation

struct StockManagerAPIUtility {
    //MARK:-  common utility to fetch API data
    static func fetchAPI(request: NSMutableURLRequest, completionHandler: @escaping (Data?)-> Void) {
        
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
            
            if let data = data{
                completionHandler(data)
            }else {
                completionHandler(nil)
            }
        })
        dataTask.resume()
    }
}
