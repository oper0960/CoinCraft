//
//  RootRouter.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // MARK: - To ViewController
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         mainBuilder: MainBuildable,
         navigation: UINavigationController) {
        
        self.navigation = navigation
        self.mainBuilder = mainBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    private var navigation: UINavigationController
    
    private var mainBuilder: MainBuildable
    private var mainRouter: ViewableRouting?
    
    override func didLoad() {
        super.didLoad()
    }
    
    private func routeMain() {
        let main = mainBuilder.build(withListener: interactor)
        self.mainRouter = main
        
        navigation.setViewControllers([main.viewControllable.uiviewController], animated: false)
        viewController.present(viewController: navigation)
        attachChild(main)
    }
}

extension RootRouter: RootRouting {
    func routeToMain() {
        routeMain()
    }
}
