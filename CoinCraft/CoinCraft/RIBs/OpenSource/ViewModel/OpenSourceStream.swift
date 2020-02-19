//
//  OpenSourceStream.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/18.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import RxSwift

protocol OpenSourceStream {
    var openSource: Observable<OpenSource> { get }
    
    func updateOpenSource(openSource: OpenSource)
}

class openSourceStreamImpl: OpenSourceStream {
    
    init() {}
    
    var openSource: Observable<OpenSource> {
        return variable
            .asObservable()
            .distinctUntilChanged  { (lhs: OpenSource, rhs: OpenSource) -> Bool in
                return OpenSource.equals(lhs: lhs, rhs: rhs)
        }
    }

    func updateOpenSource(openSource: OpenSource) {
        variable.value = openSource
    }

    // MARK: - Private
    private let variable = Variable<OpenSource>(OpenSource("", license: .mit(year: "", name: "")))
}
