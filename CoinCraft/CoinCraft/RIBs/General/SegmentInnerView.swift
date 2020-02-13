//
//  SegmentInnerView.swift
//  CoinCraft
//
//  Created by Buxi on 2020/01/31.
//  Copyright © 2020 Buxi. All rights reserved.
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
