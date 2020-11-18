//
//  AuthenticationViewModel.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AuthenticationViewModel: RxViewModel<AuthenticationBusinessProtocol> {
    public var username: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    public var password: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var isValid : Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()){ (name, pass) in
            return name.count > 0 && pass.count > 0
        }
    }
    
    func rx_authentication() -> Observable<Auth> {
        return self.getBusinessModel().rx_authentication().delay(.seconds(3), scheduler: MainScheduler.instance)
    }
}
