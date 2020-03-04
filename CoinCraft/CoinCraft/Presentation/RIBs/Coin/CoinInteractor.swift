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
    func routeToDetail(info: CoinDetailViewable)
}

protocol CoinPresentable: Presentable {
    var listener: CoinPresentableListener? { get set }
    
    // MARK: - To ViewController
    func setCoinList(coins: [CoinViewable])
    func stopIndicator()
}

protocol CoinListener: class {
    
}

final class CoinInteractor: PresentableInteractor<CoinPresentable>, CoinInteractable {
    
    weak var router: CoinRouting?
    weak var listener: CoinListener?
    
    private let cryptoCompareDetailUseCase: CryptoCompareDetailUseCase
    private let coinMarketCapListUseCase: CoinMarketCapListUseCase
    private let disposeBag = DisposeBag()

    init(presenter: CoinPresentable, cryptoCompareDetailUseCase: CryptoCompareDetailUseCase, coinMarketCapListUseCase: CoinMarketCapListUseCase) {
        
        self.cryptoCompareDetailUseCase = cryptoCompareDetailUseCase
        self.coinMarketCapListUseCase = coinMarketCapListUseCase
        
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
    func getCompareCoinInfo(coin: CoinViewable) {
        
        let compareCoin = Global.current.cryptoCoins.filter { compareCoin in
            return compareCoin.symbol == coin.name
        }
        
        guard let coinInfo = compareCoin.first else { return }
        
        cryptoCompareDetailUseCase.getCryptoCompareDetail(id: coinInfo.id).subscribe(onNext: { [weak self] detail in
            guard let self = self else { return }
            self.router?.routeToDetail(info: detail)
            }, onError: { error in
                print(error.localizedDescription)
        }, onDisposed: {
            self.presenter.stopIndicator()
        }).disposed(by: self.disposeBag)
    }
    
    func getCoinMarketCapList() {
        
        coinMarketCapListUseCase.getCoinMarketCapList().subscribe(onNext: { [weak self] coins in
            guard let self = self else { return }
            self.presenter.setCoinList(coins: coins)
            }, onError: { error in
                print(error.localizedDescription)
        }, onDisposed: {
            self.presenter.stopIndicator()
        }).disposed(by: self.disposeBag)
    }
}
