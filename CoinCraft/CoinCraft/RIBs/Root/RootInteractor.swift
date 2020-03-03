//
//  RootInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import Domain

protocol RootRouting: ViewableRouting {
    // MARK: - To Router
    func routeToMain()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    
    // MARK: - To ViewController
    func stopLoadingView()
}

protocol RootListener: class {
    // MARK: - To Other Router
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable {

    weak var router: RootRouting?
    weak var listener: RootListener?
    
    private let coinUseCase: CoinUseCase
    private let disposeBag = DisposeBag()

    override init(presenter: RootPresentable) {
        
        self.coinUseCase = CoinUseCaseImpl(coinRepository: CoinRepositoryImpl(dataStore: CoinDataStoreImpl()))
        
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
        coinUseCase.getCryptoCompareList().subscribe(onNext: { [weak self] coins in
            guard let self = self else { return }
            Global.current.cryptoCoins = coins
            self.router?.routeToMain()
            }, onError: { error in
                print(error.localizedDescription)
        }, onDisposed: {
            self.presenter.stopLoadingView()
        }).disposed(by: self.disposeBag)
    }
}
