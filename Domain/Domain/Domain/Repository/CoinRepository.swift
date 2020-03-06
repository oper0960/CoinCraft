//
//  CoinRepository.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - UseCase 에서 전달 될 데이터를 Network, Realm, SQLite 등 Data Access 를 통해 받은 데이터를 전달

public protocol CoinRepository {
    func getCoinMarketCapList(start: String, limit: String) -> Observable<[CoinViewable]>
    func getCryptoCompareList() -> Observable<[CoinMasterViewable]>
    func getCryptoCompareDetail(id: String) -> Observable<CoinDetailViewable>
}


