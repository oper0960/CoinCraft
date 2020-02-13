//
//  GeneralRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol GeneralInteractable: Interactable, SegmentInnerViewListener {
    var router: GeneralRouting? { get set }
    var listener: GeneralListener? { get set }
}

protocol GeneralViewControllable: ViewControllable {
    func swichingViewController(viewController: ViewControllable)
}

final class GeneralRouter: ViewableRouter<GeneralInteractable, GeneralViewControllable> {
    
    override init(interactor: GeneralInteractable, viewController: GeneralViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    private var swichingRouter: ViewableRouting?
}

extension GeneralRouter: GeneralRouting {
    func swichingSegmentInnerViews(innerViews: [SegmentInnerView], index: GeneralType) {
        
        if let swichingRouter = swichingRouter {
            detachChild(swichingRouter)
        }
        
        let builder = innerViews[index.rawValue].builder
        let router = builder.build(withListener: interactor)
        router.viewControllable.uiviewController.view.tag = index.rawValue
        
        swichingRouter = router
        
        attachChild(swichingRouter!)
        viewController.swichingViewController(viewController: router.viewControllable)
    }
}
