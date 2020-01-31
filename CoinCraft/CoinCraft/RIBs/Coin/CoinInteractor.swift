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
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CoinPresentable: Presentable {
    var listener: CoinPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CoinListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CoinInteractor: PresentableInteractor<CoinPresentable>, CoinInteractable, CoinPresentableListener {

    weak var router: CoinRouting?
    weak var listener: CoinListener?

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