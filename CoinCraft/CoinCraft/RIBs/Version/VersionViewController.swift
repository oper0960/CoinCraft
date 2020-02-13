//
//  VersionViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/13.
//  Copyright © 2020 Buxi. All rights reserved.
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
}