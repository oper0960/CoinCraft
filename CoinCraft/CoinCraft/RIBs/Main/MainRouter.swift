//
//  MainRouter.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

protocol MainInteractable: Interactable, TabbarInnerViewListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func setTabbar(viewControllers: [UIViewController])
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {
    
    

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MainInteractable, viewController: MainViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func convertTabbarInnerViews(innerViews: [TabbarInnerView]) {
        var views = [UIViewController]()
        for (index, view) in innerViews.enumerated() {
            let viewRouter = view.builder.build(withListener: interactor)
            print(viewRouter)
            viewRouter.viewControllable.uiviewController.tabBarItem = UITabBarItem(title: view.name, image: nil, tag: index)
            print(view.name)
            views.append(viewRouter.viewControllable.uiviewController)
            attachChild(viewRouter)
        }
        viewController.setTabbar(viewControllers: views)
    }
}


