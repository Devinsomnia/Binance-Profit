//
//  Depth.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

class Depth {
    public private(set) var lastUpdateId: Int = 0
    public private(set) var symbol: String = ""
    public private(set) var bids: [Double: Double] = [:]
    public private(set) var asks: [Double: Double] = [:]

    convenience init(lastUpdateId: Int, symbol: String, bids: [Double: Double], asks: [Double: Double]) {
        self.init()
        self.lastUpdateId = lastUpdateId
        self.symbol = symbol
        self.bids = bids
        self.asks = asks
    }
}

