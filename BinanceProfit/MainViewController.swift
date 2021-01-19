//
//  MainViewController.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import Foundation
import UIKit
import RAGTextField
import ProgressHUD

class MainViewController: UIViewController {
  
  let basicClient = BinanceClient()
  var timer = Timer()
  var btcValue = Float32()
  
  
  //MARK:- Label Object
  fileprivate let definitionLabel: UILabel = {
    let label = UILabel()
    label.font = BinanceProfitDefaults.DefinitionLabelFont
    label.text = BinanceProfitDefaults.DefinitionLabelText
    label.textColor = BinanceProfitDefaults.DefinitionLabelColor
    label.textAlignment = .center
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  fileprivate let explanationLabel: UILabel = {
    let label = UILabel()
    label.font = BinanceProfitDefaults.ExplanationLabelFont
    label.text = BinanceProfitDefaults.ExplanationLabelText
    label.textColor = BinanceProfitDefaults.ExplanationLabelColor
    label.textAlignment = .center
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK:- ScrollView, View and ImageView Object
  fileprivate lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .never
    scrollView.contentInset = .zero // ScrollViews have insets naturally - remove them
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.showsVerticalScrollIndicator = false
    //scrollView.backgroundColor = .red
    return scrollView
  }()

  fileprivate lazy var scrollViewContainer: UIView = {
    let containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    //containerView.backgroundColor = .blue
    return containerView
  }()
  
  //MARK:- Textfield Object
  fileprivate lazy var currentBTCUSDSPriceTextField: UITextField = {
    let textField = RAGTextField()
    textField.placeholderMode = .scalesWhenNotEmpty
    textField.leftViewMode = .always
    textField.rightViewMode = .never
    //textField.keyboardType = .default
    //textField.autocapitalizationType = .none
    textField.tag = 0
    textField.font = BinanceProfitDefaults.TextFieldTextFont
    textField.placeholderFont = BinanceProfitDefaults.TextFieldPlaceholderFont
    textField.textColor = BinanceProfitDefaults.TextFieldTextColor
    textField.placeholderColor = BinanceProfitDefaults.TextFieldPlaceholderColor
    textField.placeholder = BinanceProfitDefaults.CurrentBTCUSDSPriceTextFieldPlaceholderText
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  
  fileprivate lazy var buyLongBTCPriceTextField: UITextField = {
    let textField = RAGTextField()
    textField.placeholderMode = .scalesWhenNotEmpty
    textField.leftViewMode = .always
    textField.rightViewMode = .never
    textField.tag = 0
    textField.font = BinanceProfitDefaults.TextFieldTextFont
    textField.placeholderFont = BinanceProfitDefaults.TextFieldPlaceholderFont
    textField.textColor = BinanceProfitDefaults.TextFieldTextColor
    textField.placeholderColor = BinanceProfitDefaults.TextFieldPlaceholderColor
    textField.placeholder = BinanceProfitDefaults.BuyLongBTCPriceTextFieldPlaceholderText
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  
  fileprivate lazy var sellShortBTCPriceTextField: UITextField = {
    let textField = RAGTextField()
    textField.placeholderMode = .scalesWhenNotEmpty
    textField.leftViewMode = .always
    textField.rightViewMode = .never
    textField.tag = 0
    textField.font = BinanceProfitDefaults.TextFieldTextFont
    textField.placeholderFont = BinanceProfitDefaults.TextFieldPlaceholderFont
    textField.textColor = BinanceProfitDefaults.TextFieldTextColor
    textField.placeholderColor = BinanceProfitDefaults.TextFieldPlaceholderColor
    textField.placeholder = BinanceProfitDefaults.SellShortBTCPriceTextFieldPlaceholderText
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  fileprivate let longBuyButton: UIButton = {
    let button = UIButton(type: .custom)
    let buttonBackgroundImage = BinanceProfitDefaults.BuyLongButtonImage
    button.setBackgroundImage(buttonBackgroundImage, for: .normal)
    button.setTitle(BinanceProfitDefaults.BuyLongButtonTitle, for: .normal)
    button.setTitleColor(BinanceProfitDefaults.ButtonTitleColor, for: .normal)
    button.titleLabel?.font = BinanceProfitDefaults.ButtonFont
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    button.contentVerticalAlignment = .center
    button.contentHorizontalAlignment = .center
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Device.alignToScreenWidth(percent: 6)
    button.addTarget(self, action: #selector(handleBuyLongPriceCopy), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  fileprivate let sellShortButton: UIButton = {
    let button = UIButton(type: .custom)
    let buttonBackgroundImage = BinanceProfitDefaults.SellShortButtonImage
    button.setBackgroundImage(buttonBackgroundImage, for: .normal)
    button.setTitle(BinanceProfitDefaults.SellShortButtonTitle, for: .normal)
    button.setTitleColor(BinanceProfitDefaults.ButtonTitleColor, for: .normal)
    button.titleLabel?.font = BinanceProfitDefaults.ButtonFont
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    button.contentVerticalAlignment = .center
    button.contentHorizontalAlignment = .center
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Device.alignToScreenWidth(percent: 6)
    button.addTarget(self, action: #selector(handleShortSellPriceCopy), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    view.backgroundColor = BinanceProfitDefaults.BackgroundColor
    setupMainViewController()
    currentBTCUSDSPriceTextField.isEnabled = false
    buyLongBTCPriceTextField.isEnabled = false
    sellShortBTCPriceTextField.isEnabled = false
    let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(viewTapGesture)
    scheduledTimerWithTimeInterval()
  }
  

  
  
  func scheduledTimerWithTimeInterval(){
      // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
    timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateBTCPrice), userInfo: nil, repeats: true)
  }
  
  @objc func updateBTCPrice(){
//    basicClient.ping { (error) in
//        if let error = error {
//            // There was an error communicating with the Binance API servers!
//            print(error)
//        } else {
//            print("Successfully pinged the Binance API Servers!")
//        }
//    }
//
//    basicClient.getServerTime { (epochTime, error) in
//        if let error = error {
//            // There was an error communicating with the Binance API servers!
//            print(error)
//        } else {
//            print("We got the server time! It is: \(epochTime!)")
//            print(String(Date().timeIntervalSince1970))
//        }
//    }
  
  

    basicClient.getAllPrices { (prices, error) in
        guard let prices = prices else {
            print("Error in getting all prices!")
            return
        }

      let coinId = "BTCUSDT"
      let getValue = prices.first {$0.key == coinId}?.value ?? 0
      self.btcValue = Float32(getValue)
    
      //Please don't forget yourself update risk value
      let longBuyValue = (self.btcValue - (self.btcValue * (47.1234/100)/125))
      let shortSellValue = (self.btcValue + (self.btcValue * (47.1234/100)/125))
      
      DispatchQueue.main.async {
        self.currentBTCUSDSPriceTextField.text = "\(self.btcValue)"
        self.buyLongBTCPriceTextField.text = "\(longBuyValue)"
        self.sellShortBTCPriceTextField.text = "\(shortSellValue)"
      }
    }
  }
  
  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}

extension MainViewController {
  
  func setupMainViewController(){

    view.addSubview(scrollView)
    NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                  scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                  scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                  scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    scrollView.addSubview(scrollViewContainer)
    NSLayoutConstraint.activate([scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                 scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                 scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -Device.alignToScreenWidth(percent: 10))
    ])
    
    scrollViewContainer.addSubview(definitionLabel)
    NSLayoutConstraint.activate([definitionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Device.alignToScreenWidth(percent: 5)),
                                 definitionLabel.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 definitionLabel.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor)
    ])
    
    scrollViewContainer.addSubview(explanationLabel)
    NSLayoutConstraint.activate([explanationLabel.topAnchor.constraint(equalTo: definitionLabel.bottomAnchor, constant: Device.alignToScreenWidth(percent: 2)),
                                 explanationLabel.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 explanationLabel.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor)
    ])
    
    scrollViewContainer.addSubview(currentBTCUSDSPriceTextField)
    currentBTCUSDSPriceTextField.delegate = self
    currentBTCUSDSPriceTextField.leftView = SetupTextField.makeViewIconWithTintColor(setImage: BinanceProfitDefaults.BPDUsdIcon, setImageColor: BinanceProfitDefaults.TextFieldPlaceholderColor)
    //currentBTCUSDSPriceTextField.rightView = SetupTextField.makeViewIcon(setImage: SophieDefaults.SDSelectedCircleIcon)
    SetupTextField.setup(currentBTCUSDSPriceTextField as! RAGTextField, backgroundColor: BinanceProfitDefaults.TextFieldBackgroundColor)
    NSLayoutConstraint.activate([currentBTCUSDSPriceTextField.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: Device.alignToScreenWidth(percent: 5)),
                                 currentBTCUSDSPriceTextField.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 currentBTCUSDSPriceTextField.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor)
    ])
    
    scrollViewContainer.addSubview(buyLongBTCPriceTextField)
    buyLongBTCPriceTextField.delegate = self
    buyLongBTCPriceTextField.leftView = SetupTextField.makeViewIconWithTintColor(setImage: BinanceProfitDefaults.BPDUsdIcon, setImageColor: BinanceProfitDefaults.TextFieldPlaceholderColor)
    //currentBTCUSDSPriceTextField.rightView = SetupTextField.makeViewIcon(setImage: SophieDefaults.SDSelectedCircleIcon)
    SetupTextField.setup(buyLongBTCPriceTextField as! RAGTextField, backgroundColor: BinanceProfitDefaults.TextFieldBackgroundColor)
    NSLayoutConstraint.activate([buyLongBTCPriceTextField.topAnchor.constraint(equalTo: currentBTCUSDSPriceTextField.bottomAnchor, constant: Device.alignToScreenWidth(percent: 5)),
                                 buyLongBTCPriceTextField.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 buyLongBTCPriceTextField.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor)
    ])
    
    scrollViewContainer.addSubview(sellShortBTCPriceTextField)
    sellShortBTCPriceTextField.delegate = self
    sellShortBTCPriceTextField.leftView = SetupTextField.makeViewIconWithTintColor(setImage: BinanceProfitDefaults.BPDUsdIcon, setImageColor: BinanceProfitDefaults.TextFieldPlaceholderColor)
    //currentBTCUSDSPriceTextField.rightView = SetupTextField.makeViewIcon(setImage: SophieDefaults.SDSelectedCircleIcon)
    SetupTextField.setup(sellShortBTCPriceTextField as! RAGTextField, backgroundColor: BinanceProfitDefaults.TextFieldBackgroundColor)
    NSLayoutConstraint.activate([sellShortBTCPriceTextField.topAnchor.constraint(equalTo: buyLongBTCPriceTextField.bottomAnchor, constant: Device.alignToScreenWidth(percent: 5)),
                                 sellShortBTCPriceTextField.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 sellShortBTCPriceTextField.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor)
    ])
    
    
    scrollViewContainer.addSubview(longBuyButton)
    NSLayoutConstraint.activate([longBuyButton.topAnchor.constraint(equalTo: sellShortBTCPriceTextField.bottomAnchor, constant: Device.alignToScreenWidth(percent: 15)),
                                 longBuyButton.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 longBuyButton.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
                                 longBuyButton.heightAnchor.constraint(equalToConstant: Device.alignToScreenWidth(percent: 12))
    ])
    
    
    scrollViewContainer.addSubview(sellShortButton)
    NSLayoutConstraint.activate([sellShortButton.topAnchor.constraint(equalTo: longBuyButton.bottomAnchor, constant: Device.alignToScreenWidth(percent: 5)),
                                 sellShortButton.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
                                 sellShortButton.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
                                 sellShortButton.heightAnchor.constraint(equalToConstant: Device.alignToScreenWidth(percent: 12))
    ])
    scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}

//MARK:- Handle Functions
extension MainViewController {
  
  @objc private func handleBuyLongPriceCopy(){
    UIPasteboard.general.string = "\(String(describing: buyLongBTCPriceTextField.text!))"
    ProgressHUD.showSuccess(BinanceProfitDefaults.BuyLongPriceCopied)
  }
  
  @objc private func handleShortSellPriceCopy(){
    UIPasteboard.general.string = "\(String(describing: sellShortBTCPriceTextField.text!))"
    ProgressHUD.showSuccess(BinanceProfitDefaults.SellShortPriceCopied)
  }
}



extension MainViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
      nextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    return false
  }
}
