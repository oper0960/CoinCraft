//
//  ViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, MainPresentable, MainViewControllable {
    
    weak var listener: MainPresentableListener?
    
    private var tabbarInnerViews = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        self.tabBar.barTintColor = .white
        
        print("viewdidload")
    }
    
    func setTabbar(viewControllers: [UIViewController]) {
        self.tabbarInnerViews = viewControllers
        print("settabbar")
        self.setViewControllers(tabbarInnerViews, animated: false)
    }
}

// MARK: - UITabbarControllerDelegate
extension ViewController: UITabBarControllerDelegate {
    
}
