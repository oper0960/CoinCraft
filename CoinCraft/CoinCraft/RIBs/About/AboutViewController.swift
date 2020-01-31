//
//  AboutViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol AboutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AboutViewController: UIViewController, AboutPresentable, AboutViewControllable {

    weak var listener: AboutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
