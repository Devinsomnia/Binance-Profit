//
//  BinanceClient.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

class BinanceClient {
    public private(set) var apiKey: String?
    public private(set) var secretKey: String?

    convenience init(apiKey: String, secretKey: String) {
        self.init()
        self.apiKey = apiKey
        self.secretKey = secretKey
    }
}

