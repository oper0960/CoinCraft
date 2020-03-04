//
//  NewsViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain

struct NewsViewModel: NewsViewable {
    
    private let news: News
    
    init(news: News) {
        self.news = news
    }
    
    var id: String {
        return news.id ?? ""
    }
    
    var guid: String {
        return news.guid ?? ""
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var imageUrl: String {
        return news.imageurl ?? ""
    }
    
    var body: String {
        return news.body ?? ""
    }
    
    var sourceName: String {
        return news.sourceInfo?.name ?? ""
    }
    
    var sourceImageUrl: String {
        return news.sourceInfo?.img ?? ""
    }
    
    var tags: String {
        return news.tags ?? ""
    }
}
