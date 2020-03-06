//
//  CoinMarketCap.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - CMCCoin ViewModel
public protocol CoinViewable {
    var imageURL: String { get }
    var symbol: String { get }
    var name: String { get }
    var percentage: Double { get }
    var price: String { get }
}





