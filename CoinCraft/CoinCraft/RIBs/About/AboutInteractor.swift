//
//  AboutInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift

protocol AboutRouting: ViewableRouting {
    func pushMenu(menu: SettingMenu)
}

protocol AboutPresentable: Presentable {
    var listener: AboutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AboutListener: class {
    
}

final class AboutInteractor: PresentableInteractor<AboutPresentable> {

    weak var router: AboutRouting?
    weak var listener: AboutListener?

    override init(presenter: AboutPresentable) {
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

// MARK: - AboutInteractable
extension AboutInteractor: AboutInteractable {
    
}

// MARK: - AboutPresentableListener
extension AboutInteractor: AboutPresentableListener {
    func pushMenu(menu: SettingMenu) {
        router?.pushMenu(menu: menu)
    }
}
