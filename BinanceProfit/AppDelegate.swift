//
//  AppDelegate.swift
//  Binance Profit
//
//  Created by Tundzhay Dzhansaz on 17.01.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    //MARK:- UI initialization
    window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = MainViewController()
    self.window?.makeKeyAndVisible()
    return true
  }


  //---------------------------------------------------------------------------------------------------------------------------------------------
  func applicationWillResignActive(_ application: UIApplication) {

  }

  //---------------------------------------------------------------------------------------------------------------------------------------------
  func applicationDidEnterBackground(_ application: UIApplication) {
    
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------
  func applicationWillEnterForeground(_ application: UIApplication) {

  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------
  func applicationDidBecomeActive(_ application: UIApplication) {
    
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------
  func applicationWillTerminate(_ application: UIApplication) {

  }


}

