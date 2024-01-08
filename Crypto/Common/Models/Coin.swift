//
//  Coin.swift
//  Crypto
//
//  Created by Евгений Митюля on 1/3/24.
//

import Foundation

struct Coin: Codable {
    let name: String?
    let priceUSD: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case priceUSD = "price_usd"
    }
}

