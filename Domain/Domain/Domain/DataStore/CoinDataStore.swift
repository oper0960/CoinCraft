//
//  CoinDataStore.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 상황에 따라 가공할 데이터를 요청

public protocol CoinDataStore {
    func getCoinMarketCapList(start: String, limit: String) -> Observable<[CoinViewable]>
    func getCryptoCompareList() -> Observable<[CoinMasterViewable]>
    func getCryptoCompareDetail(id: String) -> Observable<CoinDetailViewable>
}


