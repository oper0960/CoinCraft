//
//  SegmentInnerView.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
//

import RIBs

public protocol SegmentInnerViewListener: class {
    
}

public protocol SegmentBuildable: Buildable {
    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting
}

public protocol SegmentInnerView {
    var name: String { get }
    var builder: SegmentBuildable { get }
}
