//
//  AboutRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol AboutInteractable: Interactable {
    var router: AboutRouting? { get set }
    var listener: AboutListener? { get set }
}

protocol AboutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AboutRouter: ViewableRouter<AboutInteractable, AboutViewControllable>, AboutRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AboutInteractable, viewController: AboutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
