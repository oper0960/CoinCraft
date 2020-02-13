//
//  NewsInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift

protocol NewsRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol NewsPresentable: Presentable {
    var listener: NewsPresentableListener? { get set }
    
    // MARK: - To ViewController
    func setNews(news: [NewsViewModel])
    func stopIndicator()
}

protocol NewsListener: class {
    func presentRequestNews(news: NewsViewModel)
}

final class NewsInteractor: PresentableInteractor<NewsPresentable>, NewsInteractable {
    
    private let repository = GeneralRepositoryFactory.create(type: .remote)

    weak var router: NewsRouting?
    weak var listener: NewsListener?
    
    private var newsCollection = [NewsViewModel]()

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: NewsPresentable) {
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

extension NewsInteractor: NewsPresentableListener {
    func getNewsList() {
        repository.getNewsList { newsCollection in
            self.newsCollection = newsCollection
            self.presenter.setNews(news: newsCollection)
        }
    }
    
    func getSelectedNews(index: Int) {
        listener?.presentRequestNews(news: self.newsCollection[index])
        presenter.stopIndicator()
    }
}
