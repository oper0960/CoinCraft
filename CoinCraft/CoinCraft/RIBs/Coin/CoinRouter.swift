//
//  CoinRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol CoinInteractable: Interactable {
    var router: CoinRouting? { get set }
    var listener: CoinListener? { get set }
}

protocol CoinViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CoinRouter: ViewableRouter<CoinInteractable, CoinViewControllable>, CoinRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CoinInteractable, viewController: CoinViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
