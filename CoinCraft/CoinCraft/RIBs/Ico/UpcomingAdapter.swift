//
//  UpcomingAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class UpComingAdapter: SegmentInnerView, SegmentBuildable, UpComingListener {

    let name = "UpComing"
    
    var builder: SegmentBuildable {
        return self
    }

    private let upcomingBuilder: UpComingBuilder

    private weak var listener: SegmentInnerViewListener?

    init(dependency: UpComingDependency) {
        upcomingBuilder = UpComingBuilder(dependency: dependency)
    }

    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return upcomingBuilder.build(withListener: self)
    }
}
