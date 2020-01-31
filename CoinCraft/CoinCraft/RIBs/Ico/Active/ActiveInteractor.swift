//
//  ActiveInteractor.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift

protocol ActiveRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ActivePresentable: Presentable {
    var listener: ActivePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ActiveListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ActiveInteractor: PresentableInteractor<ActivePresentable>, ActiveInteractable, ActivePresentableListener {

    weak var router: ActiveRouting?
    weak var listener: ActiveListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ActivePresentable) {
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
