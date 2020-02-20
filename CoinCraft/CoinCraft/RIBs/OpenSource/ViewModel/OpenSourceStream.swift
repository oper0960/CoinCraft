//
//  OpenSourceStream.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/18.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RxSwift
import RxCocoa

protocol OpenSourceStream {
    var openSource: BehaviorRelay<OpenSource> { get }
    
    func updateOpenSource(openSource: OpenSource)
}

class openSourceStreamImpl: OpenSourceStream {
    var openSource: BehaviorRelay<OpenSource> = BehaviorRelay<OpenSource>(value: OpenSource("", license: .mit(year: "", name: "")))
    
    func updateOpenSource(openSource: OpenSource) {
        self.openSource.accept(openSource)
    }
    
    
//    init() {}
//
//    var openSource: Observable<OpenSource> {
//        return variable
//            .asObservable()
//            .distinctUntilChanged  { (lhs: OpenSource, rhs: OpenSource) -> Bool in
//                return OpenSource.equals(lhs: lhs, rhs: rhs)
//        }
//    }
//
//    func updateOpenSource(openSource: OpenSource) {
//        variable.accept(openSource)
//    }
//
//    // MARK: - Private
//    private let variable = BehaviorRelay<OpenSource>(value: OpenSource("", license: .mit(year: "", name: "")))
    
    
}
