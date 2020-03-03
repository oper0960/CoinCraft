//
//  CryptoCompareListUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CryptoCompareListUseCaseImplement: CryptoCompareListUseCase {
    
    private let coinRepository: CoinRepository

    init (coinRepository: CoinRepository) {
        self.coinRepository = coinRepository
    }
    
    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return coinRepository.getCryptoCompareList()
    }
}
