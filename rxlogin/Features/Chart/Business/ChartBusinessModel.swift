//
//  ChartBusinessModel.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class ChartBusinessModel: ChartBusinessProtocol {
    
    private var chartRepository: ChartRepositoryApi = ChartRepositoryApi()
    
    func rx_getAllSubjects() -> Observable<Chart> {
        return self.chartRepository.rx_getAllSubjects().map { json in
            return Chart(json: json)
        }
    }
}
