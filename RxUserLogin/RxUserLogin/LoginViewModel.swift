//
//  LoginViewModel.swift
//  RxUserLogin
//
//  Created by 이재은 on 22/07/2019.
//  Copyright © 2019 jaeeun. All rights reserved.
//

import RxSwift
import RxRelay

class LoginViewModel {
    let model: LoginModel = LoginModel()
    let disposebag = DisposeBag()
    
    // Initialise ViewModel's
    let emailIdViewModel = EmailIdViewModel()
    let passwordViewModel = PasswordViewModel()
    
    // Fields that bind to our view's
    let isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let errorMsg: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    // BehaviorRelay: 에러나 completed로 종료되지 않음
    
    func validateCredentials() -> Bool {
        return emailIdViewModel.validateCredentials() && passwordViewModel.validateCredentials()
    }
    
    func loginUser() {
        // Initialise model with filled values
        model.email = emailIdViewModel.data.value
        model.password = passwordViewModel.data.value
        
        self.isLoading.accept(true)
        
//        let result = Request(email: model.email, password: model.password)
//        APIService.execute(result)
//            .subscribe(onNext: { response in
//                self.isLoading.value = false
//                self.isSuccess.value = true
//            }, onError: { error in
//                self.isLoading.value = false
//                self.errorMsg.value = error.message
//            }).disposed(by: disposebag)
    }
}
