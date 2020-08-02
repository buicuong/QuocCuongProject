//
//  LoginViewModel.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/2/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class  LoginViewModel : NSObject {
    
    var id = 0
    var email = ""
    var name = ""
    var facebook_id = ""
    var google_id = ""
    var device_token = ""
    var access_token = ""
    
    override init() {
    }
    
    init(_ loginData : LoginData) {
        self.id = loginData.id
        self.email = loginData.email
        self.name = loginData.name
        self.facebook_id = loginData.facebook_id
        self.google_id = loginData.google_id
        self.device_token = loginData.device_token
        self.access_token = loginData.access_token
    }
    
}
