//
//  CoinRepository.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol CoinRepository {
    func getCoinMarketCapList(complete: @escaping ([CoinViewModel]) -> (Void))
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void))
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
    func getCoinMarketCapList(complete: @escaping ([CoinViewModel]) -> (Void)) {
        NetworkService.request(method: .get, reqURL: Constants.CoinMarketCap.list, parameters: DictionaryType(), headers: HeadersType()) { (coins: [Coin]) in
            var coinViewModels = [CoinViewModel]()
            for coin in coins {
                coinViewModels.append(CoinViewModel(coin: coin))
            }
            complete(coinViewModels)
        }
    }
    
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void)) {
        NetworkService.progressRequest(method: .get,
                                       reqURL: Constants.CryptoCompare.list,
                                       parameters: DictionaryType(),
                                       headers: HeadersType(),
                                       progressBar: { progress in
                                        progressBar(progress)})
        { (list: CryptoCompareResponse) in
            complete(list)
        }
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalCoinRepository: CoinRepository {
    func getCryptoCompareList(progressBar: @escaping (Double) -> (Void), complete: @escaping (CryptoCompareResponse) -> (Void)) {
        NetworkService.progressRequest(method: .get,
                                       reqURL: Constants.CryptoCompare.list,
                                       parameters: DictionaryType(),
                                       headers: HeadersType(),
                                       progressBar: { progress in
                                        progressBar(progress)})
        { (list: CryptoCompareResponse) in
            complete(list)
        }
    }
    
    func getCoinMarketCapList(complete: ([CoinViewModel]) -> (Void)) {
        complete([CoinViewModel]())
    }
}


