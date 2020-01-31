//
//  CoinBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol CoinDependency: Dependency {
}

final class CoinComponent: Component<CoinDependency> {
}

// MARK: - Builder

protocol CoinBuildable: Buildable {
    func build(withListener listener: CoinListener) -> CoinRouting
}

final class CoinBuilder: Builder<CoinDependency>, CoinBuildable {

    override init(dependency: CoinDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CoinListener) -> CoinRouting {
        let _ = CoinComponent(dependency: dependency)
        let viewController = CoinViewController()
        let interactor = CoinInteractor(presenter: viewController)
        interactor.listener = listener
        return CoinRouter(interactor: interactor, viewController: viewController)
    }
}
