//
//  AuthRepositoryProtocol.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

protocol AuthRepositoryProtocol {
    func rx_authentication() -> Observable<JSON>
}
