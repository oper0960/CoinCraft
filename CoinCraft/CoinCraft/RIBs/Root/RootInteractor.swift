//
//  RootInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // MARK: - To Router
    func routeToMain()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    
    // MARK: - To ViewController
    func setProgressBar(percent: Double)
    func stopLoadingView()
}

protocol RootListener: class {
    // MARK: - To Other Router
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable {

    weak var router: RootRouting?
    weak var listener: RootListener?
    
    private let repository = CoinRepositoryFactory.create(type: .remote)

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension RootInteractor: RootPresentableListener {
    func getCryptoCompareList() {
        repository.getCryptoCompareList(progressBar: { progress in
            if progress == 1.0 {
                self.presenter.stopLoadingView()
            }
        }) { coins in
            Global.current.cryptoCoins = coins.coins
            self.router?.routeToMain()
        }
    }
}
