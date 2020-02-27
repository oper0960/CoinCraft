//
//  NewsRepository.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Domain

enum GeneralRepoType {
    case remote, local
}

class GeneralRepositoryFactory {
    static func create(type: GeneralRepoType) -> NewsUseCases {
        switch type {
        case .remote:
            return RemoteGeneralRepository()
        case .local:
            return LocalGeneralRepository()
        }
    }
}

class RemoteGeneralRepository: NewsUseCases {
     private var disposeBag = DisposeBag()
    
    func getNewsList<T>(complete: @escaping ([T]) -> (Void)) {
        NetworkService.request(method: .get,
                           reqURL: Constants.General.News.list,
                           parameters: DictionaryType(),
                           headers: HeadersType())
        .subscribe(onNext: { (news: News) in
            var paperViewModels = [PaperViewModel]()
            for paper in news.papers {
                paperViewModels.append(PaperViewModel(paper: paper))
            }
            complete(paperViewModels as! [T])
        }).disposed(by: disposeBag)
    }
}

// MARK: - Only Local Network (Not Usable)
class LocalGeneralRepository: NewsUseCases {
    func getNewsList<T>(complete: @escaping ([T]) -> (Void)) {
        
    }
}
