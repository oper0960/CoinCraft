//
//  NewsBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import Domain

protocol NewsDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class NewsComponent: Component<NewsDependency> {
    fileprivate let newsUseCase: NewsUseCase = {
       return NewsUseCaseImpl(newsRepository: NewsRepositoryImpl(dataStore: NewsDataStoreImpl()))
    }()
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
        let interactor = NewsInteractor(presenter: viewController, newsUseCase: component.newsUseCase)
        interactor.listener = listener
        return NewsRouter(interactor: interactor, viewController: viewController)
    }
}
