//
//  Double+.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

extension Double {
    var addComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 3
        return numberFormatter.string(from: self as NSNumber)!
    }
}
