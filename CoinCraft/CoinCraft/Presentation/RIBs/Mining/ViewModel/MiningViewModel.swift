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
    
    var name: String {
        return datum.name ?? ""
    }
    
    var coinUrl: String {
        return datum.affiliateURL ?? ""
    }
    
    var url: String {
        guard let url = datum.url else { return "" }
        return "\(Constants.General.Mining.imageBaseUrl)\(url)"
    }
    
    var averageFee: String {
        return datum.averageFee ?? "none"
    }
    
    var logoUrl: String {
        guard let logoUrl = datum.logoURL else { return "" }
        return "\(Constants.General.Mining.imageBaseUrl)\(logoUrl)"
    }
    
    var serverLocations: [String] {
        return datum.serverLocations ?? []
    }
    
    var twitter: String {
        guard let twitter = datum.twitter else { return "" }
        guard !twitter.isEmpty else { return "" }
        return "https://twitter.com/\(twitter)"
    }
    
    var poolFeatures: [String] {
        return datum.poolFeatures ?? []
    }
    
    var coins: [String] {
        return datum.coins ?? []
    }
    
    var paymentType: [String] {
        return datum.paymentType ?? []
    }
    
    var sortOrder: String {
        return datum.sortOrder!
    }
}
