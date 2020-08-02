//
//  AppDelegate.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/1/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let vc = LoginViewController.init(nibName: "LoginViewController", bundle: nil)
        let nvc = UINavigationController.init(rootViewController: vc)
        nvc.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginSucess), name: NSNotification.Name(rawValue: Key.LoginSucess.rawValue), object: nil)
        
        _ = AppConfig.sharedInstance()
        
        setUpKeyboard ()
        
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
        
        
        return true
    }

    func setUpKeyboard () {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5.0
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    @objc func loginSucess() {
        let vc = MainViewController.init(nibName: "MainViewController", bundle: nil)
        let nvc = UINavigationController.init(rootViewController: vc)
        nvc.isNavigationBarHidden = true
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        
    }
}

