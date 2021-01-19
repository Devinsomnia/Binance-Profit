//
//  DeviceControl.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import UIKit

//MARK:- Device Control Model, ScreenWidth and ScreenHeight
struct Device{
  static var deviceModel : String {
    let model = UIDevice.current.model
    return model
  }
    
  static var screenWidth : CGFloat{
    let screenWidth = UIScreen.main.bounds.size.width
    return screenWidth
  }
    
  static var screenHeight : CGFloat{
    let screenHeight = UIScreen.main.bounds.size.height
    return screenHeight
  }
  
  static func alignToScreenWidth(percent: CGFloat) -> CGFloat {
    let width = (screenWidth * percent) / 100
    return width
  }
  
  static func alignToScreenHeight(percent: CGFloat) -> CGFloat {
    let height = (screenHeight * percent) / 100
    return height
  }
}

