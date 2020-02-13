//
//  GeneralRepository.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol GeneralRepository {
    func getNewsList(complete: @escaping ([NewsViewModel]) -> (Void))
    func getSocialList()
}

enum GeneralRepoType {
    case remote, local
}

class GeneralRepositoryFactory {
    static func create(type: GeneralRepoType) -> GeneralRepository {
        switch type {
        case .remote:
            return RemoteGeneralRepository()
        case .local:
            return LocalGeneralRepository()
        }
    }
}

class RemoteGeneralRepository: GeneralRepository {
    func getNewsList(complete: @escaping ([NewsViewModel]) -> (Void)) {
        NetworkService.request(method: .get,
                               reqURL: Constants.General.News.list,
                               parameters: DictionaryType(),
                               headers: HeadersType())
        { (newsCollection: NewsResponse) in
            var newsViewModels = [NewsViewModel]()
            for news in newsCollection.newsCollection {
                newsViewModels.append(NewsViewModel(news: news))
            }
            complete(newsViewModels)
        }
    }
    
    func getSocialList() {
        
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalGeneralRepository: GeneralRepository {
    func getNewsList(complete: @escaping ([NewsViewModel]) -> (Void)) {
        
    }
    
    func getSocialList() {
        
    }
}
