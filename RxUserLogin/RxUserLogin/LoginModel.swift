//
//  LoginModel.swift
//  RxUserLogin
//
//  Created by 이재은 on 21/07/2019.
//  Copyright © 2019 jaeeun. All rights reserved.
//

class LoginModel {
    var email = ""
    var password = ""
    
    convenience init(email: String, password: String) {
        self.init ()
        self.email = email
        self.password = password
    }
}
