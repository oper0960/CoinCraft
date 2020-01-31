//
//  UpComingRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol UpComingInteractable: Interactable {
    var router: UpComingRouting? { get set }
    var listener: UpComingListener? { get set }
}

protocol UpComingViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class UpComingRouter: ViewableRouter<UpComingInteractable, UpComingViewControllable>, UpComingRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: UpComingInteractable, viewController: UpComingViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
