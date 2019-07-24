//
//  PasswordViewModel.swift
//  RxUserLogin
//
//  Created by 이재은 on 21/07/2019.
//  Copyright © 2019 jaeeun. All rights reserved.
//

import RxRelay

class PasswordViewModel: ValidationViewModel {
    var errorMessage: String = "Please enter a valid Password"
    
    var data: BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        guard validateLength(text: data.value, size: (6,15)) else {
            errorValue.accept(errorMessage)
            return false
        }
        
        errorValue.accept("")
        return true
    }
    
    func validateLength(text: String, size: (min: Int, max: Int)) -> Bool {
        return (size.min...size.max).contains(text.count)
    }
}
