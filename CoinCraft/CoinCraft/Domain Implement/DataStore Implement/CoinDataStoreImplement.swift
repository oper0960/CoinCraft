//
//  CoinDataStoreImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import Domain
import SwiftyJSON

struct CoinDataStoreImplement: CoinDataStore {
    
    init() {}

    func getCoinMarketCapList(start: String, limit: String) -> Observable<[CoinViewable]> {
        
        
        var paramaters = DictionaryType()
        paramaters.updateValue(start, forKey: "start")
        paramaters.updateValue(limit, forKey: "limit")
        
        var headers = HeadersType()
        headers.updateValue(Constants.Key.coinMarketCapKey, forKey: "X-CMC_PRO_API_KEY")
        
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CoinMarketCap.list)!,
                                       parameters: paramaters,
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: headers)
            .map { _ , data in
                
                let decodableJson = try! JSONDecoder().decode(CoinMarketCapCodable.self, from: data)

                var coinViewModels = [CoinMarketCapCoinViewModel]()
                
                guard let coins = decodableJson.coins else { return [CoinMarketCapCoinViewModel]() }
                
                for coin in coins {
                    coinViewModels.append(CoinMarketCapCoinViewModel(coin: coin))
                }
                return coinViewModels
        }
    }

    func getCryptoCompareList() -> Observable<[CoinMasterViewable]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CryptoCompare.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try JSONDecoder().decode(CryptoCompareCoinCodable.self, from: data)

                var compareCoinViewModels = [CryptoCompareCoinViewModel]()
                for coin in decodableJson.coins {
                    compareCoinViewModels.append(CryptoCompareCoinViewModel(coin: coin))
                }

                return compareCoinViewModels
        }
    }

    func getCryptoCompareDetail(id: String) -> Observable<CoinDetailViewable> {
        
        var paramaters = DictionaryType()
        paramaters.updateValue(id, forKey: "id")
        
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CryptoCompare.detail)!,
                                       parameters: paramaters,
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try! JSONDecoder().decode(CryptoCompareCoinDetailCodable.self, from: data)

                return CryptoCompareCoinDetailViewModel(detail: decodableJson.detail!)
        }
    }
}
