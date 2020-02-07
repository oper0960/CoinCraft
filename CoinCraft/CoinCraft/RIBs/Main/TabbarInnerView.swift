//
//  TabbarView.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

public protocol TabbarInnerViewListener: class {
}

public protocol TabbarBuildable: Buildable {
    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting
}

public protocol TabbarInnerView {
    var name: String { get }
    var builder: TabbarBuildable { get }
}
