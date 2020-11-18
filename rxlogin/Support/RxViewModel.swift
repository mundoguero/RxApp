//
//  Generics.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 17/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation

class RxViewModel<T> {
    private var businessModel: T!
    
    init(model: T) {
        businessModel = model
    }
    
    func getBusinessModel() -> T {
        return self.businessModel
    }
    
    func getBusinessModelWithProtocol<J>(protoType: J.Type) -> J? {
        return self.businessModel as? J
    }
    
    func disposeModel() {
        self.businessModel = nil
    }
}
