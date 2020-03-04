//
//  SocialAdapter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/31.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

class MiningAdapter: SegmentInnerView, SegmentBuildable, MiningListener {

    let name = "Mining"
    
    var builder: SegmentBuildable {
        return self
    }

    private let miningBuilder: MiningBuilder

    private weak var listener: SegmentInnerViewListener?

    init(dependency: MiningDependency) {
        miningBuilder = MiningBuilder(dependency: dependency)
    }

    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return miningBuilder.build(withListener: self)
    }
}
