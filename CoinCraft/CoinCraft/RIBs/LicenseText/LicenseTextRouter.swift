//
//  LicenseTextRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/14.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol LicenseTextInteractable: Interactable {
    var router: LicenseTextRouting? { get set }
    var listener: LicenseTextListener? { get set }
}

protocol LicenseTextViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LicenseTextRouter: ViewableRouter<LicenseTextInteractable, LicenseTextViewControllable>, LicenseTextRouting {
    
    override init(interactor: LicenseTextInteractable, viewController: LicenseTextViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
