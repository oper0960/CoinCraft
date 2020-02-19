//
//  AboutBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol AboutDependency: Dependency {
    var navigation: UINavigationController { get }
}

final class AboutComponent: Component<AboutDependency> {
    var navigation: UINavigationController {
        return dependency.navigation
    }
}

extension AboutComponent: OpenSourceDependency {
    var openSourceStream: OpenSourceStream {
        return shared { openSourceStreamImpl() }
    }
}

// MARK: - Builder

protocol AboutBuildable: Buildable {
    func build(withListener listener: AboutListener) -> AboutRouting
}

final class AboutBuilder: Builder<AboutDependency>, AboutBuildable {

    override init(dependency: AboutDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AboutListener) -> AboutRouting {
        let component = AboutComponent(dependency: dependency)
        let viewController = AboutViewController(navigation: component.navigation)
        let interactor = AboutInteractor(presenter: viewController)
        let openSourceBuiler = OpenSourceBuilder(dependency: component)
        interactor.listener = listener
        return AboutRouter(interactor: interactor, viewController: viewController, openSourceBuilder: openSourceBuiler)
    }
}
