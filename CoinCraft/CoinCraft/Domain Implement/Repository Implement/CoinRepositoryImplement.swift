//
//  CoinRepositoryImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CoinRepositoryImplement: CoinRepository {
    
    private let dataStore: CoinDataStore
    
    init(dataStore: CoinDataStore) {
        self.dataStore = dataStore
    }
    
    func getCoinMarketCapList() -> Observable<[CoinMarketCapViewModel]> {
        return dataStore.getCoinMarketCapList()
    }
    
    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return dataStore.getCryptoCompareList()
    }
    
    func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel> {
        return dataStore.getCryptoCompareDetail(id: id)
    }
}
