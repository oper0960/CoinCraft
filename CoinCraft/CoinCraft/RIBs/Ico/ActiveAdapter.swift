//
//  ActiveAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class ActiveAdapter: SegmentInnerView, SegmentBuildable, ActiveListener {

    let name = "Active"
    
    var builder: SegmentBuildable {
        return self
    }

    private let activeBuilder: ActiveBuilder

    private weak var listener: SegmentInnerViewListener?

    init(dependency: ActiveDependency) {
        activeBuilder = ActiveBuilder(dependency: dependency)
    }

    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return activeBuilder.build(withListener: self)
    }
}
