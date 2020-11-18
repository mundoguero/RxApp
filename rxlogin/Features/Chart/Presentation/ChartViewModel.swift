//
//  ChartViewModel.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class ChartViewModel: RxViewModel<ChartBusinessProtocol> {
    func rx_getAllSubjects() -> Observable<Chart> {
        return self.getBusinessModel().rx_getAllSubjects()
    }
}
