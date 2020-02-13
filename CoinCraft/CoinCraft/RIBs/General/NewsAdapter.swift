//
//  NewsAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class NewsAdapter: SegmentInnerView, SegmentBuildable {
    
    let name = "News"
    
    var builder: SegmentBuildable {
        return self
    }

    private let newsBuilder: NewsBuilder

    private weak var listener: SegmentInnerViewListener?

    init(dependency: NewsDependency) {
        newsBuilder = NewsBuilder(dependency: dependency)
    }

    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return newsBuilder.build(withListener: self)
    }
}

extension NewsAdapter: NewsListener {
    // MARK: - From NewsInteractor
    func presentRequestNews(news: NewsViewModel) {
        listener?.presentRequestForGeneral(news: news)
    }
}
