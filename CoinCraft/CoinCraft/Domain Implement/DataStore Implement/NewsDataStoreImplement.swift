//
//  NewsDataStoreImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxAlamofire
import Alamofire

public struct NewsDataStoreImplement: NewsDataStore {
    
    public init() {}
    
    public func getNewsList() -> Observable<[NewsViewable]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.General.News.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try JSONDecoder().decode(NewsCodable.self, from: data)

                var newsViewModels = [NewsViewModel]()
                for news in decodableJson.news {
                    newsViewModels.append(NewsViewModel(news: news))
                }

                return newsViewModels
        }
    }
}
