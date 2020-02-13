//
//  OpenSourceBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol OpenSourceDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class OpenSourceComponent: Component<OpenSourceDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol OpenSourceBuildable: Buildable {
    func build(withListener listener: OpenSourceListener) -> OpenSourceRouting
}

final class OpenSourceBuilder: Builder<OpenSourceDependency>, OpenSourceBuildable {

    override init(dependency: OpenSourceDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OpenSourceListener) -> OpenSourceRouting {
        let component = OpenSourceComponent(dependency: dependency)
        let viewController = OpenSourceViewController()
        let interactor = OpenSourceInteractor(presenter: viewController)
        interactor.listener = listener
        return OpenSourceRouter(interactor: interactor, viewController: viewController)
    }
}
