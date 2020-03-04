//
//  News.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/26.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - News ViewModel
public protocol NewsViewable {
    var id: String { get }
    var guid: String { get }
    var title: String { get }
    var url: String { get }
    var imageUrl: String { get }
    var body: String { get }
    var sourceName: String { get }
    var sourceImageUrl: String { get }
    var tags: String { get }
}






