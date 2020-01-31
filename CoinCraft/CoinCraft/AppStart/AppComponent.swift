//
//  AppComponent.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency, MainDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
