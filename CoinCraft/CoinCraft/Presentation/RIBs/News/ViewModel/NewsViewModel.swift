//
//  NewsViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain

struct NewsViewModel: NewsViewable {
    
    private let paper: Paper
    
    init(paper: Paper) {
        self.paper = paper
    }
    
    var id: String {
        return paper.id ?? ""
    }
    
    var guid: String {
        return paper.guid ?? ""
    }
    
    var title: String {
        return paper.title ?? ""
    }
    
    var url: String {
        return paper.url ?? ""
    }
    
    var imageUrl: String {
        return paper.imageurl ?? ""
    }
    
    var body: String {
        return paper.body ?? ""
    }
    
    var sourceName: String {
        return paper.sourceInfo?.name ?? ""
    }
    
    var sourceImageUrl: String {
        return paper.sourceInfo?.img ?? ""
    }
    
    var tags: String {
        return paper.tags ?? ""
    }
}
