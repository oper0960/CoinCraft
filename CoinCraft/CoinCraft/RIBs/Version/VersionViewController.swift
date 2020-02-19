//
//  VersionViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol VersionPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class VersionViewController: UIViewController, VersionPresentable, VersionViewControllable {

    weak var listener: VersionPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
