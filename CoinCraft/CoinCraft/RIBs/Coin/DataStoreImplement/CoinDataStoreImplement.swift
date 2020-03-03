//
//  CoinDataStoreImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import Domain
import SwiftyJSON

struct CoinDataStoreImpl: CoinDataStore {
    
    init() {}

    func getCoinMarketCapList() -> Observable<[CoinViewModel]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CoinMarketCap.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try! JSONDecoder().decode([Coin].self, from: data)

                var coinViewModels = [CoinViewModel]()
                for coin in decodableJson {
                    coinViewModels.append(CoinViewModel(coin: coin))
                }

                return coinViewModels
        }
    }

    func getCryptoCompareList() -> Observable<[CompareCoinViewModel]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CryptoCompare.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try JSONDecoder().decode(CryptoCompareResponse.self, from: data)

                var compareCoinViewModels = [CompareCoinViewModel]()
                for coin in decodableJson.coins {
                    compareCoinViewModels.append(CompareCoinViewModel(coin: coin))
                }

                return compareCoinViewModels
        }
    }

    func getCryptoCompareDetail(id: String) -> Observable<CompareCoinDetailViewModel> {
        
        var paramaters = DictionaryType()
        paramaters.updateValue(id, forKey: "id")
        
        return RxAlamofire.requestData(.get, URL(string: Constants.Coin.CryptoCompare.detail)!,
                                       parameters: paramaters,
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try! JSONDecoder().decode(CryptoCompareDetailResponse.self, from: data)

                return CompareCoinDetailViewModel(detail: decodableJson.detail!)
        }
    }
}
