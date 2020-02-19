//
//  OpenSourceInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxCocoa
import RxSwift

protocol OpenSourceRouting: ViewableRouting {
    func routeLicense()
}

protocol OpenSourcePresentable: Presentable {
    // MARK: - To ViewController
    func onSelected() -> PublishRelay<OpenSource>
}

protocol OpenSourceListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class OpenSourceInteractor: PresentableInteractor<OpenSourcePresentable> {

    weak var router: OpenSourceRouting?
    weak var listener: OpenSourceListener?

    init(presenter: OpenSourcePresentable,
         openSourceStream: OpenSourceStream) {
        self.openSourceStream = openSourceStream
        super.init(presenter: presenter)
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        setRx()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    private let openSourceStream: OpenSourceStream
}

extension OpenSourceInteractor {
    func setRx() {
        presenter.onSelected()
            .subscribe(onNext: { openSource in
                self.openSourceStream.updateOpenSource(openSource: openSource)
                self.router?.routeLicense()
            }).disposeOnDeactivate(interactor: self)
    }
}

// MARK: - OpenSourceInteractable
extension OpenSourceInteractor: OpenSourceInteractable {
    
}
