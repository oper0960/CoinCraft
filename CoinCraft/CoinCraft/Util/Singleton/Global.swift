//
//  Global.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/07.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Domain

class Global {
    static let current = Global()
    
    private init() {}
    
    private let serialQueue = DispatchQueue(label: "serial")
    
    private var _cryptoCoins: [CompareCoinViewModel] = []
    
    var cryptoCoins: [CompareCoinViewModel] {
        get {
            return _cryptoCoins
        }
        set {
            self.serialQueue.sync {
                self._cryptoCoins = newValue
            }
        }
    }
}
