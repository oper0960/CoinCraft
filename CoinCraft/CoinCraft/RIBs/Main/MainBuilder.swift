//
//  MainBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol MainDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MainComponent: Component<MainDependency>, CoinDependency, IcoDependency, AboutDependency {
    fileprivate var tabbarInnerViews: [TabbarInnerView] {
        return shared {
            return [CoinAdapter(dependency: self), IcoAdapter(dependency: self), AboutAdapter(dependency: self)]
        }
    }
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor(presenter: viewController, tabbarViews: component.tabbarInnerViews)
        interactor.listener = listener
        return MainRouter(interactor: interactor, viewController: viewController)
    }
}
