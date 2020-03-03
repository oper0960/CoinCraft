//
//  CoinRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import Domain

protocol CoinInteractable: Interactable, CoinDetailListener {
    var router: CoinRouting? { get set }
    var listener: CoinListener? { get set }
}

protocol CoinViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class CoinRouter: ViewableRouter<CoinInteractable, CoinViewControllable> {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: CoinInteractable, viewController: CoinViewControllable, coinDetailBuilder: CoinDetailBuildable) {
        
        self.detailBuilder = coinDetailBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    private var detailBuilder: CoinDetailBuildable
    private var detailRouter: ViewableRouting?
}

extension CoinRouter: CoinRouting {
    func routeToDetail(info: CompareCoinDetailViewModel) {
        
        if !children.isEmpty {
            for child in children {
                detachChild(child)
            }
        }
        
        let detail = detailBuilder.build(withListener: interactor, detailInfo: info)
        self.detailRouter = detail
        viewController.present(viewController: detail.viewControllable)
        attachChild(detail)
    }
}
