//
//  AppComponent.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    var navigation: UINavigationController
    
    init() {
        self.navigation = UINavigationController().defaultNavigation()
        super.init(dependency: EmptyComponent())
    }
}
