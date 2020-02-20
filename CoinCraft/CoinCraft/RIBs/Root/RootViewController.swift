//
//  RootViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // MARK: - To Interactor
    func getCryptoCompareList()
}

final class RootViewController: UIViewController {

    weak var listener: RootPresentableListener?
    
    private let indicator = IndicatorView(type: .launch)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        indicator.play(superView: self.view)
        listener?.getCryptoCompareList()
    }
    
    
}

// MARK: - RootPresentable
extension RootViewController: RootPresentable {
    func setProgressBar(percent: Double) {
        print(percent)
    }
    
    func stopLoadingView() {
        indicator.stop()
    }
}

// MARK: - RootViewControllable
extension RootViewController: RootViewControllable {
    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        present(viewController.uiviewController, animated: false, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}
