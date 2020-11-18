//
//  ChartBusinessProtocol.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

protocol ChartBusinessProtocol {
    func rx_getAllSubjects() -> Observable<Chart>
}
