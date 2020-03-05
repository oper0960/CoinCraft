//
//  MiningInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import Domain

protocol MiningRouting: ViewableRouting {
    // TODO: 해당 RIB Router 를 통해 Sub-tree 를 관리하기 위해 구현
}

protocol MiningPresentable: Presentable {
    var listener: MiningPresentableListener? { get set }
    // TODO: Presenter 를 통해 ViewController로 전달할 메소드, 프로퍼티를 구현.
    func setMinings(minings: [MiningViewable])
    func stopIndicator()
}

protocol MiningListener: class {
    // TODO: 부모 RIB 과의 통신을 위해 부모 RIB Interactor로 전달할 메소드, 프로퍼티 구현.
    func requestWebsite(url: String)
}

final class MiningInteractor: PresentableInteractor<MiningPresentable> {

    weak var router: MiningRouting?
    weak var listener: MiningListener?
    
    private let miningUseCase: MiningUseCase
    private var minings = [MiningViewable]()
    private let disposeBag = DisposeBag()

    init(presenter: MiningPresentable, miningUseCase: MiningUseCase) {
        
        self.miningUseCase = miningUseCase
        
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

extension MiningInteractor: MiningInteractable {
    
}

extension MiningInteractor: MiningPresentableListener {
    func getMinings() {
        miningUseCase.getMiningList().subscribe(onNext: { [weak self] minings in
            guard let self = self else { return }
            
            let miningArray = minings.sorted {
                $0.sortOrder > $1.sortOrder
            }
            
            self.minings = miningArray
            self.presenter.setMinings(minings: miningArray)
            }, onError: { error in
                print(error.localizedDescription)
        }, onDisposed: {
            self.presenter.stopIndicator()
        }).disposed(by: disposeBag)
    }
    
    func selectedTwitter(index: Int) {
        listener?.requestWebsite(url: minings[index].twitter)
    }
    
    func selectedWebsite(index: Int) {
        listener?.requestWebsite(url: minings[index].url)
    }
}
