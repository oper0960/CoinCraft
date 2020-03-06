//
//  CoinViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/30.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import Lottie
import Domain

protocol CoinPresentableListener: class {
    // MARK: - To Interactor
    func getCoinMarketCapList(start: String, limit: String)
    func getCompareCoinInfo(coin: CoinViewable)
}

final class CoinViewController: UIViewController {
    
    weak var listener: CoinPresentableListener?
    
    @IBOutlet weak var coinTableView: UITableView!
    
    private let indicator = IndicatorView(type: .loading)
    private var coins = [CoinViewable]() {
        didSet {
            coinTableView.reloadData()
        }
    }
    
    private var start: Int = 1
    private var limit: Int = 100
    private var isLoadMore: Bool = false
    
    private let refresh = UIRefreshControl()
    private var disposeBag = DisposeBag()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.play(view: self.view)
        setTableView()
        setRx()
        
        listener?.getCoinMarketCapList(start: start.description, limit: limit.description)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - Setup
extension CoinViewController {
    private func setTableView() {
        coinTableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        coinTableView.delegate = self
        coinTableView.dataSource = self
        coinTableView.refreshControl = refresh
    }
    
    private func setRx() {
        coinTableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.indicator.play(view: self.view)
                self.listener?.getCompareCoinInfo(coin: self.coins[indexPath.row])
                }, onError: { error in
                    print(error)
            }, onDisposed: {
                self.indicator.stop()
            }).disposed(by: disposeBag)
        
        refresh.rx
            .controlEvent(.valueChanged)
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.start = 1
                self.limit = 100
                self.listener?.getCoinMarketCapList(start: self.start.description, limit: self.limit.description)
                self.refresh.endRefreshing()
        }.disposed(by: disposeBag)
    }
}

// MARK: - CoinPresentable
extension CoinViewController: CoinPresentable {
    func setCoinList(coins: [CoinViewable]) {
        self.coins = self.coins + coins
        isLoadMore = false
    }
    
    func stopIndicator() {
        indicator.stop()
    }
    
    func presentNoInfomationAlert() {
        let alert = UIAlertController(title: "No infomation", message: "This Coin is No infomation", preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - CoinViewControllable
extension CoinViewController: CoinViewControllable {
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CoinViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coinCell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        let coin = coins[indexPath.row]
        coinCell.bind(coin: coin)
        
        
        if !isLoadMore && indexPath.row >= self.coins.count - 3 {
            isLoadMore = true
            
            self.start = self.limit
            self.limit = self.limit + 100
            
            print(">>>>>>>>>>>>>>>>>>>>> start", start)
            print(">>>>>>>>>>>>>>>>>>>>> limit", limit)
            
            indicator.play(view: self.view)
            listener?.getCoinMarketCapList(start: self.start.description, limit: self.limit.description)
        }
        return coinCell
    }
}
