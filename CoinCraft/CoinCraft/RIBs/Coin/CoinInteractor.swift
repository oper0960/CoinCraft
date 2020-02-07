//
//  CoinInteractor.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift

protocol CoinRouting: ViewableRouting {
    
}

protocol CoinPresentable: Presentable {
    var listener: CoinPresentableListener? { get set }
    
    // MARK: - To ViewController
    func setCoinList(coins: [CoinViewModel])
}

protocol CoinListener: class {
    
}

final class CoinInteractor: PresentableInteractor<CoinPresentable>, CoinInteractable {
    
    weak var router: CoinRouting?
    weak var listener: CoinListener?
    
    private let repository = CoinRepositoryFactory.create(type: .remote)

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CoinPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension CoinInteractor: CoinPresentableListener {
    func getCoinMarketCapList() {
        repository.getCoinMarketCapList { coins in
            self.presenter.setCoinList(coins: coins)
        }
    }
    
    func routeToDetail(coin: CoinViewModel) {
        print("detail", coin)
    }
}
