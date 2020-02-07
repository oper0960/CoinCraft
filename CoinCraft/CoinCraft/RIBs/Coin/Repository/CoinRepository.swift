//
//  CoinRepository.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol CoinRepository {
    func getAll(complete: @escaping ([CoinViewModel]) -> (Void))
    func getAllList(complete: @escaping (AllCoinResponse) -> (Void))
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
    func getAll(complete: @escaping ([CoinViewModel]) -> (Void)) {
        NetworkService.request(method: .get, reqURL: Constants.CoinMarketCap.list, parameters: DictionaryType(), headers: HeadersType()) { (coins: [Coin]) in
            var coinViewModels = [CoinViewModel]()
            for coin in coins {
                coinViewModels.append(CoinViewModel(coin: coin))
            }
            complete(coinViewModels)
        }
    }
    
    func getAllList(complete: @escaping (AllCoinResponse) -> (Void)) {
        NetworkService.progressRequest(method: .get, reqURL: Constants.CryptoCompare.list, parameters: DictionaryType(), headers: HeadersType()) { (list: AllCoinResponse) in
            
            complete(list)
        }
    }
}

class LocalCoinRepository: CoinRepository {
    func getAllList(complete: @escaping (AllCoinResponse) -> (Void)) {
        NetworkService.request(method: .get, reqURL: Constants.CoinMarketCap.list, parameters: DictionaryType(), headers: HeadersType()) { (list: AllCoinResponse) in
            complete(list)
        }
    }
    
    func getAll(complete: ([CoinViewModel]) -> (Void)) {
        complete([CoinViewModel]())
    }
}


