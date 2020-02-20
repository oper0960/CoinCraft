//
//  AboutInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa

protocol AboutRouting: ViewableRouting {
    func pushMenu(menu: SettingMenu)
}

protocol AboutPresentable: Presentable {
    func onSelected() -> PublishRelay<SettingMenu>
}

protocol AboutListener: class {
    
}

final class AboutInteractor: PresentableInteractor<AboutPresentable> {

    weak var router: AboutRouting?
    weak var listener: AboutListener?

    override init(presenter: AboutPresentable) {
        super.init(presenter: presenter)
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        setRx()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension AboutInteractor {
    func setRx() {
        presenter.onSelected().subscribe(onNext: { menu in
            self.router?.pushMenu(menu: menu)
        }).disposeOnDeactivate(interactor: self)
    }
}

// MARK: - AboutInteractable
extension AboutInteractor: AboutInteractable {
    
}
