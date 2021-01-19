//
//  BinanceError.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 18.01.2021.
//

import Foundation

enum BinanceError: Error {
    case parsingFailed
    case noResponse
    case failedResponse
    case invalidKeys
}

