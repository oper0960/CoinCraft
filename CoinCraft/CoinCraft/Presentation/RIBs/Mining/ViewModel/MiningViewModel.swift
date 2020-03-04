//
//  MiningViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation
import Domain

struct MiningViewModel: MiningViewable {
    
    private let datum: Datum
    
    init(datum: Datum) {
        self.datum = datum
    }
    
    var id: String {
        return datum.id ?? ""
    }
}
