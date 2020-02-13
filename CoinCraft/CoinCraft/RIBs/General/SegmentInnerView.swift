//
//  SegmentInnerView.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/01/31.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RIBs

protocol SegmentInnerViewListener: class {
    func presentRequestForGeneral(news: NewsViewModel)
}

protocol SegmentBuildable: Buildable {
    func build(withListener listener: SegmentInnerViewListener) -> ViewableRouting
}

protocol SegmentInnerView {
    var name: String { get }
    var builder: SegmentBuildable { get }
}
