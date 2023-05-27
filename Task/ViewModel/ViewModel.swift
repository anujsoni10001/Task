import Foundation

class ViewModel {
    
    var allData: [Element] = []
    
    func parseJson() {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=20") else {
            debugPrint("Invalid URL!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                debugPrint("Error retrieving data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                self?.allData = try JSONDecoder().decode([Element].self, from: data)
                debugPrint(self?.allData)
            } catch {
                debugPrint("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
