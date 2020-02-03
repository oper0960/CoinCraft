//
//  IcoRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol IcoInteractable: Interactable, SegmentInnerViewListener {
    var router: IcoRouting? { get set }
    var listener: IcoListener? { get set }
}

protocol IcoViewControllable: ViewControllable {
    func swichingViewController(viewController: ViewControllable)
}

final class IcoRouter: ViewableRouter<IcoInteractable, IcoViewControllable> {
    
    override init(interactor: IcoInteractable, viewController: IcoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
}

extension IcoRouter: IcoRouting {
    func swichingSegmentInnerViews(innerViews: [SegmentInnerView], index: IcoType) {
        let builder = innerViews[index.rawValue].builder
        let router = builder.build(withListener: interactor)
        router.viewControllable.uiviewController.view.tag = index.rawValue
        viewController.swichingViewController(viewController: router.viewControllable)
    }
}
