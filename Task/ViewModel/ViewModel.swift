import Foundation
import UIKit

class ViewModel {
    
var allData = [Element]()
    
func parseJson(completion: @escaping () -> Void) {
    guard let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=20") else {
        debugPrint("Invalid URL!")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data, error == nil else {
            debugPrint("Error retrieving data: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        
        do {
    let result = try JSONDecoder().decode([Element].self, from: data)
    DispatchQueue.main.async {
    self.allData = result
    debugPrint(self.allData.count)
    completion()
}
} catch {
    debugPrint("Error decoding JSON: \(error.localizedDescription)")
}
}
    task.resume()
}
    
    func loadImageFromURL(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}



