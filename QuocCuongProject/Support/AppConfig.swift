//
//  AppConfig.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/2/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation

let appConfig = AppConfig.sharedInstance()
public class AppConfig: NSObject {
    public static var instance: AppConfig!
    @objc public class func sharedInstance() -> AppConfig {
        if(self.instance == nil) {
            self.instance = (self.instance ?? AppConfig())
            
        }
        self.instance.loadData()
        return self.instance
    }
    
    
    var isSaveLogin = false
    var customerId = ""
    var password = ""
    var access_Token = ""
    
    public func loadData() {
        let userDefaults = UserDefaults.standard
        customerId = userDefaults.string(forKey: Key.SaveUserName.rawValue) ?? ""
        password = userDefaults.string(forKey: Key.SavePassword.rawValue) ?? ""
    }
    
    public func loadAccessToken() {
        let userDefaults = UserDefaults.standard
        access_Token = userDefaults.string(forKey: Key.SaveToken.rawValue) ?? ""
    }
    
    
    public func saveData() {
        let userDefaults = UserDefaults.standard
 
        userDefaults.set(customerId, forKey: Key.SaveUserName.rawValue)
        userDefaults.set(password, forKey: Key.SavePassword.rawValue)
        userDefaults.set(access_Token, forKey: Key.SaveToken.rawValue)
    }
    
    public func removeData() {
        let userDefaults = UserDefaults.standard

        userDefaults.removeObject(forKey: Key.SaveUserName.rawValue)
        userDefaults.removeObject(forKey: Key.SavePassword.rawValue)
        userDefaults.removeObject(forKey: Key.SaveToken.rawValue)
    }


}
