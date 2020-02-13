//
//  CoinInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift

protocol CoinRouting: ViewableRouting {
    func routeToDetail(info: CompareCoinDetailViewModel)
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
    func getCompareCoinInfo(coin: CoinViewModel) {
        
        let compareCoin = Global.current.cryptoCoins.map {
            return CompareCoinViewModel(coin: $0)
        }.filter { compareCoin in
            return compareCoin.symbol == coin.name
        }
        
        guard let coinInfo = compareCoin.first else { return }
        
        repository.getCompareCoinDetail(id: coinInfo.id) { detail in
            self.router?.routeToDetail(info: CompareCoinDetailViewModel(detail: detail))
        }
    }
    
    func getCoinMarketCapList() {
        repository.getCoinMarketCapList { coins in
            self.presenter.setCoinList(coins: coins)
        }
    }
}
