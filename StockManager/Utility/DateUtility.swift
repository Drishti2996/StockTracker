
import Foundation

extension Double {
    //MARK:-  to convert time (in double) to string
    func convertTimeToString() -> String {
        
        let date = Date(timeIntervalSince1970: self)
                 let dateFormatter = DateFormatter()
                 dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
                 dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = "yyyy-MM-dd"
                 dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
