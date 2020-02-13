//
//  GeneralAdapter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

class GeneralAdapter: TabbarInnerView, TabbarBuildable, GeneralListener {

    let name = "General"
    
    var builder: TabbarBuildable {
        return self
    }

    private let generalBuilder: GeneralBuilder

    private weak var listener: TabbarInnerViewListener?

    init(dependency: GeneralDependency) {
        generalBuilder = GeneralBuilder(dependency: dependency)
    }

    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return generalBuilder.build(withListener: self)
    }
}
