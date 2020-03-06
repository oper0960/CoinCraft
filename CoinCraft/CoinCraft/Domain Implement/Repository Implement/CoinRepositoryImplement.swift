//
//  CoinRepositoryImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CoinRepositoryImplement: CoinRepository {
    
    private let dataStore: CoinDataStore
    
    init(dataStore: CoinDataStore) {
        self.dataStore = dataStore
    }
    
    func getCoinMarketCapList(start: String, limit: String) -> Observable<[CoinViewable]> {
        return dataStore.getCoinMarketCapList(start: start, limit: limit)
    }
    
    func getCryptoCompareList() -> Observable<[CoinMasterViewable]> {
        return dataStore.getCryptoCompareList()
    }
    
    func getCryptoCompareDetail(id: String) -> Observable<CoinDetailViewable> {
        return dataStore.getCryptoCompareDetail(id: id)
    }
}
