//
//  CoinViewController.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/30.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import Lottie

protocol CoinPresentableListener: class {
    func getCoinMarketCapList()
    func getCompareCoinInfo(coin: CoinViewModel)
}

final class CoinViewController: UIViewController {
    
    weak var listener: CoinPresentableListener?
    
    @IBOutlet weak var coinTableView: UITableView!
    
    private let indicator = IndicatorView(type: .loading)
    private var coins = [CoinViewModel]() {
        didSet {
            coinTableView.reloadData()
        }
    }
    
    let refresh = UIRefreshControl()
    let disposeBag = DisposeBag()
    
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.play(superView: self.view)
        setTableView()
        setRx()
        
        listener?.getCoinMarketCapList()
        startTimer()
    }
}

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
            .subscribe { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .next(let indexPath):
                    self.indicator.play(superView: self.view)
                    self.listener?.getCompareCoinInfo(coin: self.coins[indexPath.row])
                case .error(let error):
                    print(error)
                case .completed:
                    break
                }
        }.disposed(by: disposeBag)
        
        refresh.rx
            .controlEvent(.valueChanged)
            .subscribe { [weak self] _ in
                self?.listener?.getCoinMarketCapList()
                self?.refresh.endRefreshing()
        }.disposed(by: disposeBag)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(getList), userInfo: nil, repeats: true)
    }
    
    @objc private func getList() {
        listener?.getCoinMarketCapList()
    }
}

extension CoinViewController: CoinViewControllable {
    func present(viewController: ViewControllable) {
        indicator.stop()
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        
    }
}

extension CoinViewController: CoinPresentable {
    func setCoinList(coins: [CoinViewModel]) {
        self.coins = coins
        indicator.stop()
    }
}

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
