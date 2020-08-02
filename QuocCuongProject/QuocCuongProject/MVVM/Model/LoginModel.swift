//
//  Login.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/1/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import Foundation

class Login_Request : MI {
    @objc dynamic var email = ""
    @objc dynamic var password = ""
}


class Login_DTO : MI {
    @objc dynamic var result = true
    @objc dynamic var message = ""
    @objc dynamic var data : Any?
}

class LoginData : MI {
    @objc dynamic var id = 0
    @objc dynamic var email = ""
    @objc dynamic var name = ""
    @objc dynamic var facebook_id = ""
    @objc dynamic var google_id = ""
    @objc dynamic var device_token = ""
    @objc dynamic var access_token = ""
}
