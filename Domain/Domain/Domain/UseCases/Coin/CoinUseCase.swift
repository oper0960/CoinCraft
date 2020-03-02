//
//  CoinUseCase.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 실제로 사용 될 데이터를 가공하고 가공된 데이터를 전달

public protocol CoinUseCase {
    func getCoinMarketCapList() -> Observable<[CoinViewModel]>
    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]>
    func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel>
}

public struct CoinUseCaseImpl: CoinUseCase {
    
    private let disposeBag = DisposeBag()
    private let coinRepository: CoinRepository

    public init (coinRepository: CoinRepository) {
        self.coinRepository = coinRepository
    }

    public func getCoinMarketCapList() -> Observable<[CoinViewModel]> {
        return coinRepository.getCoinMarketCapList()
    }
    
    public func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return coinRepository.getCryptoCompareList()
    }
    
    public func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel> {
        return coinRepository.getCryptoCompareDetail(id: id)
    }
}
