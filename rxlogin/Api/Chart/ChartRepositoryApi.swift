//
//  ChartRepositoryApi.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

class ChartRepositoryApi: ChartRepositoryProtocol {
    func rx_getAllSubjects() -> Observable<JSON> {
        
        guard let url = URL(string: "http://my-json-server.typicode.com/mundoguero/fakeAPI/subjects") else {
            return Observable.just([])
        }
        
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

                guard let data = data else {
                    return
                }
                
                do {
                    let json = try JSON(data: data)
                    observer.onNext(json)
                    observer.onCompleted()
                } catch let error {
                    observer.onError(error)
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
