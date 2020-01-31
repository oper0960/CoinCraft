//
//  IcoBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol IcoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class IcoComponent: Component<IcoDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol IcoBuildable: Buildable {
    func build(withListener listener: IcoListener) -> IcoRouting
}

final class IcoBuilder: Builder<IcoDependency>, IcoBuildable {

    override init(dependency: IcoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: IcoListener) -> IcoRouting {
        let _ = IcoComponent(dependency: dependency)
        let viewController = IcoViewController()
        let interactor = IcoInteractor(presenter: viewController)
        interactor.listener = listener
        return IcoRouter(interactor: interactor, viewController: viewController)
    }
}
