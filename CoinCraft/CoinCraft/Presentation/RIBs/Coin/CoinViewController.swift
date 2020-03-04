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
    func getCoinMarketCapList()
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
    
    private let refresh = UIRefreshControl()
    private var disposeBag = DisposeBag()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.play(superView: self.view)
        setTableView()
        setRx()
        
        listener?.getCoinMarketCapList()
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
                self.indicator.play(superView: self.view)
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
                self.listener?.getCoinMarketCapList()
                self.refresh.endRefreshing()
        }.disposed(by: disposeBag)
    }
    
    @objc private func getList() {
        listener?.getCoinMarketCapList()
    }
}

// MARK: - CoinPresentable
extension CoinViewController: CoinPresentable {
    func setCoinList(coins: [CoinViewable]) {
        self.coins = coins
    }
    
    func stopIndicator() {
        indicator.stop()
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
        return coinCell
    }
}
