//
//  CoinRepository.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - UseCase 에서 전달 될 데이터를 Network, Realm, SQLite 등 Data Access 를 통해 받은 데이터를 전달

public protocol CoinRepository {
    func getCoinMarketCapList() -> Observable<[CoinViewModel]>
    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]>
    func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel>
}

public struct CoinRepositoryImpl: CoinRepository {
    
    private let dataStore: CoinDataStore
    
    public init(dataStore: CoinDataStore) {
        self.dataStore = dataStore
    }
    
    public func getCoinMarketCapList() -> Observable<[CoinViewModel]> {
        return dataStore.getCoinMarketCapList()
    }
    
    public func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return dataStore.getCryptoCompareList()
    }
    
    public func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel> {
        return dataStore.getCryptoCompareDetail(id: id)
    }
}
