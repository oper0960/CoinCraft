//
//  VersionRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol VersionInteractable: Interactable {
    var router: VersionRouting? { get set }
    var listener: VersionListener? { get set }
}

protocol VersionViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class VersionRouter: ViewableRouter<VersionInteractable, VersionViewControllable>, VersionRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: VersionInteractable, viewController: VersionViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
