//
//  OpenSourceRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol OpenSourceInteractable: Interactable {
    var router: OpenSourceRouting? { get set }
    var listener: OpenSourceListener? { get set }
}

protocol OpenSourceViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class OpenSourceRouter: ViewableRouter<OpenSourceInteractable, OpenSourceViewControllable>, OpenSourceRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: OpenSourceInteractable, viewController: OpenSourceViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
