//
//  NewsUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct NewsUseCaseImpl: NewsUseCase {
    
    private let newsRepository: NewsRepository
    
    init (newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func getNewsList() -> Observable<[PaperViewModel]> {
        return newsRepository.getNewsList()
    }
}
