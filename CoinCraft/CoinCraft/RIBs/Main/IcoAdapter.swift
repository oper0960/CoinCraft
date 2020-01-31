//
//  IcoAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class IcoAdapter: TabbarInnerView, TabbarBuildable, IcoListener {

    let name = "ICO"
    
    var builder: TabbarBuildable {
        return self
    }

    private let icoBuilder: IcoBuilder

    private weak var listener: TabbarInnerViewListener?

    init(dependency: IcoDependency) {
        icoBuilder = IcoBuilder(dependency: dependency)
    }

    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return icoBuilder.build(withListener: self)
    }
}
