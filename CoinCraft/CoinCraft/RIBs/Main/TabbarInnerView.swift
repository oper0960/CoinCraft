//
//  TabbarView.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol TabbarInnerViewListener: class {
    
}

protocol TabbarBuildable: Buildable {
    func build(withListener listener: TabbarInnerViewListener) -> ViewableRouting
}

protocol TabbarInnerView {
    var name: String { get }
    var builder: TabbarBuildable { get }
}
