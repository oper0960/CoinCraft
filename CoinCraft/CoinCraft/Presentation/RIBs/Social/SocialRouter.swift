//
//  SocialRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol SocialInteractable: Interactable {
    var router: SocialRouting? { get set }
    var listener: SocialListener? { get set }
}

protocol SocialViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SocialRouter: ViewableRouter<SocialInteractable, SocialViewControllable>, SocialRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SocialInteractable, viewController: SocialViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
