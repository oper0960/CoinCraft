//
//  CoinAdapter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

class CoinAdapter: TabbarInnerView, TabbarBuildable, CoinListener {

    let name = "Coin"
    
    var builder: TabbarBuildable {
        return self
    }

    private let coinBuilder: CoinBuilder

    private weak var listener: TabbarInnerViewListener?

    init(dependency: CoinDependency) {
        coinBuilder = CoinBuilder(dependency: dependency)
    }

    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return coinBuilder.build(withListener: self)
    }
}
