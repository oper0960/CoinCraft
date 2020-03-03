//
//  NewsRepositoryImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct NewsRepositoryImpl: NewsRepository {
    
    private let dataStore: NewsDataStore
    
    init(dataStore: NewsDataStore) {
        self.dataStore = dataStore
    }
    
    func getNewsList() -> Observable<[PaperViewModel]> {
        return dataStore.getNewsList()
    }
}
