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
    var mineable: String { get }
    var maxSupply: String { get }
    var circulatingSupply: String { get }
    var totalSupply: String { get }
    var price: String { get }
    var volume24h: String { get }
    var change1h: Double { get }
    var change24h: Double { get }
    var change7d: Double { get }
}





