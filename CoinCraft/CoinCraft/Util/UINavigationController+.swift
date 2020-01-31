//
//  UINavigationController+.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController { return self }
    
    public convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
    
    func defaultNavigation() -> UINavigationController {
        self.navigationBar.barTintColor = .black
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        return self
    }
}

extension UIViewController {
    func setTitle(_ title: String) {
        self.title = title
    }
}
