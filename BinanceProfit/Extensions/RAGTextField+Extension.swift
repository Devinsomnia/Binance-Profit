//
//  RAGTextField+Extension.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import UIKit
import RAGTextField

struct SetupTextField {
  static func makeViewIcon(setImage: UIImage) -> UIView {
    let imageView = UIImageView(image: setImage)
    return imageView
  }
  
  static func makeViewIconWithTintColor(setImage: UIImage, setImageColor: UIColor) -> UIView {
    let imageView = UIImageView(image: setImage)
    imageView.setImageColor(color: setImageColor)
    return imageView
  }
  
  
  static func setup(_ textField: RAGTextField, backgroundColor: UIColor) {
    let backgroundView = UnderlineView(frame: .zero)
    backgroundView.textField = textField
    backgroundView.foregroundLineWidth = 0
    backgroundView.backgroundColor = backgroundColor
    
    backgroundView.layer.cornerRadius = 5
    backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    
    //textField.delegate = self
    textField.textBackgroundView = backgroundView
    textField.textPadding = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    textField.textPaddingMode = .textAndPlaceholderAndHint
    textField.scaledPlaceholderOffset = 2.0
    textField.placeholderScaleWhenEditing = 1
    //textField.translatesAutoresizingMaskIntoConstraints = fa
    
  }
  
  static func setupFilterTextfield(_ textField: RAGTextField, backgroundColor: UIColor) {
    let backgroundView = UnderlineView(frame: .zero)
    backgroundView.textField = textField
    backgroundView.foregroundLineWidth = 0
    backgroundView.backgroundColor = backgroundColor
    
    backgroundView.layer.cornerRadius = 5
    backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    
    //textField.delegate = self
    textField.textBackgroundView = backgroundView
    textField.textPadding = UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    textField.textPaddingMode = .textAndPlaceholderAndHint
    textField.scaledPlaceholderOffset = 2.0
    textField.placeholderScaleWhenEditing = 0.8
    //textField.translatesAutoresizingMaskIntoConstraints = fa
    
  }
  
  static func setupForTableCell(_ textField: RAGTextField) {
    let bgView = UnderlineView(frame: .zero)
    bgView.textField = textField
    bgView.foregroundLineWidth = 0.0
    textField.textBackgroundView = bgView
    textField.textPadding = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    textField.textPaddingMode = .textAndPlaceholderAndHint
    textField.scaledPlaceholderOffset = 2.0
    textField.placeholderScaleWhenEditing = 0.8
  }
  
}





