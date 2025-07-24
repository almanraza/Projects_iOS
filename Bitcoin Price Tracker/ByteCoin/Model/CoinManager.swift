import Foundation

struct CoinManager {
    
    let baseURL = "https://pro-api.coinmarketcap.com/v1"
    let apiKey = "8ffa7481-3443-4781-bc37-d519ad806557"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchBtcPrice(for currency: String) {
        let urlString = "\(baseURL)/cryptocurrency/quotes/latest?symbol=BTC&convert=\(currency)"
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("❌ Error: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("❌ No data returned")
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataDict = json["data"] as? [String: Any],
                       let btcDict = dataDict["BTC"] as? [String: Any],
                       let quoteDict = btcDict["quote"] as? [String: Any],
                       let currencyDict = quoteDict[currency] as? [String: Any],
                       let price = currencyDict["price"] as? Double {
                        
                        print("b BTC Price in \(currency): \(price)")
                        
                        // Optional: Send this to your UI
                        DispatchQueue.main.async {
                            // Update your UILabel here
                        }
                    } else {
                        print("❌ Failed to parse expected keys from JSON")
                    }
                } catch {
                    print("❌ JSON parsing error: \(error.localizedDescription)")
                }
            }
            task.resume()
        }
    }
}

