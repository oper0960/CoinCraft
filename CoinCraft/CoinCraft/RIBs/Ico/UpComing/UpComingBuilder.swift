//
//  UpComingBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol UpComingDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class UpComingComponent: Component<UpComingDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol UpComingBuildable: Buildable {
    func build(withListener listener: UpComingListener) -> UpComingRouting
}

final class UpComingBuilder: Builder<UpComingDependency>, UpComingBuildable {

    override init(dependency: UpComingDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: UpComingListener) -> UpComingRouting {
        let _ = UpComingComponent(dependency: dependency)
        let viewController = UpComingViewController()
        let interactor = UpComingInteractor(presenter: viewController)
        interactor.listener = listener
        return UpComingRouter(interactor: interactor, viewController: viewController)
    }
}
