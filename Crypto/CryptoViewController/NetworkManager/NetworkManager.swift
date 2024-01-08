//
//  NetworkManager.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import Alamofire

final class NetworkManager {
    static let instance = NetworkManager()
    
    private init() { }
    
    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }
    
    enum CoinEndPoints {
        static let assets = "/assets"
    }
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "42EB1E49-A8DA-44FF-90DB-FAB9D31A9A1F",
        "Accept": "application/json"
    ]
    
    func getAssets(completion: @escaping (([Coin]) -> Void)) {
        AF.request(Constants.baseURL + CoinEndPoints.assets, headers: header).responseDecodable(of: [Coin].self) { response in
            switch response.result {
            case .success(let coins):
                completion(coins)
            case .failure(let failure):
                print(failure)
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Response data: \(utf8Text)")
                }
            }
        }
    }
}
