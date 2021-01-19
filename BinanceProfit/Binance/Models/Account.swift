//
//  Account.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

class Account {
    public private(set) var makerCommission: Int = 0
    public private(set) var takerCommission: Int = 0
    public private(set) var buyCommission: Int = 0
    public private(set) var sellerCommission: Int = 0
    public private(set) var canTrade: Bool = false
    public private(set) var canWithdraw: Bool = false
    public private(set) var canDeposit: Bool = false
    public private(set) var balances: [Balance] = []

    convenience init(makerCommission: Int, takerCommission: Int, buyCommission: Int, sellerCommission: Int, canTrade: Bool, canWithdraw: Bool, canDeposit: Bool, balances: [Balance]) {
        self.init()
        self.makerCommission = makerCommission
        self.takerCommission = takerCommission
        self.buyCommission = buyCommission
        self.sellerCommission = sellerCommission
        self.canTrade = canTrade
        self.canWithdraw = canWithdraw
        self.canDeposit = canDeposit
        self.balances = balances
    }
}

