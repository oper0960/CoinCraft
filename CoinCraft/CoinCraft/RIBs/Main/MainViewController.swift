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
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

//final class MainViewController: UIViewController, MainPresentable, MainViewControllable {
//
//    weak var listener: MainPresentableListener?
//    
//    private var mainTabBarController = UITabBarController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .green
//        
//        
//        self.mainTabBarController.setViewControllers([], animated: false)
//        self.mainTabBarController.tabBar.barTintColor = .white
//        self.mainTabBarController.delegate = self
//        self.view.addSubview(self.mainTabBarController.view)
//    }
//}
//
//// MARK: - UITabbarControllerDelegate
//extension MainViewController: UITabBarControllerDelegate {
//    
//}
