//
//  UIImageView+Extension.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
  
  func addBlurEffect()
  {
    let blurEffect = UIBlurEffect(style: .light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = self.bounds
    blurEffectView.alpha = 0.7

      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
      self.addSubview(blurEffectView)
  }
}

