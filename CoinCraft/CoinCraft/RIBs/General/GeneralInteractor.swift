//
//  GeneralInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import Domain

protocol GeneralRouting: ViewableRouting {
    func swichingSegmentInnerViews(innerViews: [SegmentInnerView], index: GeneralType)
}

protocol GeneralPresentable: Presentable {
    var listener: GeneralPresentableListener? { get set }
    
    func setSegment(innerViews: [SegmentInnerView])
    func presentSafariViewConrtoller(news: PaperViewModel)
}

protocol GeneralListener: class {
    
}

final class GeneralInteractor: PresentableInteractor<GeneralPresentable> {

    weak var router: GeneralRouting?
    weak var listener: GeneralListener?
    
    private var segmentInnerViews: [SegmentInnerView]
    
    init(presenter: GeneralPresentable, innerViews: [SegmentInnerView]) {
        
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

// MARK: - GeneralInteractable
extension GeneralInteractor: GeneralInteractable {
    func presentRequestForGeneral(news: PaperViewModel) {
        presenter.presentSafariViewConrtoller(news: news)
    }
}

// MARK: - GeneralPresentableListener
extension GeneralInteractor: GeneralPresentableListener {
    func getSegmentInfo() {
        presenter.setSegment(innerViews: segmentInnerViews)
    }
    
    func convertIndexToVC(index: GeneralType) {
        if index != .none {
            router?.swichingSegmentInnerViews(innerViews: segmentInnerViews, index: index)
        }
    }
}
