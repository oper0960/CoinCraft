//
//  VersionBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol VersionDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class VersionComponent: Component<VersionDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol VersionBuildable: Buildable {
    func build(withListener listener: VersionListener) -> VersionRouting
}

final class VersionBuilder: Builder<VersionDependency>, VersionBuildable {

    override init(dependency: VersionDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: VersionListener) -> VersionRouting {
        let _ = VersionComponent(dependency: dependency)
        let viewController = VersionViewController()
        let interactor = VersionInteractor(presenter: viewController)
        interactor.listener = listener
        return VersionRouter(interactor: interactor, viewController: viewController)
    }
}
