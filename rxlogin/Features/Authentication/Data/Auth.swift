//
//  Auth.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class Auth {
    var password: String = ""
    
    public init(){}
    
    public init(json: JSON) {
        self.password = json["password"].stringValue
    }
    
    init(_ dict: [String: Any]) {
        self.password = dict["password"] as? String ?? ""
    }
    
    func toDict() -> [String: Any] {
        return ["password": password]
    }
}
