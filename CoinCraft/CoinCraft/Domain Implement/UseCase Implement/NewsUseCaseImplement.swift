//
//  NewsUseCaseImplement.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct NewsUseCaseImplement: NewsUseCase {
    
    private let newsRepository: NewsRepository
    
    init (newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func getNewsList() -> Observable<[NewsViewable]> {
        return newsRepository.getNewsList()
    }
}
