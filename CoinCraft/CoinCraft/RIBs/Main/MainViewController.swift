//
//  MainViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: class {
    func convertTitle(selectView: UIViewController)
}

class MainViewController: UIViewController, MainViewControllable {
    
    weak var listener: MainPresentableListener?
    private var tabbarInnerViews = [UIViewController]()
    private var mainTabBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Coin"
        
        mainTabBarController.delegate = self
        mainTabBarController.tabBar.barTintColor = .black
        addChild(mainTabBarController)
        mainTabBarController.view.frame = view.bounds
        view.addSubview(mainTabBarController.view)
    }
    
    func setTabbar(viewControllers: [UIViewController]) {
        tabbarInnerViews = viewControllers
        mainTabBarController.setViewControllers(tabbarInnerViews, animated: false)
    }
}

// MARK: - MainPresentable
extension MainViewController: MainPresentable {
    func changeNavigationTitle(title: String) {
        setTitle(title)
    }
}

// MARK: - UITabbarControllerDelegate
extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        listener?.convertTitle(selectView: viewController)
    }
}
