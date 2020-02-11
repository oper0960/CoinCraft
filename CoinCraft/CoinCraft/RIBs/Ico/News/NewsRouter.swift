//
//  NewsRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol NewsInteractable: Interactable {
    var router: NewsRouting? { get set }
    var listener: NewsListener? { get set }
}

protocol NewsViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class NewsRouter: ViewableRouter<NewsInteractable, NewsViewControllable>, NewsRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: NewsInteractable, viewController: NewsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
