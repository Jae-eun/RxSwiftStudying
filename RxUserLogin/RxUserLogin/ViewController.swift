//
//  ViewController.swift
//  RxUserLogin
//
//  Created by 이재은 on 21/07/2019.
//  Copyright © 2019 jaeeun. All rights reserved.
//
// https://medium.com/swift2go/mvvm-with-rxswift-the-user-login-cc43df423c9e

import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViewModelBinding()
        createCallbacks()
    }
    
    func createViewModelBinding() {
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailIdViewModel.data)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.passwordViewModel.data)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.do(onNext: { [unowned self] in
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }).subscribe(onNext: { [unowned self] in
            if self.viewModel.validateCredentials() {
                self.viewModel.loginUser()
            }
        }).disposed(by: disposeBag)
    }
    
    func createCallbacks() {
        // success
        viewModel.isSuccess.asObservable()
            .bind { value in
                NSLog("Successfull")
            }.disposed(by: disposeBag)
        
        // errors
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                NSLog("Failure")
            }.disposed(by: disposeBag)
    }
    
}
