//
//  ActiveRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol ActiveInteractable: Interactable {
    var router: ActiveRouting? { get set }
    var listener: ActiveListener? { get set }
}

protocol ActiveViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ActiveRouter: ViewableRouter<ActiveInteractable, ActiveViewControllable>, ActiveRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ActiveInteractable, viewController: ActiveViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
