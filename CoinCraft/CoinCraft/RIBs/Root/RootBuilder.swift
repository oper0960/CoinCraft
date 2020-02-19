//
//  RootBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    var navigation: UINavigationController { get }
}

final class RootComponent: Component<RootDependency> {
    
}

// MARK: - To MainRIB Dependency
extension RootComponent: MainDependency {
    var navigation: UINavigationController {
        return dependency.navigation
    }
}

// MARK: - Builder
protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let mainBuilder = MainBuilder(dependency: component)
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          mainBuilder: mainBuilder,
                          navigation: component.navigation)
    }
}
