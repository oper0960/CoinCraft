//
//  SocialBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol SocialDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SocialComponent: Component<SocialDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SocialBuildable: Buildable {
    func build(withListener listener: SocialListener) -> SocialRouting
}

final class SocialBuilder: Builder<SocialDependency>, SocialBuildable {

    override init(dependency: SocialDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SocialListener) -> SocialRouting {
        let _ = SocialComponent(dependency: dependency)
        let viewController = SocialViewController()
        let interactor = SocialInteractor(presenter: viewController)
        interactor.listener = listener
        return SocialRouter(interactor: interactor, viewController: viewController)
    }
}
