//
//  SocialInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift

protocol SocialRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SocialPresentable: Presentable {
    var listener: SocialPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SocialListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SocialInteractor: PresentableInteractor<SocialPresentable>, SocialInteractable, SocialPresentableListener {

    weak var router: SocialRouting?
    weak var listener: SocialListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SocialPresentable) {
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
