//
//  ValidationViewModel.swift
//  RxUserLogin
//
//  Created by 이재은 on 21/07/2019.
//  Copyright © 2019 jaeeun. All rights reserved.
//

import RxRelay

protocol ValidationViewModel {
    var errorMessage: String { get }
    
    // Observables
    var data: BehaviorRelay<String> { get set }
    var errorValue: BehaviorRelay<String?> { get }
    
    // Validation
    func validateCredentials () -> Bool
}

