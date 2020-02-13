//
//  CoinDetailRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol CoinDetailInteractable: Interactable {
    var router: CoinDetailRouting? { get set }
    var listener: CoinDetailListener? { get set }
}

protocol CoinDetailViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CoinDetailRouter: ViewableRouter<CoinDetailInteractable, CoinDetailViewControllable>, CoinDetailRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CoinDetailInteractable, viewController: CoinDetailViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
