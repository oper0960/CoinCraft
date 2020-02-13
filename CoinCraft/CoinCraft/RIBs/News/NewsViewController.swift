//
//  NewsViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SafariServices

protocol NewsPresentableListener: class {
    // MARK: - To Interactor
    func getNewsList()
    func getSelectedNews(index: Int)
}

final class NewsViewController: UIViewController {

    weak var listener: NewsPresentableListener?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    private let indicator = IndicatorView(type: .loading)
    private var news = [NewsViewModel]() {
        didSet {
            newsTableView.reloadData()
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.play(superView: self.view)
        setTableView()
        setRx()
        
        listener?.getNewsList()
    }
}

// MARK: - Setup
extension NewsViewController {
    private func setTableView() {
        newsTableView.register(UINib(nibName: "NewsCardCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    private func setRx() {
        newsTableView.rx
            .itemSelected
            .subscribe { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .next(let indexPath):
                    self.indicator.play(superView: self.view)
                    self.listener?.getSelectedNews(index: indexPath.row)
                case .error(let error):
                    print(error)
                case .completed:
                    break
                }
        }.disposed(by: disposeBag)
    }
}

// MARK: - NewsPresentable
extension NewsViewController: NewsPresentable {
    func setNews(news: [NewsViewModel]) {
        self.news = news
        indicator.stop()
    }
    
    func stopIndicator() {
        indicator.stop()
    }
}

// MARK: - NewsViewControllable
extension NewsViewController: NewsViewControllable {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCardCell
        newsCell.bind(news: news[indexPath.row])
        return newsCell
    }
}
