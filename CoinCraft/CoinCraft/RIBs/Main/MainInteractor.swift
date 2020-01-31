//
//  MainInteractor.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    func convertTabbarInnerViews(innerViews: [TabbarInnerView])
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    
    func changeNavigationTitle(title: String)
}

protocol MainListener: class {
    
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable {

    weak var router: MainRouting?
    weak var listener: MainListener?
    
    private var tabbarInnerViews: [TabbarInnerView]

    init(presenter: MainPresentable, tabbarViews: [TabbarInnerView]) {
        
        self.tabbarInnerViews = tabbarViews
        
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.convertTabbarInnerViews(innerViews: tabbarInnerViews)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension MainInteractor: MainPresentableListener {
    func convertTitle(selectView: UIViewController) {
        presenter.changeNavigationTitle(title: tabbarInnerViews[selectView.tabBarItem.tag].name)
    }
}
