//
//  IcoInteractor.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift

protocol IcoRouting: ViewableRouting {
    func swichingSegmentInnerViews(innerViews: [SegmentInnerView], index: IcoType)
}

protocol IcoPresentable: Presentable {
    var listener: IcoPresentableListener? { get set }
    
    func setSegment(innerViews: [SegmentInnerView])
}

protocol IcoListener: class {
    
}

final class IcoInteractor: PresentableInteractor<IcoPresentable> {

    weak var router: IcoRouting?
    weak var listener: IcoListener?
    
    private var segmentInnerViews: [SegmentInnerView]
    
    init(presenter: IcoPresentable, innerViews: [SegmentInnerView]) {
        
        self.segmentInnerViews = innerViews
        
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

// MARK: - IcoPresentable
extension IcoInteractor: IcoInteractable {
    
}

// MARK: - IcoPresentableListener
extension IcoInteractor: IcoPresentableListener {
    func getSegmentInfo() {
        presenter.setSegment(innerViews: segmentInnerViews)
    }
    
    func convertIndexToVC(index: IcoType) {
        if index != .none {
            router?.swichingSegmentInnerViews(innerViews: segmentInnerViews, index: index)
        }
    }
}
