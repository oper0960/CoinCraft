//
//  CoinInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import Domain

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
    
    private let coinUseCase: CoinUseCase
    private let disposeBag = DisposeBag()

    override init(presenter: CoinPresentable) {
        
        self.coinUseCase = CoinUseCaseImpl(coinRepository: CoinRepositoryImpl(dataStore: CoinDataStoreImpl()))
        
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension CoinInteractor: CoinPresentableListener {
    func getCompareCoinInfo(coin: CoinViewModel) {
        
        let compareCoin = Global.current.cryptoCoins.filter { compareCoin in
            return compareCoin.symbol == coin.name
        }
        
        guard let coinInfo = compareCoin.first else { return }
        
        coinUseCase.getCryptoCompareDetail(id: coinInfo.id).subscribe(onNext: { [weak self] detail in
            guard let self = self else { return }
            self.router?.routeToDetail(info: detail)
            }, onError: { error in
                print(error.localizedDescription)
        }).disposed(by: self.disposeBag)
    }
    
    func getCoinMarketCapList() {
        
        coinUseCase.getCoinMarketCapList().subscribe(onNext: { [weak self] coins in
            guard let self = self else { return }
            self.presenter.setCoinList(coins: coins)
            }, onError: { error in
                print(error.localizedDescription)
        }).disposed(by: self.disposeBag)
    }
}
