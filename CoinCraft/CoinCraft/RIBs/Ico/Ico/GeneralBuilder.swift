//
//  GeneralBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol GeneralDependency: Dependency {
    
}

final class GeneralComponent: Component<GeneralDependency>, NewsDependency, SocialDependency {
    fileprivate var segmentInnerViews: [SegmentInnerView] {
        return shared {
            return [NewsAdapter(dependency: self), SocialAdapter(dependency: self)]
        }
    }
}

// MARK: - Builder

protocol GeneralBuildable: Buildable {
    func build(withListener listener: GeneralListener) -> GeneralRouting
}

final class GeneralBuilder: Builder<GeneralDependency>, GeneralBuildable {

    override init(dependency: GeneralDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: GeneralListener) -> GeneralRouting {
        let component = GeneralComponent(dependency: dependency)
        let viewController = GeneralViewController()
        let interactor = GeneralInteractor(presenter: viewController, innerViews: component.segmentInnerViews)
        interactor.listener = listener
        return GeneralRouter(interactor: interactor, viewController: viewController)
    }
}
