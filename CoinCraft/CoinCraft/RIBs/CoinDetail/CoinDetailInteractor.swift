//
//  CoinDetailInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import Domain

protocol CoinDetailRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CoinDetailPresentable: Presentable {
    var listener: CoinDetailPresentableListener? { get set }
    
    // MARK: - To ViewController
    func bindViewModel(viewModel: CompareCoinDetailViewModel)
}

protocol CoinDetailListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CoinDetailInteractor: PresentableInteractor<CoinDetailPresentable>, CoinDetailInteractable {
    
    weak var router: CoinDetailRouting?
    weak var listener: CoinDetailListener?

    init(presenter: CoinDetailPresentable, detailInfo: CompareCoinDetailViewModel) {
        self.detailInfo = detailInfo
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    private let detailInfo: CompareCoinDetailViewModel
}

extension CoinDetailInteractor: CoinDetailPresentableListener {
    func getViewModel() {
        presenter.bindViewModel(viewModel: detailInfo)
    }
}
