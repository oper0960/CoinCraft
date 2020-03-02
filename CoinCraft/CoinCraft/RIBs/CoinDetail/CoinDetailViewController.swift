//
//  CoinDetailViewController.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Domain

protocol CoinDetailPresentableListener: class {
    func getViewModel()
}

final class CoinDetailViewController: UIViewController {
    
    weak var listener: CoinDetailPresentableListener?
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    enum Menu {
        case desc, feature, coinSupply, startDate
    }
    
    private lazy var menuArray: [Menu] = {
        guard let coinInfo = coinInfo else { return [Menu]() }
        var array = [Menu]()
        if let desc = coinInfo.description, !desc.isEmpty { array.append(.desc) }
        if let features = coinInfo.features, !features.isEmpty { array.append(.feature) }
        array.append(.coinSupply)
        array.append(.startDate)
        return array
    }()
    
    private var coinInfo: CompareCoinDetailViewModel? {
        didSet {
            detailTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension CoinDetailViewController {
    func setup() {
        detailTableView.register(UINib(nibName: "CoinDetailFirstHeaderCell", bundle: nil), forCellReuseIdentifier: "firstHeaderCell")
        detailTableView.register(UINib(nibName: "CoinDetailOtherHeaderCell", bundle: nil), forCellReuseIdentifier: "otherHeaderCell")
        detailTableView.register(UINib(nibName: "CoinDetailTextViewCell", bundle: nil), forCellReuseIdentifier: "textViewCell")
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        listener?.getViewModel()
    }
}

// MARK: - CoinDetailPresentable
extension CoinDetailViewController: CoinDetailPresentable {
    func bindViewModel(viewModel: CompareCoinDetailViewModel) {
        self.coinInfo = viewModel
    }
}

// MARK: - CoinDetailViewControllable
extension CoinDetailViewController: CoinDetailViewControllable {
    
}

extension CoinDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch menuArray[section] {
        case .desc:
            return 200
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch menuArray[section] {
        case .desc:
            let firstHeader = tableView.dequeueReusableCell(withIdentifier: "firstHeaderCell") as! CoinDetailFirstHeaderCell
            firstHeader.delegate = self
            if let info = coinInfo {
                firstHeader.bind(info: info)
            }
            return firstHeader
        case .feature:
            let otherHeader = tableView.dequeueReusableCell(withIdentifier: "otherHeaderCell") as! CoinDetailOtherHeaderCell
            otherHeader.bindFeature()
            return otherHeader
        case .coinSupply:
            let otherHeader = tableView.dequeueReusableCell(withIdentifier: "otherHeaderCell") as! CoinDetailOtherHeaderCell
            
            if let info = coinInfo {
                otherHeader.bindTotalCoinSupply(totalCoinSupply: info.totalCoinSupply)
            }
            
            return otherHeader
        case .startDate:
            let otherHeader = tableView.dequeueReusableCell(withIdentifier: "otherHeaderCell") as! CoinDetailOtherHeaderCell
            
            if let info = coinInfo {
                otherHeader.bindStartDate(startDate: info.startDate)
            }
            
            return otherHeader
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch menuArray[section] {
        case .desc, .feature:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch menuArray[indexPath.section] {
        case .desc:
            let descCell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as! CoinDetailTextViewCell
            
            if let info = coinInfo {
                descCell.bind(info: info.description ?? "")
            }
            
            return descCell
        case .feature:
            let featureCell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as! CoinDetailTextViewCell
            
            if let info = coinInfo {
                featureCell.bind(info: info.features ?? "")
            }
            
            return featureCell
        default:
            return UITableViewCell()
        }
    }
}

extension CoinDetailViewController: DetailHeaderDelegate {
    func setBackground(color: UIColor) {
        backgroundView.backgroundColor = color
    }
}
