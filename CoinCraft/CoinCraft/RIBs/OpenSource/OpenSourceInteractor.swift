//
//  OpenSourceInteractor.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/13.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift

protocol OpenSourceRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol OpenSourcePresentable: Presentable {
    var listener: OpenSourcePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol OpenSourceListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class OpenSourceInteractor: PresentableInteractor<OpenSourcePresentable>, OpenSourceInteractable, OpenSourcePresentableListener {

    weak var router: OpenSourceRouting?
    weak var listener: OpenSourceListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: OpenSourcePresentable) {
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
