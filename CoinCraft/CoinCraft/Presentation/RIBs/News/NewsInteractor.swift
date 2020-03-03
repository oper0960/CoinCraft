//
//  NewsInteractor.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import Domain

protocol NewsRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol NewsPresentable: Presentable {
    var listener: NewsPresentableListener? { get set }
    
    // MARK: - To ViewController
    func setNews(news: [NewsViewable])
    func stopIndicator()
}

protocol NewsListener: class {
    func presentRequestNews(news: NewsViewable)
}

final class NewsInteractor: PresentableInteractor<NewsPresentable>, NewsInteractable {
    
    weak var router: NewsRouting?
    weak var listener: NewsListener?
    
    private let newsUseCase: NewsUseCase
    private var news = [NewsViewable]()
    private let disposeBag = DisposeBag()

    init(presenter: NewsPresentable, newsUseCase: NewsUseCase) {
        
        self.newsUseCase = newsUseCase
        
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

extension NewsInteractor: NewsPresentableListener {
    func getNewsList() {
        newsUseCase.getNewsList().subscribe(onNext: { [weak self] news in
            guard let self = self else { return }
            self.news = news
            self.presenter.setNews(news: news)
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func getSelectedNews(index: Int) {
        listener?.presentRequestNews(news: self.news[index])
        presenter.stopIndicator()
    }
}
