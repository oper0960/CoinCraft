//
//  MiningDataStoreImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import Domain
import SwiftyJSON

struct MiningDataStoreImplement: MiningDataStore {
    
    init() {}
    
    func getMiningList() -> Observable<[MiningViewable]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.General.Mining.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try JSONDecoder().decode(MiningCodable.self, from: data)
                
                var miningViewModels = [MiningViewModel]()
                for datum in decodableJson.datums {
                    miningViewModels.append(MiningViewModel(datum: datum))
                }
                
                return miningViewModels
        }
    }
}
