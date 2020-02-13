//
//  CoinDetailBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol CoinDetailDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CoinDetailComponent: Component<CoinDetailDependency> {
    
}

// MARK: - Builder

protocol CoinDetailBuildable: Buildable {
    func build(withListener listener: CoinDetailListener, detailInfo: CompareCoinDetailViewModel) -> CoinDetailRouting
}

final class CoinDetailBuilder: Builder<CoinDetailDependency>, CoinDetailBuildable {

    override init(dependency: CoinDetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CoinDetailListener, detailInfo: CompareCoinDetailViewModel) -> CoinDetailRouting {
        let _ = CoinDetailComponent(dependency: dependency)
        let viewController = CoinDetailViewController()
        let interactor = CoinDetailInteractor(presenter: viewController, detailInfo: detailInfo)
        interactor.listener = listener
        return CoinDetailRouter(interactor: interactor, viewController: viewController)
    }
}
