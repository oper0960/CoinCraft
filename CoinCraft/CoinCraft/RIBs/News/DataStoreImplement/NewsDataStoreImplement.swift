//
//  NewsDataStoreImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxAlamofire
import Alamofire

public struct NewsDataStoreImpl: NewsDataStore {
    
    public init() {}
    
    public func getNewsList() -> Observable<[PaperViewModel]> {
        return RxAlamofire.requestData(.get, URL(string: Constants.General.News.list)!,
                                       parameters: DictionaryType(),
                                       encoding: URLEncoding(destination: .methodDependent),
                                       headers: HeadersType())
            .map { _ , data in
                let decodableJson = try! JSONDecoder().decode(News.self, from: data)

                var paperViewModels = [PaperViewModel]()
                for paper in decodableJson.papers {
                    paperViewModels.append(PaperViewModel(paper: paper))
                }

                return paperViewModels
        }
    }
}
