//
//  MiningRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol MiningInteractable: Interactable {
    var router: MiningRouting? { get set }
    var listener: MiningListener? { get set }
}

protocol MiningViewControllable: ViewControllable {
    // TODO: View를 Control 하기 위해 ViewController에 전달할 메소드, 프로퍼티 구현
}

final class MiningRouter: ViewableRouter<MiningInteractable, MiningViewControllable> {

    override init(interactor: MiningInteractable, viewController: MiningViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension MiningRouter: MiningRouting {
    
}
