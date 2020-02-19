//
//  GeneralViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

protocol NewsViewable {
    var id: String { get }
    var guid: String { get }
    var title: String { get }
    var url: String { get }
    var imageUrl: String { get }
    var body: String { get }
    var sourceName: String { get }
    var sourceImageUrl: String { get }
    var tags: String { get }
}

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
