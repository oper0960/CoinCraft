//
//  Indicator.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class IndicatorView {
    
    private var animationView = AnimationView()
    
    enum IndicatorType {
        case loading
    }
    
    init(type: IndicatorType) {
        self.type = type
    }
    
    private let type: IndicatorType
    
    func play(superView: UIView) {
        switch type {
        case .loading:
            animationView = AnimationView(name: "14975-loading")
        }
        
        animationView.contentMode = .scaleAspectFill
        animationView.tag = 0
        
        superView.addSubview(animationView)
        animationView.snp.makeConstraints {
            $0.center.equalTo(superView.snp.center)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func stop() {
        animationView.stop()
        animationView.removeFromSuperview()
    }
}
