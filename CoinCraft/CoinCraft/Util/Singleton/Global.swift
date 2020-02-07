//
//  Global.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/07.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

class Global {
    static let current = Global()
    
    private init() {}
    
    private let serialQueue = DispatchQueue(label: "serial")
    
    private var _cryptoCoins: [CompareCoin] = []
    
    var cryptoCoins: [CompareCoin] {
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
