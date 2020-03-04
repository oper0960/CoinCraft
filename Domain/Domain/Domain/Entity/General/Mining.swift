//
//  Mining.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - Mining ViewModel
public protocol MiningViewable {
    var id: String { get }
    var name: String { get }
    var coinUrl: String { get }
    var url: String { get }
    var averageFee: String { get }
    var logoUrl: String { get }
    var serverLocations: [String] { get }
    var twitter: String? { get }
    var poolFeatures: [String] { get }
    var coins: [String] { get }
    var paymentType: [String] { get }
}
