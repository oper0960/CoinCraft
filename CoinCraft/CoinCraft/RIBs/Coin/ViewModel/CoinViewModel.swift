//
//  CoinViewModel.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

// MARK: - CMCCoin ViewModel
protocol CoinViewModelViewable {
    var imageURL: String { get }
    var name: String { get }
    var coinName: String { get }
    var percentage: Double { get }
    var price: String { get }
    var volume: String { get }
    var sortOrder: String { get }
}

struct CoinViewModel: CoinViewModelViewable {
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    var imageURL: String {
        return Constants.CoinMarketCap.imageBaseUrl + (self.coin.symbol ?? "")
    }
    
    var name: String {
        return coin.symbol ?? ""
    }
    
    var coinName: String {
        return coin.name ?? ""
    }
    
    var percentage: Double {
        return Double(coin.percent_change_24h ?? "0") ?? 0
    }
    
    var price: String {
        let doublePrice = Double(coin.price_usd ?? "0")
        return "$\(doublePrice?.addComma ?? "0")"
    }
    
    var volume: String {
        let doubleVolume = Double(coin.volume_usd_24h ?? "0")
        return "(24Hour) $\(doubleVolume?.addComma ?? "0")"
    }
    
    var sortOrder: String {
        return coin.rank ?? "0"
    }
}

// MARK: - CompareCoin ViewModel
protocol CompareCoinViewModelViewable {
    var symbol: String { get }
    var id: String { get }
}

struct CompareCoinViewModel: CompareCoinViewModelViewable {
    
    private let coin: CompareCoin
    
    init(coin: CompareCoin) {
        self.coin = coin
    }
    
    var symbol: String {
        return coin.symbol ?? ""
    }
    
    var id: String {
        return coin.id ?? ""
    }
}

// MARK: - CompareCoinDetail ViewModel
protocol CompareCoinDetailViewModelViewable {
    var id: String { get }
    var imageUrl: String? { get }
    var symbol: String { get }
    var name: String { get }
    var description: String? { get }
    var features: String? { get }
    var totalCoinSupply: String { get }
    var startDate: String { get }
}

struct CompareCoinDetailViewModel: CompareCoinDetailViewModelViewable {
    private let detail: CompareCoinDetail
    
    init(detail: CompareCoinDetail) {
        self.detail = detail
    }
    
    var id: String {
        return detail.general?.id ?? ""
    }
    
    var symbol: String {
        return detail.general?.symbol ?? ""
    }
    
    var name: String {
        return detail.general?.name ?? ""
    }
    
    var totalCoinSupply: String {
        if let coinSupply = detail.general?.totalCoinSupply, !coinSupply.isEmpty {
            let supply: Double = Double(coinSupply.trimmingCharacters(in: .whitespacesAndNewlines))!
            return supply.addComma
        } else {
            return "0"
        }
    }
    
    var startDate: String {
        return detail.general?.startDate ?? ""
    }
    
    var description: String? {
        return detail.general?.generalDescription
    }
    
    var features: String? {
        return detail.general?.features
    }
    
    var imageUrl: String? {
        guard let base = detail.seo?.baseImageURL, let image = detail.seo?.ogImageURL else {
            return nil
        }
        return base + image
    }
}
