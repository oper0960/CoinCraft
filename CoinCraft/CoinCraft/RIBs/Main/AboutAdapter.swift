//
//  AboutAdapter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class AboutAdapter: TabbarInnerView, TabbarBuildable, AboutListener {

    let name = "About"
    
    var builder: TabbarBuildable {
        return self
    }

    private let aboutBuilder: AboutBuilder

    private weak var listener: TabbarInnerViewListener?

    init(dependency: AboutDependency) {
        aboutBuilder = AboutBuilder(dependency: dependency)
    }

    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting {
        self.listener = listener
        return aboutBuilder.build(withListener: self)
    }
}
