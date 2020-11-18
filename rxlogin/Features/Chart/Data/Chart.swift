//
//  Chart.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

public struct Chart {
    public var subjects: [Subject] = []
    
    public init(){}
    
    public init(json: JSON) {
        self.subjects = json.arrayValue.map { Subject(json: $0) }
    }
    
    init(_ dict: [String: Any]) {
        self.subjects = dict[""] as? [Subject] ?? []
    }
    
    func toDict() -> [String: Any] {
        return ["": subjects]
    }
}

public struct Subject {
    public var title: String = ""
    public var uid: Int = 0
    
    public init(json: JSON) {
        self.uid = json["id"].intValue
        self.title = json["title"].stringValue
    }
    
    init(_ dict: [String: Any]) {
        self.title = dict["title"] as? String ?? ""
        self.uid = dict["id"] as? Int ?? 0
    }
    
    func toDict() -> [String: Any] {
        return [
            "title": title,
            "id": uid]
    }
}
