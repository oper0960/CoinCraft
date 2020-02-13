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

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable> {
    
    override init(interactor: MainInteractable, viewController: MainViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

// MARK: - MainRouting
extension MainRouter: MainRouting {
    func convertTabbarInnerViews(innerViews: [TabbarInnerView]) {
        var views = [UIViewController]()
        for (index, view) in innerViews.enumerated() {
            let viewRouter = view.builder.build(withListener: interactor)
            viewRouter.viewControllable.uiviewController.tabBarItem = UITabBarItem(title: view.name, image: UIImage(named: view.name.lowercased())!, tag: index)
            views.append(viewRouter.viewControllable.uiviewController)
            attachChild(viewRouter)
        }
        viewController.setTabbar(viewControllers: views)
    }
}


