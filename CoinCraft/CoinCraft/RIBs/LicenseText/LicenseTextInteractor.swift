//
//  LicenseTextInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/14.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxCocoa
import RxSwift

protocol LicenseTextRouting: ViewableRouting {
    
}

protocol LicenseTextPresentable: Presentable {
    func getLicense() -> PublishRelay<Void>
    func setLicense(license: OpenSource)
}

protocol LicenseTextListener: class {
    
}

final class LicenseTextInteractor: PresentableInteractor<LicenseTextPresentable> {

    weak var router: LicenseTextRouting?
    weak var listener: LicenseTextListener?

    init(presenter: LicenseTextPresentable,
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

extension LicenseTextInteractor {
    func setRx() {
        presenter.getLicense().subscribe(onNext: { _ in
            self.openSourceStream.openSource.subscribe(onNext: { openSource in
                self.presenter.setLicense(license: openSource)
            }).disposeOnDeactivate(interactor: self)
        }).disposeOnDeactivate(interactor: self)
    }
}

// MARK: - LicenseTextInteractable
extension LicenseTextInteractor: LicenseTextInteractable {
    
}
