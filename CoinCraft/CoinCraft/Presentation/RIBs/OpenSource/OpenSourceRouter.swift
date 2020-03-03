//
//  OpenSourceRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa

protocol OpenSourceInteractable: Interactable, LicenseTextListener {
    var router: OpenSourceRouting? { get set }
    var listener: OpenSourceListener? { get set }
}

protocol OpenSourceViewControllable: ViewControllable {
    func push(viewController: ViewControllable, completion: @escaping (() -> ()))
}

final class OpenSourceRouter: ViewableRouter<OpenSourceInteractable, OpenSourceViewControllable> {

    init(interactor: OpenSourceInteractable,
                  viewController: OpenSourceViewControllable,
                  licenseTextBuilder: LicenseTextBuildable) {
        
        self.licenseTextBuilder = licenseTextBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    private var licenseTextBuilder: LicenseTextBuildable
    private var currentRouter: ViewableRouting?
}

extension OpenSourceRouter: OpenSourceRouting {
    func routeLicense() {
        
        if !children.isEmpty {
            for child in children {
                detachChild(child)
            }
        }
        
        let licenseText = licenseTextBuilder.build(withListener: interactor)
        currentRouter = licenseText
        viewController.push(viewController: licenseText.viewControllable) {
            self.attachChild(licenseText)
        }
    }
}
