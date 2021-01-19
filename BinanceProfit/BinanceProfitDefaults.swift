//
//  BinanceProfitDefaults.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import Foundation
import UIKit

class BinanceProfitDefaults {
  //MARK:- TextFields Default value
  static let BackgroundColor = UIColor(named: "Background")!
  static let BNBFeeDecimal = (0.0750 / 100)
  static let BTCFeeDecimal = (0.1000 / 100)
  
  //MARK:- TextFields Default value
  
  
  static let TextFieldTextFont = UIFont(name: "SFProDisplay-Semibold", size: 14)!
  static let TextFieldPlaceholderFont = UIFont(name: "SFProDisplay-Medium", size: 14)!
  static let TextFieldPlaceholderColor = UIColor(named: "TextFieldPlaceholder")!
  static let TextFieldTextColor = UIColor(named: "TextFieldText")!
  static let TextFieldBackgroundColor = UIColor(named: "TextFieldBackground")!
  
  
  
  //MARK:- Mainviewcontroller
  //Defination and Explanation Label
  static let BuyLongButtonImage = UIImage(named: "BuyLongButtonImage") as UIImage?
  static let SellShortButtonImage = UIImage(named: "SellShortButtonImage") as UIImage?
  
  static let ButtonFont = UIFont(name: "SFProDisplay-Medium", size: 16)!
  static let ButtonTitleColor = UIColor.white
  static let BuyLongButtonTitle = "Buy/Long"
  static let SellShortButtonTitle = "Sell/Short"
  
  
  static let DefinitionLabelFont = UIFont(name: "SFProDisplay-Bold", size: 25)!
  static let DefinitionLabelText = "Binance Future"//NSLocalizedString("DefinitionLabelText", comment: "")
  static let DefinitionLabelColor = UIColor(named: "DefinitionLabel")!
  
  static let ExplanationLabelFont = UIFont(name: "SFProDisplay-Regular", size: 16)!
  static let ExplanationLabelText = "This application developed for trade on Binance Future. If you want to use this application, please don't forget use to yourself indicators and update your risk value."//NSLocalizedString("ExplanationLabelText", comment: "")
  static let ExplanationLabelColor = UIColor(named: "ExplanationLabel")!
  
  
  static let BPDUsdIcon = UIImage(named: "BPDUsdIcon")!
  static let BTCBuyingPriceTextFieldPlaceholderText = "BTC - Buy Price"
  static let CurrentBTCUSDSPriceTextFieldPlaceholderText = "Realtime BTC Price"
  static let BuyLongBTCPriceTextFieldPlaceholderText = "Long buy price on x125"
  static let SellShortBTCPriceTextFieldPlaceholderText = "Short sell price on x125"
  
  static let BuyLongPriceCopied = "Buy/Long Price \ncopied to clipboard"
  static let SellShortPriceCopied = "Sell/Short Price \ncopied to clipboard"
}
