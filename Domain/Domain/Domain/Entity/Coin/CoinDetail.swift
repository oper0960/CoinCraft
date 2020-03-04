//
//  CryptoCompareDetail.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - CryptoCompareDetail ViewModel
public protocol CoinDetailViewable {
    var id: String { get }
    var imageUrl: String? { get }
    var symbol: String { get }
    var name: String { get }
    var description: String? { get }
    var features: String? { get }
    var totalCoinSupply: String { get }
    var startDate: String { get }
}
