//
//  CoinMarketCapListUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CoinMarketCapListUseCaseImplement: CoinMarketCapListUseCase {
    
    private let coinRepository: CoinRepository

    init (coinRepository: CoinRepository) {
        self.coinRepository = coinRepository
    }

    func getCoinMarketCapList(start: String, limit: String) -> Observable<[CoinViewable]> {
        return coinRepository.getCoinMarketCapList(start: start, limit: limit)
    }
}
