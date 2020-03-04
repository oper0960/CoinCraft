//
//  MiningViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Domain

protocol MiningPresentableListener: class {
    // TODO: Business Logic의 수행을 위해 Interactor로 호출할 메소드, 프로퍼티를 구현
    func getMinings()
}

final class MiningViewController: UIViewController {

    weak var listener: MiningPresentableListener?
    
    private var minings = [MiningViewable]() {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        listener?.getMinings()
    }
}

// MARK: - Setup
extension MiningViewController {
    func setup() {
        
    }
}

extension MiningViewController: MiningPresentable {
    func setMinings(minings: [MiningViewable]) {
        self.minings = minings
    }
}

extension MiningViewController: MiningViewControllable {
    
}
