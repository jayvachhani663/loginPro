//
//  ViewController.swift
//  criptoApi
//
//  Created by jay vachhani on 08/05/22.
//

import UIKit
struct responseData: Codable {
    var market: [Market]
}
// MARK: - Market
struct Market: Codable {
    let symbol: String
    let baseAsset: String
    let quoteAsset: String
    let openPrice: String
    let lowPrice: String
    let highPrice: String
    let volume: String
    let lastPrice: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrData: [Market] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherApiCalling()
        	
    }
    
    func weatherApiCalling() {
        
        var urlRequest = URLRequest(url: URL(string: "https://api.wazirx.com/sapi/v1/tickers/24hr")!)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {return}
            do {
                let responseJson = try JSONDecoder().decode([Market].self, from: data)
                dump(responseJson)
                self.arrData = responseJson
//                print(self.arrData.count)
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "criptoCell", for: indexPath) as! CriptoTableViewCell
        cell.criptoNameLabel.text = arrData[indexPath.row].baseAsset
        cell.lowPriceLabel.text = arrData[indexPath.row].lowPrice
        cell.highPriceLabel.text = arrData[indexPath.row].highPrice
        cell.openPriceLabel.text = arrData[indexPath.row].openPrice
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}
