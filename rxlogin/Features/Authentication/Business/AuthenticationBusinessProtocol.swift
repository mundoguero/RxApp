//
//  AuthenticationBusinessProtocol.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

protocol AuthenticationBusinessProtocol {
    func rx_authentication() -> Observable<Auth>
}
