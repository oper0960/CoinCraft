//
//  SocialAdapter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/31.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

class SocialAdapter: SegmentInnerView, SegmentBuildable, SocialListener {

    let name = "Social"
    
    var builder: SegmentBuildable {
        return self
    }

    private let socialBuilder: SocialBuilder

    private weak var listener: SegmentInnerViewListener?

    init(dependency: SocialDependency) {
        socialBuilder = SocialBuilder(dependency: dependency)
    }

    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return socialBuilder.build(withListener: self)
    }
}
