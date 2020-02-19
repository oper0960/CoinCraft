//
//  LicenseTextBuilder.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/14.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol LicenseTextDependency: Dependency {
    var openSourceStream: OpenSourceStream { get }
}

final class LicenseTextComponent: Component<LicenseTextDependency> {
    var openSourceStream: OpenSourceStream {
        return dependency.openSourceStream
    }
}

// MARK: - Builder

protocol LicenseTextBuildable: Buildable {
    func build(withListener listener: LicenseTextListener) -> LicenseTextRouting
}

final class LicenseTextBuilder: Builder<LicenseTextDependency>, LicenseTextBuildable {

    override init(dependency: LicenseTextDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LicenseTextListener) -> LicenseTextRouting {
        let component = LicenseTextComponent(dependency: dependency)
        let viewController = LicenseTextViewController()
        let interactor = LicenseTextInteractor(presenter: viewController, openSourceStream: component.openSourceStream)
        interactor.listener = listener
        return LicenseTextRouter(interactor: interactor, viewController: viewController)
    }
}
