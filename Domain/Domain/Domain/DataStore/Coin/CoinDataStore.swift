//
//  CoinDataStore.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 상황에 따라 가공할 데이터를 요청

public protocol CoinDataStore {
    func getCoinMarketCapList() -> Observable<[CoinViewModel]>
    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]>
    func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel>
}

public struct CoinDataStoreImpl: CoinDataStore {
    
    public init() {}
    
    private let disposeBag = DisposeBag()
    
    public func getCoinMarketCapList() -> Observable<[CoinViewModel]> {
        return Observable.create { observer in
            
            Network.request(method: .get,
                            reqURL: Constant.Coin.CoinMarketCap.list,
                            parameters: DictionaryType(),
                            headers: HeadersType())
                .subscribe(onNext: { (coins: [Coin]) in
                    var coinViewModels = [CoinViewModel]()
                    for coin in coins {
                        coinViewModels.append(CoinViewModel(coin: coin))
                    }
                    observer.onNext(coinViewModels)
                    observer.onCompleted()
                }, onError: { error in
                    observer.onError(error)
                }).disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    public func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return Observable.create { observer in
            Network.request(method: .get,
                            reqURL: Constant.Coin.CryptoCompare.list,
                            parameters: DictionaryType(),
                            headers: HeadersType())
                .subscribe(onNext: { (response: CryptoCompareResponse) in
                    var compareCoinViewModels = [CompareCoinViewModel]()
                    for coin in response.coins {
                        compareCoinViewModels.append(CompareCoinViewModel(coin: coin))
                    }
                    observer.onNext(compareCoinViewModels)
                    observer.onCompleted()
                }, onError: { error in
                    observer.onError(error)
                }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    public func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel> {
        return Observable.create { observer in
            
            var paramaters = DictionaryType()
            paramaters.updateValue(id, forKey: "id")
            
            Network.request(method: .get,
                            reqURL: Constant.Coin.CryptoCompare.detail,
                            parameters: paramaters,
                            headers: HeadersType())
                .subscribe(onNext: { (coin: CryptoCompareDetailResponse) in
                    observer.onNext(CompareCoinDetailViewModel(detail: coin.detail!))
                    observer.onCompleted()
                }, onError: { error in
                    observer.onError(error)
                }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}
