//
//  NewsDataStore.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/27.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 상황에 따라 가공할 데이터를 요청

public protocol NewsDataStore {
    func getNewsList() -> Observable<[PaperViewModel]>
}

public struct NewsDataStoreImpl: NewsDataStore {
    
    public init() {}
    
    private let disposeBag = DisposeBag()
    
    public func getNewsList() -> Observable<[PaperViewModel]> {
        return Observable.create { observer in
            Network.request(method: .get,
                               reqURL: Constant.General.News.list,
                               parameters: DictionaryType(),
                               headers: HeadersType())
            .subscribe(onNext: { (news: News) in
                var paperViewModels = [PaperViewModel]()
                for paper in news.papers {
                    paperViewModels.append(PaperViewModel(paper: paper))
                }
                observer.onNext(paperViewModels)
                observer.onCompleted()
            }, onError: { error in
                observer.onError(error)
            }).disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
}
