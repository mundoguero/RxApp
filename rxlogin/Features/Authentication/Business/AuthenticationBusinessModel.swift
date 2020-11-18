//
//  AuthenticationBusinessModel.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

class AuthenticationBusinessModel: AuthenticationBusinessProtocol {
    
    private var authRepository: AuthRepositoryApi = AuthRepositoryApi()
    
    func rx_authentication() -> Observable<Auth> {
        return self.authRepository.rx_authentication().map { json in
            return Auth(json: json)
        }
    }
}
