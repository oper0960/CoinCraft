//
//  CoinMarketCapListUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CoinMarketCapListUseCaseImplement: CoinMarketCapListUseCase {
    
    private let coinRepository: CoinRepository

    init (coinRepository: CoinRepository) {
        self.coinRepository = coinRepository
    }

    func getCoinMarketCapList() -> Observable<[CoinMarketCapViewModel]> {
        return coinRepository.getCoinMarketCapList()
    }
}
