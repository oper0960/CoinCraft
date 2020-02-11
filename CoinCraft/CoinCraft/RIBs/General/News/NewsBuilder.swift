//
//  NewsBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol NewsDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class NewsComponent: Component<NewsDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol NewsBuildable: Buildable {
    func build(withListener listener: NewsListener) -> NewsRouting
}

final class NewsBuilder: Builder<NewsDependency>, NewsBuildable {

    override init(dependency: NewsDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: NewsListener) -> NewsRouting {
        let component = NewsComponent(dependency: dependency)
        let viewController = NewsViewController()
        let interactor = NewsInteractor(presenter: viewController)
        interactor.listener = listener
        return NewsRouter(interactor: interactor, viewController: viewController)
    }
}
