//
//  MainBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/31.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol MainDependency: Dependency {
    var navigation: UINavigationController { get }
}

final class MainComponent: Component<MainDependency> {
    
    fileprivate var tabbarInnerViews: [TabbarInnerView] {
        return shared {
            return [CoinAdapter(dependency: self), GeneralAdapter(dependency: self), AboutAdapter(dependency: self)]
        }
    }
}

// MARK: - To Coin RIB Dependency
extension MainComponent: CoinDependency {
    
}

// MARK: - To General RIB Dependency
extension MainComponent: GeneralDependency {
    
}

// MARK: - To About RIB Dependency
extension MainComponent: AboutDependency {
    var navigation: UINavigationController {
        return dependency.navigation
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
