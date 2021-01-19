//
//  Balance.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

class Balance {
    public private(set) var asset: String = ""
    public private(set) var free: Double = 0.0
    public private(set) var locked: Double = 0.0

    convenience init(asset: String, free: Double, locked: Double) {
        self.init()
        self.asset = asset
        self.free = free
        self.locked = locked
    }
}

