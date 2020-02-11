//
//  IcoBuilder.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol IcoDependency: Dependency {
    
}

final class IcoComponent: Component<IcoDependency>, ActiveDependency, UpComingDependency {
    fileprivate var segmentInnerViews: [SegmentInnerView] {
        return shared {
            return [ActiveAdapter(dependency: self), UpComingAdapter(dependency: self)]
        }
    }
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
        let component = IcoComponent(dependency: dependency)
        let viewController = IcoViewController()
        let interactor = IcoInteractor(presenter: viewController, innerViews: component.segmentInnerViews)
        interactor.listener = listener
        return IcoRouter(interactor: interactor, viewController: viewController)
    }
}
