//
//  CoinDetailBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol CoinDetailDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CoinDetailComponent: Component<CoinDetailDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CoinDetailBuildable: Buildable {
    func build(withListener listener: CoinDetailListener) -> CoinDetailRouting
}

final class CoinDetailBuilder: Builder<CoinDetailDependency>, CoinDetailBuildable {

    override init(dependency: CoinDetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CoinDetailListener) -> CoinDetailRouting {
        let component = CoinDetailComponent(dependency: dependency)
        let viewController = CoinDetailViewController()
        let interactor = CoinDetailInteractor(presenter: viewController)
        interactor.listener = listener
        return CoinDetailRouter(interactor: interactor, viewController: viewController)
    }
}
