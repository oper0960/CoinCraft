//
//  CoinRepository.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CoinRepository {
    func getCoinMarketCapList(complete: @escaping ([CoinViewModel]) -> (Void))
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void))
    func getCompareCoinDetail(id: String, complete: @escaping (CompareCoinDetail) -> (Void))
}

enum CoinRepoType {
    case remote, local
}

class CoinRepositoryFactory {
    static func create(type: CoinRepoType) -> CoinRepository {
        switch type {
        case .remote:
            return RemoteCoinRepository()
        case .local:
            return LocalCoinRepository()
        }
    }
}

class RemoteCoinRepository: CoinRepository {
    
    private var disposeBag = DisposeBag()
    
    // MARK: - CoinMarketCap List
    func getCoinMarketCapList(complete: @escaping ([CoinViewModel]) -> (Void)) {
        
        NetworkService.request(method: .get,
                               reqURL: Constants.Coin.CoinMarketCap.list,
                               parameters: DictionaryType(),
                               headers: HeadersType())
            .subscribe(onNext: { (coins: [Coin]) in
                var coinViewModels = [CoinViewModel]()
                for coin in coins {
                    coinViewModels.append(CoinViewModel(coin: coin))
                }
                complete(coinViewModels)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - CryptoCompareCoin List
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void)) {
        NetworkService.request(method: .get,
                               reqURL: Constants.Coin.CryptoCompare.list,
                               parameters: DictionaryType(),
                               headers: HeadersType())
            .subscribe(onNext: { (list: CryptoCompareResponse) in
                complete(list)
            }).disposed(by: disposeBag)
    }
    
    // MARK: - CryptoCompareCoin Detail
    func getCompareCoinDetail(id: String, complete: @escaping (CompareCoinDetail) -> (Void)) {
        
        var paramaters = DictionaryType()
        paramaters.updateValue(id, forKey: "id")
        
        NetworkService.request(method: .get,
                               reqURL: Constants.Coin.CryptoCompare.detail,
                               parameters: paramaters,
                               headers: HeadersType())
            .subscribe(onNext: { (coin: CryptoCompareDetailResponse) in
                complete(coin.detail!)
            }).disposed(by: disposeBag)
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalCoinRepository: CoinRepository {
    
    private var disposeBag = DisposeBag()
    
    func getCoinMarketCapList(complete: @escaping ([CoinViewModel]) -> (Void)) {
    NetworkService.request(method: .get,
                                 reqURL: Constants.Coin.CoinMarketCap.list,
                                 parameters: DictionaryType(),
                                 headers: HeadersType())
              .subscribe(onNext: { (coins: [Coin]) in
                  var coinViewModels = [CoinViewModel]()
                  for coin in coins {
                      coinViewModels.append(CoinViewModel(coin: coin))
                  }
                  complete(coinViewModels)
              }).disposed(by: disposeBag)
    }
    
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void)) {
        NetworkService.request(method: .get,
                           reqURL: Constants.Coin.CryptoCompare.list,
                           parameters: DictionaryType(),
                           headers: HeadersType())
        .subscribe(onNext: { (list: CryptoCompareResponse) in
            complete(list)
        }).disposed(by: disposeBag)
    }
    
    func getCompareCoinDetail(id: String, complete: @escaping (CompareCoinDetail) -> (Void)) {
        
        var paramaters = DictionaryType()
        paramaters.updateValue(id, forKey: "id")
        
        NetworkService.request(method: .get,
                               reqURL: Constants.Coin.CryptoCompare.detail,
                               parameters: paramaters,
                               headers: HeadersType())
            .subscribe(onNext: { (coin: CryptoCompareDetailResponse) in
                complete(coin.detail!)
            }).disposed(by: disposeBag)
    }
}


