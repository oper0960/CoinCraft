//
//  MiningDataStore.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - 상황에 따라 가공할 데이터를 요청

public protocol MiningDataStore {
    func getMiningList() -> Observable<[MiningViewable]>
}
