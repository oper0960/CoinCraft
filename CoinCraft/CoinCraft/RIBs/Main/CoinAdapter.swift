//
//  CoinAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
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
