//
//  CryptoCompareCoinViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain

struct CryptoCompareCoinViewModel: CoinMasterViewable {
    
    private let coin: CryptoCompareCoin
    
    init(coin: CryptoCompareCoin) {
        self.coin = coin
    }
    
    var symbol: String {
        return coin.symbol ?? ""
    }
    
    var id: String {
        return coin.id ?? ""
    }
}
