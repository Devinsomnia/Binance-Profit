//
//  BinanceClient+Account.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

extension BinanceClient: AccountClientInterface {
    func getAccount(completion: @escaping AccountCompletion) {
        guard let api = self.apiKey, let secret = self.secretKey else {
            completion(nil, .invalidKeys)
            return
        }

        let params: [String: String] = [APIConstants.apiKey: api, APIConstants.secret: secret]

        HTTPClient.sharedInstance.execute(type: .post, endpoint: .account, params: params, success: { (json) in
            

        }, failed: { (error) in
            completion(nil, error)
        })
    }

    func getOpenOrders(for symbol: String, completion: @escaping OpenOrdersCompletion) {
        guard let api = self.apiKey, let secret = self.secretKey else {
            completion()
            return
        }

        let params: [String: String] = [APIConstants.apiKey: api, APIConstants.secret: secret]

        HTTPClient.sharedInstance.execute(type: .post, endpoint: .openOrders, params: params, success: { (json) in

        }, failed: { (error) in
            completion()
        })
    }
}


typealias AccountCompletion = (_ account: Account?, _ error: BinanceError?) -> Void
typealias OpenOrdersCompletion = () -> Void

