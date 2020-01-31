//
//  ActiveBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol ActiveDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ActiveComponent: Component<ActiveDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ActiveBuildable: Buildable {
    func build(withListener listener: ActiveListener) -> ActiveRouting
}

final class ActiveBuilder: Builder<ActiveDependency>, ActiveBuildable {

    override init(dependency: ActiveDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ActiveListener) -> ActiveRouting {
        let _ = ActiveComponent(dependency: dependency)
        let viewController = ActiveViewController()
        let interactor = ActiveInteractor(presenter: viewController)
        interactor.listener = listener
        return ActiveRouter(interactor: interactor, viewController: viewController)
    }
}
