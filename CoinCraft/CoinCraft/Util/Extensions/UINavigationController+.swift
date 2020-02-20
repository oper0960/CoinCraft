//
//  UINavigationController+.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController { return self }
    
    public convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
    
    func defaultNavigation() -> UINavigationController {
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        return self
    }
    
    // MARK: - 기본 Push 사용시 interactor didBecomeActive 가 먼저 호출되서 View Data 전달시 leak 발생하여 Custom push pop 추가
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping (()->())) {
        CATransaction.setCompletionBlock(completion)
        CATransaction.begin()
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(animated: Bool, completion: @escaping (()->())) -> UIViewController? {
        CATransaction.setCompletionBlock(completion)
        CATransaction.begin()
        let poppedViewController = self.popViewController(animated: animated)
        CATransaction.commit()
        return poppedViewController
    }
}


