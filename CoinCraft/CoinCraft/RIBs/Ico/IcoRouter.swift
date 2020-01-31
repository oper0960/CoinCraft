//
//  IcoRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol IcoInteractable: Interactable {
    var router: IcoRouting? { get set }
    var listener: IcoListener? { get set }
}

protocol IcoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class IcoRouter: ViewableRouter<IcoInteractable, IcoViewControllable>, IcoRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: IcoInteractable, viewController: IcoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
